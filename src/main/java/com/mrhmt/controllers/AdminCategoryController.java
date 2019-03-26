package com.mrhmt.controllers;

import com.mrhmt.entities.Category;
import com.mrhmt.repositories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
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
    public ModelAndView categoryIndex() {
        List<Category> listCategories = categoryRepository.findAll();

        return new ModelAndView("/admin/categories/index", "listCategories", listCategories);
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
