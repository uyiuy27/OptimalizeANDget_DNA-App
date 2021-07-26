package pl.ilonaptak.OptimalizeANDget_DNA.reaction;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
class ReactionService {

    private final ReactionRepository reactionRepository;

    public List<Reaction> findAll() {
        return reactionRepository.findAll();
    }

    public Reaction getById(Integer id) {
        return reactionRepository.getById(id);
    }

    public List<Reaction> findAllByExperimentId(Integer id) {
        return reactionRepository.findAllByExperimentId(id);
    }

    public void save(Reaction reaction) {
        reactionRepository.save(reaction);
    }

    public void deleteById(Integer id) {
        reactionRepository.deleteById(id);
    }

}
