package com.mrhmt.controllers;

import com.mrhmt.entities.Cart;
import com.mrhmt.entities.Product;
import com.mrhmt.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/shop")
public class ShoppingController {
    @Autowired
    private ProductRepository productRepository;

    @RequestMapping(value="/error", method=RequestMethod.GET)
    public ModelAndView error(@RequestParam(value="message", required=false)String message) {
        return new ModelAndView("/error", "message", message);
    }

    private int isExistItem(int id, List<Cart> myCart) {
        for (int i = 0; i < myCart.size(); i++) {
            if (myCart.get(i).getProduct().getId() == id) {
                return i;
            }
        }

        return -1;
    }

    private boolean syncAmountDB(int id, int quantity) {
        Product product = productRepository.findOne(id);
        int newAmount = product.getAmount() - quantity;

        if (newAmount < 0) {
            return false;
        }

        product.setAmount(newAmount);
        productRepository.save(product);

        return true;
    }

    @RequestMapping(("/order"))
    public String order(@RequestParam int id, @RequestParam int quantity, HttpSession session) {
        List<Cart> myCart = (List<Cart>) session.getAttribute("cart");

        if (myCart == null) {
            if (syncAmountDB(id, quantity)) {
                myCart = new ArrayList<>();
                myCart.add(new Cart(productRepository.findOne(id), quantity));
            } else {
                return "redirect:error?message=out+of+stock";
            }
        } else {
            int index = isExistItem(id, myCart);
            if (index == -1) {
                if (syncAmountDB(id, quantity)) {
                    myCart.add(new Cart(productRepository.findOne(id), quantity));
                } else {
                    return "redirect:error?message=out+of+stock";
                }
            } else {
                int amount = myCart.get(index).getQuantity();

                if (quantity + amount <= 0) {
                    syncAmountDB(id, quantity);

                    myCart.remove(index);
                } else {
                    if (syncAmountDB(id, quantity)) {
                        myCart.get(index).setQuantity(quantity + amount);
                    } else {
                        return "redirect:error?message=out+of+stock";
                    }
                }
            }
        }

        session.setAttribute("cart", myCart);

        return "redirect:index";
    }

    @RequestMapping(value={"", "/index"})
    public ModelAndView index(HttpSession session, ModelMap modelMap) {
        List<Cart> myCart = (List<Cart>) session.getAttribute("cart");
        double total = calTotal(myCart);
        modelMap.put("total", total);

        return new ModelAndView("/shop/index", "myCart", myCart);
    }

    private double calTotal(List<Cart> myCart) {
        double result = 0.0;

        if (myCart != null) {
            for (Cart item : myCart) {
                result = result + item.getQuantity() + item.getProduct().getPrice();
            }
        }

        return result;
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id")int id, HttpSession session) {
        List<Cart> myCart = (List<Cart>) session.getAttribute("cart");
        int index = isExistItem(id, myCart);

        if (index == -1) {
            return "redirect:index";
        }

        try {
            syncAmountDB(id, myCart.get(index).getQuantity() * -1);

            myCart.remove(index);
        } catch (Exception ex) {
            ex.printStackTrace();

            return "redirect:error?message=unknown";
        }

        return "redirect:index";
    }

    @RequestMapping("/checkout")
    public ModelAndView checkout(ModelMap modelMap, HttpSession session) {
        List<Cart> myCart = (List<Cart>) session.getAttribute("cart");
        double total = calTotal(myCart);

        if (myCart.isEmpty()) {
            return new ModelAndView("/error?message=empty+cart");
        }

        modelMap.put("total", total);

        try {
            myCart.clear();
        } catch (Exception ex) {
            ex.printStackTrace();

            return new ModelAndView("/error?message=cannot+clear+cart");
        }

        return new ModelAndView("/shop/checkout", "myCart", myCart);
    }
}
