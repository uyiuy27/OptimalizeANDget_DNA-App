package pl.ilonaptak.OptimalizeANDget_DNA.experiment;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
interface ExperimentRepository extends JpaRepository<Experiment, Integer> {
}
