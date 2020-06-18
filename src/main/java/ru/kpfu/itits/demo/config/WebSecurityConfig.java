package ru.kpfu.itits.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;
import ru.kpfu.itits.demo.security.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
@Autowired
      private UserDetailsServiceImpl customUserDetailsService;

    public WebSecurityConfig(UserDetailsServiceImpl customUserDetailsService) {
        this.customUserDetailsService = customUserDetailsService;
    }


    @Autowired
    private PasswordEncoder passwordEncoder;
    @Override
            protected void configure(HttpSecurity http) throws Exception{
            http.formLogin().loginPage("/signIn")
                    .usernameParameter("email")
                    .defaultSuccessUrl("/profile")
                    .failureUrl("/signIn?error").permitAll();
            http.authorizeRequests()
                    .antMatchers("/","/signUp","/map").permitAll()
                    .antMatchers("/profile","/routes","/chat").authenticated()
                    .antMatchers("/adminRoutes").hasAuthority("ADMIN");

            http.csrf().disable();
            super.configure(http);


    }

    @Autowired
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(customUserDetailsService).passwordEncoder(passwordEncoder);
    }

}

