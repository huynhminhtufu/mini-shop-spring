package com.mrhmt.controllers;

import com.mrhmt.entities.Category;
import com.mrhmt.entities.Product;
import com.mrhmt.repositories.CategoryRepository;
import com.mrhmt.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("")
public class HomeController {
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private ProductRepository productRepository;

    @RequestMapping(value={"", "/index"})
    public ModelAndView index(ModelMap modelMap) {
        List<Category> listCategory = categoryRepository.findAll();
        List<Product> listProduct = productRepository.findAll();

        modelMap.put("listProduct", listProduct);

        return new ModelAndView("index", "listCategory", listCategory);
    }

    @RequestMapping("/category")
    public ModelAndView getCategoryDetails(@RequestParam(value="id")int id, ModelMap modelMap) {
        Category category = categoryRepository.findOne(id);
        List<Product> listProductOfCategory = productRepository.findByCategory_Id(id);

        modelMap.put("category", category);

        return new ModelAndView("/categories/details", "listProduct", listProductOfCategory);
    }

    @RequestMapping("/product")
    public ModelAndView productDetails(@RequestParam(value="id")int id) {
        Product product = productRepository.findOne(id);

        return new ModelAndView("/products/details", "product", product);
    }
}
