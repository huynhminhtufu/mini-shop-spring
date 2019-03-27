package com.mrhmt.controllers;

import com.mrhmt.entities.Category;
import com.mrhmt.repositories.CategoryRepository;
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
import sun.misc.Request;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin/categories")
public class AdminCategoryController {
    @Autowired
    private CategoryRepository categoryRepository;

    @RequestMapping(value={"", "/index"})
    public ModelAndView categoryIndex(@RequestParam(value="page", required=false)Integer page, @RequestParam(value="keyword", required=false)String keyword, ModelMap modelMap) {
        if (page == null || page < 0) {
            page = 0;
        }

        Sort sort = new Sort(new Sort.Order(Sort.Direction.ASC, "name"));
        Pageable pageable = new PageRequest(page, 2, sort);

        List<Category> listCategory;
        List<Category> listCategoryPaging;
        if (keyword == null) {
            listCategory = categoryRepository.findAll();
            listCategoryPaging = categoryRepository.paging(pageable);
        } else {
            listCategory = categoryRepository.findByNameContains(keyword);
            listCategoryPaging = categoryRepository.findAndPaging(keyword, pageable);
        }

        int totalPage = (int)(Math.ceil((double)listCategory.size()/2));

        if (page >= totalPage - 1) {
            page = totalPage - 1;
        }

        modelMap.put("page", page);
        modelMap.put("keyword", keyword);
        modelMap.put("total_page", totalPage);

        return new ModelAndView("/admin/categories/index", "listCategories", listCategoryPaging);
    }

    @RequestMapping(value="/error", method=RequestMethod.GET)
    public ModelAndView error(@RequestParam(value="message", required=false)String message) {
        return new ModelAndView("/error", "message", message);
    }

    @RequestMapping(value="/create", method=RequestMethod.GET)
    public ModelAndView categoryCreate() {
        return new ModelAndView("/admin/categories/create", "category", new Category());
    }

    @RequestMapping(value="/create", method=RequestMethod.POST)
    public String categoryCreate(@Valid @ModelAttribute("category") Category category, BindingResult bindingResult, ModelMap modelMap) {
        if (bindingResult.hasErrors()) {
            return "error";
        }

        if (category.getName().trim().equals("")) {
            return "redirect:error?message=null+field";
        }

        categoryRepository.save(category);

        return "redirect:index";
    }

    @RequestMapping(value="/details", method=RequestMethod.GET)
    public ModelAndView categoryDetails(@RequestParam("id")int id) {
        return new ModelAndView("/admin/categories/details", "category", categoryRepository.findOne(id));
    }

    @RequestMapping("/edit")
    public ModelAndView categoryEdit(@RequestParam("id")int id) {
        Category category = categoryRepository.findOne(id);

        return new ModelAndView("/admin/categories/edit", "category", category);
    }

    @RequestMapping(value="/edit", method=RequestMethod.POST)
    public String categoryEdit(@Valid @ModelAttribute("category")Category category, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "redirect:error";
        }

        if (category.getName().trim().equals("")) {
            return "redirect:error?message=null+field";
        }

        categoryRepository.save(category);

        return "redirect:index";
    }

    @RequestMapping("/delete")
    public String categoryDelete(@RequestParam("id")int id) {
        try {
            categoryRepository.delete(id);
        } catch (Exception ex) {
            ex.printStackTrace();

            return "redirect:error?message=category+not+null";
        }

        return "redirect:index";
    }
}
