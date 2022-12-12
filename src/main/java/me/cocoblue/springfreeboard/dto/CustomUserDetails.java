package me.cocoblue.springfreeboard.dto;

import lombok.Getter;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;

import java.io.Serializable;
import java.util.Collection;

@Getter
@ToString(callSuper = true)
public class CustomUserDetails extends org.springframework.security.core.userdetails.User implements Serializable {
    static final long serialVersionUID = 42L;

    private final long userInternalId;
    private final ProfileDTO profileDTO;

    public CustomUserDetails(User user, ProfileDTO profileDTO, Collection<? extends GrantedAuthority> authorities) {
        super(user.getUsername(), user.getPassword(), authorities);
        this.userInternalId = user.getInternalId();
        this.profileDTO = profileDTO;
    }
}
