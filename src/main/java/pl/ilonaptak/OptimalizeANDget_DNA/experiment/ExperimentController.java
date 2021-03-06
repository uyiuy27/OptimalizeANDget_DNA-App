package pl.ilonaptak.OptimalizeANDget_DNA.experiment;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.ilonaptak.OptimalizeANDget_DNA.accessory.Accessory;
import pl.ilonaptak.OptimalizeANDget_DNA.accessory.AccessoryService;
import pl.ilonaptak.OptimalizeANDget_DNA.ingredient.Ingredient;
import pl.ilonaptak.OptimalizeANDget_DNA.ingredient.IngredientService;
import pl.ilonaptak.OptimalizeANDget_DNA.reaction.Reaction;
import pl.ilonaptak.OptimalizeANDget_DNA.reaction.ReactionService;
import pl.ilonaptak.OptimalizeANDget_DNA.user.CurrentUser;
import pl.ilonaptak.OptimalizeANDget_DNA.user.entity.User;
import pl.ilonaptak.OptimalizeANDget_DNA.user.UserService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/experiment")
@RequiredArgsConstructor
public class ExperimentController {

    private final ExperimentService experimentService;
    private final UserService userService;
    private final AccessoryService accessoryService;
    private final IngredientService ingredientService;
    private final ReactionService reactionService;

    /**
     * Endpoint odpowiadający za dodawanie eksperymentu
     * @param model
     * @param currentUser
     * @return
     */
    @GetMapping("/add")
//    @ResponseBody
    public String add(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        model.addAttribute("experiment", new Experiment());
        model.addAttribute("userId", user.getId());
        model.addAttribute("userName", user.getUsername());
        boolean isCopied = false;
        if (!isCopied) {
            model.addAttribute("copy", "has not been copied");
        }
        if(user.getRole().equals("ROLE_ADMIN")) {
            model.addAttribute("admin", user.getRole());
        }
        return "experiment/form";
    }

    @PostMapping("/add")
    public String add(@Valid Experiment experiment, BindingResult bindingResult, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        if (bindingResult.hasErrors()) {
            return "experiment/form";
        }
        if(experiment.getVisibility() == null) {
            experiment.setVisibility("private");
        }
        User user = currentUser.getUser();
        int userId = user.getId();
        experiment.setUser(userService.findById(userId));

        experimentService.save(experiment);
        return "redirect:/user/account/"+userId;
    }

    /**
     * Edycja eksperymentu
     * @param id
     * @param model
     * @param currentUser
     * @return
     */
    @GetMapping("/update/{id}")
    public String update(@PathVariable int id, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        Experiment experiment = experimentService.findById(id);
        if (experiment.getUser().getUsername().equals(experiment.getAddedBy())) {
            model.addAttribute("copy", "has not been copied");
        }
        model.addAttribute("experiment", experimentService.findById(id));
        model.addAttribute("userId", user.getId());
        model.addAttribute("userName", user.getUsername());
        return "/experiment/form";
    }


    @PostMapping("/update/{id}")
    public String update(@PathVariable int id, @Valid Experiment experiment, BindingResult bindingResult, @AuthenticationPrincipal CurrentUser currentUser) {
        if (bindingResult.hasErrors()) {
//            model.addAttribute("experiment", experimentService.findById(id)); // sprawdzić czy to się przyda
            return "experiment/form";
        }
        User user = currentUser.getUser();
        User userExperiment = experimentService.findById(id).getUser();
        if (user.getId() == userExperiment.getId()) {
            if(experiment.getVisibility() == null) {
                experiment.setVisibility("private");
            }
            experiment.setUser(user);
            experimentService.save(experiment);
        }
        return "redirect:/user/account/"+user.getId();
    }

    /**
     * Potwierdzenie chęci usunięcia eksperymentu
     * @param id
     * @param currentUser
     * @param model
     * @return
     */
    @GetMapping("/confirm/{id}")
    public String confirmDelete(@PathVariable int id, @AuthenticationPrincipal CurrentUser currentUser, Model model) {
        User cuUser = currentUser.getUser();
        User userExperiment = experimentService.findById(id).getUser();
        if (cuUser.getId() == userExperiment.getId()) {
            model.addAttribute("id", id);
            model.addAttribute("userId", cuUser.getId());
            model.addAttribute("userName", cuUser.getUsername());
            return "experiment/confirm";
        } else {
            return "redirect:/logout";
        }
    }

    /**
     * Usuwanie eksperymentu
     * @param id
     * @param currentUser
     * @return
     */
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        User userExperiment = experimentService.findById(id).getUser();
        if (user.getId() == userExperiment.getId()) {
            experimentService.delete(id);
        }
        return "redirect:/user/account/"+user.getId();
    }

    /**
     * Szczegóły eksperymentu. Eksperymenty publiczne widoczne dla wszystkich zalogowanych użytkowników
     * @param id
     * @param model
     * @param currentUser
     * @return
     */
    @GetMapping("/details/{id}")
    public String details(@PathVariable int id, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if (experimentService.existsById(id)) {
            User userExperiment = experimentService.findById(id).getUser();
            if (experimentService.findById(id).getVisibility().equals("public") || user.getId() == userExperiment.getId()) {
                model.addAttribute("experiment", experimentService.findById(id));
                model.addAttribute("accessories", accessoryService.findAllByExperimentId(id));
                model.addAttribute("accessory", new Accessory());
                model.addAttribute("ingredients", ingredientService.findAllByExperimentId(id));
                model.addAttribute("ingredient", new Ingredient());
                model.addAttribute("reactions", reactionService.findAllByExperimentId(id));
                model.addAttribute("reaction", new Reaction());
                if (user.getId() == userExperiment.getId()) {
                    model.addAttribute("user", user);
                }
                List<Experiment> experimentList = experimentService.findAllByUserId(user.getId());
                for (Experiment experiment : experimentList) {
                    if (user.getId() == userExperiment.getId() || experimentService.findById(id).getName().equals(experiment.getName())) {
                        model.addAttribute("cantAdd", "cantAdd");
                    }
                }
                if (user.getRole().equals("ROLE_ADMIN")) {
                    model.addAttribute("admin", user.getRole());
                }
                model.addAttribute("userId", user.getId());
                return "experiment/details";
            }
        }

        return "redirect:/";
    }

    /**
     * Endpoint dodawania eksperymentów innych użytkowników do własnej listy
     * @param id
     * @param currentUser
     * @return
     */
    @GetMapping("addtoexperiments/{id}")
    public String addToUserExperiments(@PathVariable int id, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        experimentService.saveByOtherUser(id, user.getId());
        return "redirect:/user/account/" + user.getId();
    }
}



