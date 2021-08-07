package pl.ilonaptak.OptimalizeANDget_DNA.reaction;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.Experiment;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
interface ReactionRepository extends JpaRepository<Reaction, Integer> {

    List<Reaction> findAllByExperimentId(Integer id);


}
