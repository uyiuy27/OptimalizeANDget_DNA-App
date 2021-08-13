package pl.ilonaptak.OptimalizeANDget_DNA.user;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.Experiment;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.ExperimentService;

import java.util.ArrayList;
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
//        user.setConfirmPass(passwordEncoder.encode(user.getConfirmPass()));
        userRepository.save(user);
    }

    public void saveRole(User user, String role) {
        user.setRole(role);
        userRepository.save(user);
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public List<UserEditDto> findAllDto() {
        List<User> users = userRepository.findAll();
        List<UserEditDto> userEditDtos = new ArrayList<>();
        for (User user : users) {
            userEditDtos.add(UserDtoConverter.convertUserToUserDto(user, new UserEditDto()));
        }
        return userEditDtos;
    }

    public User findById(Integer id) {
        return userRepository.getById(id);
    }

    public UserEditDto findUserDtoById(Integer id) {
        Optional<User> user = userRepository.findById(id);
        return UserDtoConverter.convertUserToUserDto(user.orElse(null), new UserEditDto());
    }

//    public UserEditPasswordDto findUserPasswordDtoByID(Integer id) {
//        User user = userRepository.getById(id);
//        return UserDtoConverter.convertUserPasswordToUserPasswordDto(user, new UserEditPasswordDto());
//    }

    public User findByUserName(String login) {
        return userRepository.findByUsername(login);
    }

    public List<User> findAllByRole(String role) {
        return userRepository.findAllByRole(role);
    }

    public List<UserEditDto> findAllDtoByRole(String role) {
        List<User> users = userRepository.findAllByRole(role);
        List<UserEditDto> userEditDtos = new ArrayList<>();
        for (User user : users) {
            userEditDtos.add(UserDtoConverter.convertUserToUserDto(user, new UserEditDto()));
        }
        return userEditDtos;
    }

    public List<User> findAllByEmail(String email) {
        return userRepository.findAllByEmail(email);
    }

    public void update(UserEditDto userEditDto) {
        User user = UserDtoConverter.convertUserDtoToUser(userEditDto, userRepository.findByUsername(userEditDto.getUsername()));
        userRepository.save(user);
    }

    public void updatePassword(UserEditPasswordDto userEditPasswordDto, Integer id) {
        User user = UserDtoConverter.convertUserDtoPasswordToUserPassword(userEditPasswordDto, userRepository.getById(id));
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }

//    void updatePassword(User user, String password) {
//        user.setPassword(passwordEncoder.encode(password));
//        userRepository.save(user);
//    }

    public void delete(Integer id) {
        userRepository.deleteById(id);
    }

    public boolean existsById(Integer id) {
        return userRepository.existsById(id);
    }

    public boolean existsByRole(String role) {
        return userRepository.existsByRole(role);
    }


}
