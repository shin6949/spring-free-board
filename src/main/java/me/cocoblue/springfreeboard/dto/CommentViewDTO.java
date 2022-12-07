package me.cocoblue.springfreeboard.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentViewDTO {
    private long id;
    private String content;
    private boolean isReply;
    private LocalDateTime createdAt;
    private long authorId;
    private String authorNickname;
    private int likeCount;
}
