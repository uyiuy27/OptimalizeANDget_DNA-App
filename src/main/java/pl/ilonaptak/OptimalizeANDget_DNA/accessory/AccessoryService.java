package pl.ilonaptak.OptimalizeANDget_DNA.accessory;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AccessoryService {

    private final AccessoryRepository accessoryRepository;


    public List<Accessory> findAll() {
        return accessoryRepository.findAll();
    }


    public Accessory getById(Integer id) {
        return accessoryRepository.getById(id);
    }

    public List<Accessory> findAllByExperimentId(Integer id) {
        return accessoryRepository.findAllByExperimentId(id);
    }


    public void save(Accessory accessory) {
        accessoryRepository.save(accessory);
    }


    public void deleteById(Integer id) {
        accessoryRepository.deleteById(id);
    }

    public void saveAccessoriesToOtherUser(Integer experimentId) {
        accessoryRepository.saveAccessoriesToOtherUser(experimentId);

    }

}
