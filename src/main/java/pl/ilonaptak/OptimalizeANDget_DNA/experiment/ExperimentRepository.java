package pl.ilonaptak.OptimalizeANDget_DNA.experiment;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.ilonaptak.OptimalizeANDget_DNA.user.User;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
interface ExperimentRepository extends JpaRepository<Experiment, Integer> {

    List<Experiment> findAllByVisibility(String visibility);

    List<Experiment> findAllByUserId(Integer id);
}
