package me.cocoblue.springfreeboard.dto;

import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

@Getter
public class UserContext extends User {
    private final UserDTO userDTO;

    public UserContext(UserDTO userDTO, Collection<? extends GrantedAuthority> authorities) {
        super(userDTO.getUsername(), userDTO.getPassword(), authorities);
        this.userDTO = userDTO;
    }
}
