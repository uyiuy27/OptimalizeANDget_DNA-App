package pl.ilonaptak.OptimalizeANDget_DNA.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.ilonaptak.OptimalizeANDget_DNA.user.UserService;


@Controller
@RequiredArgsConstructor
public class LoginController {

    private final UserService userService;

    @GetMapping("/login")
    public String login() {
        return "home/login";
    }


    @GetMapping("/login/error")
    @ResponseBody
    public String loginError() {
        return "logowanie nie poszło najlepiej :<";
    }

}
