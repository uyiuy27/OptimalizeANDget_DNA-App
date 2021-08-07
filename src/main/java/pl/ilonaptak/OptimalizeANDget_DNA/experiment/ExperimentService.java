package pl.ilonaptak.OptimalizeANDget_DNA.experiment;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pl.ilonaptak.OptimalizeANDget_DNA.accessory.Accessory;
import pl.ilonaptak.OptimalizeANDget_DNA.accessory.AccessoryService;
import pl.ilonaptak.OptimalizeANDget_DNA.ingredient.Ingredient;
import pl.ilonaptak.OptimalizeANDget_DNA.ingredient.IngredientService;
import pl.ilonaptak.OptimalizeANDget_DNA.reaction.Reaction;
import pl.ilonaptak.OptimalizeANDget_DNA.reaction.ReactionService;
import pl.ilonaptak.OptimalizeANDget_DNA.user.User;
import pl.ilonaptak.OptimalizeANDget_DNA.user.UserService;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ExperimentService {

    private final ExperimentRepository experimentRepository;
    private final AccessoryService accessoryService;
    private final IngredientService ingredientService;
    private final ReactionService reactionService;
    private final UserService userService;

    public List<Experiment> findAll() {
        return experimentRepository.findAll();
    }

    public Experiment findById(Integer id) {
        return experimentRepository.getById(id);
    }

    public List<Experiment> findAllByVisibility(String visibility) {
        return experimentRepository.findAllByVisibility(visibility);
    }

    public List<Experiment> findAllByUserId(Integer id) {
        return experimentRepository.findAllByUserId(id);
    }

    void save(Experiment experiment) {
//        experiment.setDone(false);
        experiment.setAddedBy(experiment.getUser().getUsername());
        experimentRepository.save(experiment);
    }

    void saveByOtherUser(Integer experimentId, Integer userId) {
        Experiment newExperiment = experimentRepository.getById(experimentId).clone();
        newExperiment.setUser(userService.findById(userId));
        newExperiment.setVisibility("private");
        experimentRepository.save(newExperiment);

        List<Accessory> accessories = accessoryService.findAllByExperimentId(experimentId);
        for (Accessory accessory : accessories) {
            Accessory newAccessory = accessory.clone();
            newAccessory.setExperiment(newExperiment);
            accessoryService.save(newAccessory);
        }

        List<Ingredient> ingredients = ingredientService.findAllByExperimentId(experimentId);
        for (Ingredient ingredient : ingredients) {
            Ingredient newIngredient = ingredient.clone();
            newIngredient.setExperiment(newExperiment);
            ingredientService.save(newIngredient);
        }

        List<Reaction> reactions = reactionService.findAllByExperimentId(experimentId);
        for (Reaction reaction : reactions) {
            Reaction newReaction = reaction.clone();
            newReaction.setExperiment(newExperiment);
            reactionService.save(newReaction);
        }
    }

    void delete(Integer experimentId) {
        List<Accessory> accessories = accessoryService.findAllByExperimentId(experimentId);
        for (Accessory accessory : accessories) {
            accessoryService.deleteById(accessory.getId());
        }

        List<Ingredient> ingredients = ingredientService.findAllByExperimentId(experimentId);
        for (Ingredient ingredient : ingredients) {
            ingredientService.deleteById(ingredient.getId());
        }

        List<Reaction> reactions = reactionService.findAllByExperimentId(experimentId);
        for (Reaction reaction : reactions) {
            reactionService.deleteById(reaction.getId());
        }
        experimentRepository.deleteById(experimentId);
    }






}
