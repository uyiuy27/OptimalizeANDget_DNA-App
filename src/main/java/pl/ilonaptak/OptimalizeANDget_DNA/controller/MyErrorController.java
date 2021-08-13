package pl.ilonaptak.OptimalizeANDget_DNA.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.ilonaptak.OptimalizeANDget_DNA.user.CurrentUser;
import pl.ilonaptak.OptimalizeANDget_DNA.user.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
public class MyErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if (currentUser != null) {
            User user = currentUser.getUser();
            model.addAttribute("user", user);
            if(user.getRole().equals("ROLE_ADMIN")) {
                model.addAttribute("admin", user.getRole());
            }
        }
        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());

            if(statusCode == HttpStatus.NOT_FOUND.value()) {

                return "errors/error-404";
            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                return "errors/error-500";
            } else if (statusCode == HttpStatus.FORBIDDEN.value()) {
                return "errors/error-403";
            }

        }
        return "errors/error";
    }


}
