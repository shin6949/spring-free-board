package me.cocoblue.springfreeboard.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentViewDTO extends CommentDTO {
    private String authorNickname;
    private int likeCount;
}
