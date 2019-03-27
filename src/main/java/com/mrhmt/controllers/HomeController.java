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
    public ModelAndView index(@RequestParam(value="page", required=false)Integer page, @RequestParam(value="keyword", required=false)String keyword, ModelMap modelMap) {
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
        modelMap.put("listProduct", listProductPaging);

        List<Category> listCategory = categoryRepository.findAll();

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
