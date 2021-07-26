package pl.ilonaptak.OptimalizeANDget_DNA.user;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

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

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public User findById(Integer id) {
        return userRepository.getById(id);
    }

    public UserEditDto findUserDtoById(Integer id) {
        Optional<User> user = userRepository.findById(id);
        return UserDtoConverter.convertUserToUserDto(user.orElse(null), new UserEditDto());
    }

    public User findByUserName(String login) {
        return userRepository.findByUsername(login);
    }

    public List<User> findAllByRole(String role) {
        return userRepository.findAllByRole(role);
    }

    public void update(User user) {
        userRepository.save(user);
    }

    void updatePassword(User user, String password) {
        user.setPassword(passwordEncoder.encode(password));
        userRepository.save(user);
    }

    public void delete(Integer id) {
        userRepository.deleteById(id);
    }


}
