package pl.ilonaptak.OptimalizeANDget_DNA.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String login() {
        return "admin/login";
    }


}
