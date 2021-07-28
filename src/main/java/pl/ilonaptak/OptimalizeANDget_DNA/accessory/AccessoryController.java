package pl.ilonaptak.OptimalizeANDget_DNA.accessory;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.ExperimentService;
import pl.ilonaptak.OptimalizeANDget_DNA.ingredient.Ingredient;
import pl.ilonaptak.OptimalizeANDget_DNA.reaction.Reaction;

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

    @GetMapping("/all/{id}")
    public String findAllForExperiment(Model model, @PathVariable Integer id) {
        model.addAttribute("accessories", accessoryService.findAllByExperimentId(id));
        return "accessory/all";
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable int id, Model model) {
        model.addAttribute("accessory", accessoryService.getById(id));
        return "accessory/form";
    }

    @PostMapping("/update/{id}")
    @ResponseBody
    public String update(@PathVariable int id, @Valid Accessory accessory, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "accessory/form";
        }
        accessoryService.save(accessory);
        return "redirect:user/experiment/all";
    }

    @RequestMapping("/delete/{id}")
    @ResponseBody
    public String delete(@PathVariable int id) {
        accessoryService.deleteById(id);
        return "deleted";
    }

}
