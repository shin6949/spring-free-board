package me.cocoblue.springfreeboard.dto;

import lombok.*;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProfileDTO {
    private long id;
    private long userId;
    private String nickname;
    private String profileImage;
}
