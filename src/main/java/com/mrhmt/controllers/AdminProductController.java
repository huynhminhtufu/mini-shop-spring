package com.mrhmt.controllers;

import com.mrhmt.entities.Category;
import com.mrhmt.entities.Product;
import com.mrhmt.repositories.CategoryRepository;
import com.mrhmt.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
    public ModelAndView productIndex(@RequestParam(value="page", required=false)Integer page, @RequestParam(value="keyword", required=false)String keyword, ModelMap modelMap) {
        if (page == null || page < 0) {
            page = 0;
        }

        Sort sort = new Sort(new Sort.Order(Sort.Direction.ASC, "name"));
        Pageable pageable = new PageRequest(page, 2, sort);

        List<Product> listProduct;
        List<Product> listProductPaging;

        if (keyword == null) {
            listProduct = productRepository.findAll();
            listProductPaging = productRepository.paging(pageable);
        } else {
            listProduct = productRepository.findByNameContains(keyword);
            listProductPaging = productRepository.findAndPaging(keyword, pageable);
        }

        int totalPage = (int)(Math.ceil((double)listProduct.size()/2));

        if (page >= totalPage - 1) {
            page = totalPage - 1;
        }

        modelMap.put("page", page);
        modelMap.put("keyword", keyword);
        modelMap.put("total_page", totalPage);

        return new ModelAndView("/admin/products/index", "listProducts", listProductPaging);
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
