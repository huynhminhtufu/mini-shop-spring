package com.mrhmt.controllers;

import com.mrhmt.entities.Category;
import com.mrhmt.entities.Product;
import com.mrhmt.repositories.CategoryRepository;
import com.mrhmt.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin/products")
public class AdminProductController {
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private CategoryRepository categoryRepository;

    @RequestMapping(value={"", "/index"})
    public ModelAndView productIndex() {
        List<Product> listProducts = productRepository.findAll();

        return new ModelAndView("/admin/products/index", "listProducts", listProducts);
    }

    @RequestMapping(value="/error", method=RequestMethod.GET)
    public ModelAndView error(@RequestParam(value="message", required=false)String message) {
        return new ModelAndView("/error", "message", message);
    }

    @RequestMapping(value="/create", method=RequestMethod.GET)
    public ModelAndView productCreate(ModelMap modelMap) {
        modelMap.put("listCategory", categoryRepository.findAll());
        return new ModelAndView("/admin/products/create", "product", new Product());
    }

    @RequestMapping(value="/create", method=RequestMethod.POST)
    public String productCreate(@Valid @ModelAttribute("category") Product product, BindingResult bindingResult, ModelMap modelMap) {
        if (bindingResult.hasErrors()) {
            return "redirect:error?message=invalid+type";
        }

        if (product.getName().trim().equals("")) {
            return "redirect:error?message=null+field";
        }

        productRepository.save(product);

        return "redirect:index";
    }

    @RequestMapping("/edit")
    public ModelAndView productEdit(@RequestParam("id")int id, ModelMap modelMap) {
        Product product = productRepository.findOne(id);
        List<Category> listCategory = categoryRepository.findAll();

        modelMap.put("listCategory", listCategory);

        return new ModelAndView("/admin/products/edit", "product", product);
    }

    @RequestMapping(value="/edit", method=RequestMethod.POST)
    public String productEdit(@Valid @ModelAttribute("product")Product product, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "redirect:error?message=invalid+type";
        }

        try {
            productRepository.save(product);
        } catch (Exception ex) {
            ex.printStackTrace();

            return "redirect:error?message=unknow";
        }

        return "redirect:index";
    }

    @RequestMapping("/delete")
    public String productDelete(@RequestParam("id")int id) {
        try {
            productRepository.delete(id);
        } catch (Exception ex) {
            ex.printStackTrace();

            return "redirect:error?message=cannot+delete";
        }

        return "redirect:index";
    }
}
