package pl.ilonaptak.OptimalizeANDget_DNA.configuration.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(customUserDetailsService()).passwordEncoder(passwordEncoder());

    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.authorizeRequests() // wszystkie żądania mają być autoryzowane, zapinamy się na adresy które chcemy zabezpieczyć
                .antMatchers("/").permitAll()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/user/**").hasAnyRole("ADMIN", "USER")
                .antMatchers("/experiment/**").hasAnyRole("ADMIN", "USER")
                .antMatchers("/accessory/**").hasAnyRole("ADMIN", "USER")
                .antMatchers("/reaction/**").hasAnyRole("ADMIN", "USER")
                .antMatchers("/ingredient/**").hasAnyRole("ADMIN", "USER")
                .and()
                .formLogin()
                .loginPage("/login")
                .failureUrl("/login/error") // tu tarafia jak logowanie się nie powiedzie
                .and()
                .logout()
                .logoutUrl("/");
    }

    @Bean
    BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    SpringDataUserDetailService customUserDetailsService() {
        return new SpringDataUserDetailService();
    }



}
