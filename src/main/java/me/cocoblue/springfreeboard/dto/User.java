package me.cocoblue.springfreeboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private long internalId;
    private String username;
    private String name;
    private String password;
    private String email;
    private String role;
}
