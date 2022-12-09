package me.cocoblue.springfreeboard.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@EqualsAndHashCode(callSuper = true)
@Data
public class UserDTO extends User implements Serializable {
    private String nickname;

    public UserDTO(long internalId, String username, String name, String password, String email, String role) {
        super(internalId, username, name, null, email, role);
    }

    public UserDTO(User user) {
        super(user.getInternalId(), user.getUsername(), user.getName(), null, user.getEmail(), user.getRole());
    }
}
