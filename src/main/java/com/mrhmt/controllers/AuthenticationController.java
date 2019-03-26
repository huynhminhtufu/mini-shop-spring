package com.mrhmt.controllers;

import com.mrhmt.entities.Role;
import com.mrhmt.entities.User;
import com.mrhmt.repositories.RoleRepository;
import com.mrhmt.repositories.UserRepository;
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

@Controller
@RequestMapping(value="/auth")
public class AuthenticationController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @RequestMapping("/login")
    public ModelAndView getLoginForm(@RequestParam(required=false)String authfailed, String logout, String denied) {
        String message = null;

        if (authfailed != null) {
            message = "Invalid username or password, please try again!";
        } else if (logout != null) {
            message = "Logout successfully, login again to continue!";
        } else if (denied != null) {
            message = "Access denined for this user!";
        }

        return new ModelAndView("/auth/login", "message", message);
    }

    @RequestMapping("/403page")
    public String deniedPage() {
        return "redirect:/auth/login?denied";
    }

    @RequestMapping(value="/error", method=RequestMethod.GET)
    public ModelAndView error(@RequestParam(value="message", required=false)String message) {
        return new ModelAndView("/error", "message", message);
    }

    @RequestMapping("/signup")
    public ModelAndView signUp() {
        return new ModelAndView("/auth/signup", "user", new User());
    }

    @RequestMapping(value="/signup", method=RequestMethod.POST)
    public String signUp(@Valid @ModelAttribute("users")User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "error";
        }

        if (user.getUsername().trim().equals("") || user.getPassword().trim().equals("")) {
            return "redirect:error?message=null+field";
        }

        userRepository.save(user);
        roleRepository.save(new Role("ROLE_USER", user));

        return "redirect:login";
    }
}
