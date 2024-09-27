package com.dimas.web.WebCocina.service;

import com.dimas.web.WebCocina.domain.Usuario;
import com.dimas.web.WebCocina.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UsuarioService implements UserDetailsService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public void crearUsuario(Usuario usuario){
        usuario.setContrasenya(passwordEncoder.encode(usuario.getContrasenya()));
        usuarioRepository.save(usuario);
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        // Buscar al usuario en la base de datos por correo
        Optional<Usuario> userOptional = usuarioRepository.findByCorreo(email);

        if (!userOptional.isPresent()) {
            throw new UsernameNotFoundException("Usuario no encontrado");
        }

        Usuario usuario = userOptional.get();

        // Devolver un UserDetails que Spring Security pueda usar
        return org.springframework.security.core.userdetails.User.withUsername(usuario.getCorreo())
                .password(usuario.getContrasenya()) // Asegúrate de que la contraseña esté cifrada en la BD
                .authorities(usuario.getAuthorities()) // Añadir los roles o autoridades
                .build();
    }

}
