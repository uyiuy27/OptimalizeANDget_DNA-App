package pl.ilonaptak.OptimalizeANDget_DNA.experiment;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ExperimentService {

    private final ExperimentRepository experimentRepository;

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
        experiment.setDone(false);
        experimentRepository.save(experiment);
    }

    void delete(Integer id) {
        experimentRepository.deleteById(id);
    }




}
