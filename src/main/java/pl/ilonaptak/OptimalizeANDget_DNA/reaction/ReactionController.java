package pl.ilonaptak.OptimalizeANDget_DNA.reaction;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.ilonaptak.OptimalizeANDget_DNA.accessory.Accessory;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.ExperimentService;
import pl.ilonaptak.OptimalizeANDget_DNA.ingredient.Ingredient;
import pl.ilonaptak.OptimalizeANDget_DNA.user.CurrentUser;
import pl.ilonaptak.OptimalizeANDget_DNA.user.User;

import javax.validation.Valid;

@Controller
@RequestMapping("/reaction")
@RequiredArgsConstructor
public class ReactionController {

    private final ReactionService reactionService;
    private final ExperimentService experimentService;

    @GetMapping("/add/{id}")
    public String add(Model model, @PathVariable int id) {
        model.addAttribute("experimentId", id);
        model.addAttribute("reaction", new Reaction());
        return "experiment/details";
    }

    @PostMapping("/add/{id}")
    public String add(@Valid Reaction reaction, BindingResult bindingResult, Model model, @PathVariable int id) {
        if (bindingResult.hasErrors()) {
            if (model.getAttribute("ingredient") == null || model.getAttribute("reaction") == null) {
                model.addAttribute("ingredient", new Ingredient());
                model.addAttribute("accessory", new Accessory());
            }
            return "redirect:/experiment/details/" + id;
        }
        try {
//            int experimentId = (int) model.getAttribute("experimentId");
            reaction.setExperiment(experimentService.findById(id));
            reactionService.save(reaction);
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
        return "redirect:/experiment/details/" + id;
    }


    @GetMapping("/all/{id}")
    public String findAllForExperiment(Model model, @PathVariable Integer id) {
        model.addAttribute("reactions", reactionService.findAllByExperimentId(id));
        return "reaction/all";
    }

// TODO wymyślić jak ogarnąć update


    @GetMapping("/update/{id}")
    public String update(@PathVariable int id, Model model) {

        model.addAttribute("reaction", reactionService.getById(id));
        return "reaction/form";
    }


    @PostMapping("/update/{id}")
    public String update(@PathVariable int id, @Valid Reaction reaction, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "reaction/form";
        }
        int experimentId = reactionService.getById(id).getExperiment().getId();
        reaction.setExperiment(experimentService.findById(experimentId));
        reactionService.save(reaction);
        return "redirect:/experiment/details/" + experimentId;
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable int id, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        User userExperiment = reactionService.getById(id).getExperiment().getUser();
        int experimentId = reactionService.getById(id).getExperiment().getId();
        if (user.getId() == userExperiment.getId()) {
            reactionService.deleteById(id);
        }
        return "redirect:/experiment/details/" + experimentId;
    }


}
