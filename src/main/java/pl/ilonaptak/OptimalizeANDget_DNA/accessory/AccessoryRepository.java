package pl.ilonaptak.OptimalizeANDget_DNA.accessory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
interface AccessoryRepository extends JpaRepository<Accessory, Integer> {
}
