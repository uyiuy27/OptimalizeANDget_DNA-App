package pl.ilonaptak.OptimalizeANDget_DNA.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;
import pl.ilonaptak.OptimalizeANDget_DNA.user.UserService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


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

    @GetMapping("/logout")
    public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        session.invalidate();
        Cookie cookie = WebUtils.getCookie(request, "JSESSIONID");
        if (cookie != null) {
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
        return "redirect:/";
    }

}
