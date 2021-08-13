package pl.ilonaptak.OptimalizeANDget_DNA.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Repository
@Transactional
interface UserRepository extends JpaRepository<User, Integer> {

    User findByUsername(String login);

    List<User> findAllByRole(String role);

    List<User> findAllByEmail(String email);

    boolean existsByRole(String role);



}
