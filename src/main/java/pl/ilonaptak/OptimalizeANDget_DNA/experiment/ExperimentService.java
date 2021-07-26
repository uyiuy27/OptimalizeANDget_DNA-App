package pl.ilonaptak.OptimalizeANDget_DNA.experiment;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ExperimentService {

    private final ExperimentRepository experimentRepository;

    List<Experiment> findAll() {
        return experimentRepository.findAll();
    }

    Experiment findById(Integer id) {
        return experimentRepository.getById(id);
    }

    public List<Experiment> findAllByVisibility(String visibility) {
        return experimentRepository.findAllByVisibility(visibility);
    }

    void save(Experiment experiment) {
        experimentRepository.save(experiment);
    }

    void delete(Integer id) {
        experimentRepository.deleteById(id);
    }




}
