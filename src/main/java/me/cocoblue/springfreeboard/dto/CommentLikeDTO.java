package me.cocoblue.springfreeboard.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentLikeDTO {
    private long id;
    private long userId;
    private long commentId;
}
