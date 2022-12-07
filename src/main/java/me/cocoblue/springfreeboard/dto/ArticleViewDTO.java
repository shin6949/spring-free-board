package me.cocoblue.springfreeboard.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ArticleViewDTO {
    private long id;
    private String content;
    private LocalDateTime createdAt;
    private int viewCount;
    private long authorId;
    private String authorNickname;
}
