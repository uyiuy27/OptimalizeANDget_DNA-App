package pl.ilonaptak.OptimalizeANDget_DNA.accessory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
interface AccessoryRepository extends JpaRepository<Accessory, Integer> {

    List<Accessory> findAllByExperimentId(Integer id);


    @Modifying
    @Query(nativeQuery = true, value = "insert into accessories (name, quantity, experiment_id) SELECT name, quantity, null from accessories where experiment_id = :experimentId")
    void saveAccessoriesToOtherUser(Integer experimentId);
}
