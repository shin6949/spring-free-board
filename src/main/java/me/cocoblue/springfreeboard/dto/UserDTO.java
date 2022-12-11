package me.cocoblue.springfreeboard.dto;

import lombok.*;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Getter
@Setter
public class UserDTO extends User implements Serializable {
    private String nickname;
    private String passwordRe;

    public UserDTO(User user) {
        super(user.getInternalId(), user.getUsername(), user.getName(), null, user.getEmail(), user.getRole());
    }

    public User toUser() {
        return new User(super.getInternalId(), super.getUsername(), super.getName(), super.getPassword(),
                super.getEmail(), super.getRole());
    }
}
