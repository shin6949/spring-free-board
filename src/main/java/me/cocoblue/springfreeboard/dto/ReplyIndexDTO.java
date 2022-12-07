package me.cocoblue.springfreeboard.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReplyIndexDTO {
    private long id;
    private long rootCommentId;
    private long toReplyCommentId;
    private int order;

}