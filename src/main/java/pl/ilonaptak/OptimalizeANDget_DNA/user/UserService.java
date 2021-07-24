package pl.ilonaptak.OptimalizeANDget_DNA.user;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public void save(User user) {
        user.setRole("ROLE_USER");
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }

    List<User> findAll() {
        return userRepository.findAll();
    }

    public Optional<User> findById(Integer id) {
        return userRepository.findById(id);
    }

    public User findByLogin(String login) {
        return userRepository.findByUserName(login);
    }

    List<User> findAllByRole(String role) {
        return userRepository.findAllByRole(role);
    }

    void update(User user) {
        userRepository.save(user);
    }

    void updatePassword(User user, String password) {
        user.setPassword(passwordEncoder.encode(password));
        userRepository.save(user);
    }

    void delete(Integer id) {
        userRepository.deleteById(id);
    }

}
