package pl.ilonaptak.OptimalizeANDget_DNA.experiment;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
interface ExperimentRepository extends JpaRepository<Experiment, Integer> {

    List<Experiment> findAllByVisibility(String visibility);

    List<Experiment> findAllByUserId(Integer id);

    @Query(nativeQuery = true, value = "select MAX(id) FROM experiments;")
    Integer maxId();

//    @Modifying
//    @Query(nativeQuery = true, value = "insert into experiments (added_by, author, created_on, description, difficulty, name, planned_duration, resource, visibility, user_id) select added_by, author, created_on, description, difficulty, name, planned_duration, resource, 'private', :userId from experiments where id = :id")
//    void saveExperimentToOtherUser(Integer id, Integer userId);

    void deleteAllByUserId(Integer id);

    boolean existsById(Integer id);


}
