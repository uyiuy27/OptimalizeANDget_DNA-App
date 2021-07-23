package pl.ilonaptak.OptimalizeANDget_DNA.configuration.security;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

@RequiredArgsConstructor
public class SpringDataUserDetailService implements UserDetailsService {
//    private UserService userService;



    @Override
    public UserDetails loadUserByUsername(String email) {
//        User user = userService.findByEmail(email);
//        if (user == null) {
//            throw new UsernameNotFoundException(email);
//        }
//        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
//        grantedAuthorities.add(new SimpleGrantedAuthority(user.getRole()));
//        return new CurrentUser(user.getEmail(), user.getPassword(), grantedAuthorities, user);
        return null;
    }
}
