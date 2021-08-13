package pl.ilonaptak.OptimalizeANDget_DNA.accessory;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.ExperimentService;
import pl.ilonaptak.OptimalizeANDget_DNA.ingredient.Ingredient;
import pl.ilonaptak.OptimalizeANDget_DNA.reaction.Reaction;
import pl.ilonaptak.OptimalizeANDget_DNA.user.CurrentUser;
import pl.ilonaptak.OptimalizeANDget_DNA.user.User;

import javax.validation.Valid;

@Controller
@RequestMapping("/accessory")
@RequiredArgsConstructor
public class AccessoryController {

    private final AccessoryService accessoryService;
    private final ExperimentService experimentService;

    @GetMapping("/add/{id}")
    public String add(Model model, @PathVariable int id) {
        model.addAttribute("experimentId", id);
        model.addAttribute("accessory", new Accessory());
        return "experiment/details";
    }

    @PostMapping("/add/{id}")
    public String add(@Valid Accessory accessory, BindingResult bindingResult, Model model, @PathVariable int id) {

        if (bindingResult.hasErrors()) {
            if (model.getAttribute("ingredient") == null || model.getAttribute("reaction") == null) {
                model.addAttribute("ingredient", new Ingredient());
                model.addAttribute("reaction", new Reaction());
            }
            return "redirect:/experiment/details/" + id;
        }
        try {
//            int experimentId = (int) model.getAttribute("experimentId");
            accessory.setExperiment(experimentService.findById(id));
            accessoryService.save(accessory);
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
        return "redirect:/experiment/details/"+id;
    }



    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable int id, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        User userExperiment = accessoryService.getById(id).getExperiment().getUser();
        int experimentId = accessoryService.getById(id).getExperiment().getId();
        if (user.getId() == userExperiment.getId()) {
            accessoryService.deleteById(id);
        }
        return "redirect:/experiment/details/"+experimentId;
    }

}
