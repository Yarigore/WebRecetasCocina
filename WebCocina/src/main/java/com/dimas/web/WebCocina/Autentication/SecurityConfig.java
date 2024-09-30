package com.dimas.web.WebCocina.Autentication;

import com.dimas.web.WebCocina.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers(
                                "/css/**",
                                "/img/**",
                                "/",
                                "/signUp",
                                "/buscar/**",
                                "/receta/**",
                                "/guardarUsuario",
                                "/inicioSesion",
                                "/guardarReceta",
                                "/crearReceta",
                                "/recetaUsuario").permitAll()
                        .anyRequest().authenticated()
                )
                .formLogin(login -> login
                        .loginPage("/logIn")
                        .loginProcessingUrl("/authenticationUsuario")
                        .defaultSuccessUrl("/")
                        .failureUrl("/logIn?error=true")
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/logIn?logout=true")
                        .permitAll()
                )
                .userDetailsService(usuarioService);

        return http.build();
    }
}
