package pl.ilonaptak.OptimalizeANDget_DNA.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class HelloController {

    @RequestMapping("/hello")
    public String hello() {
        return "home";
    }

    @GetMapping("/")
    @ResponseBody
    public String home() {
        return "home";
    }

    @GetMapping("/about")
    @ResponseBody
    public String about() {
        return "about";
    }



}
