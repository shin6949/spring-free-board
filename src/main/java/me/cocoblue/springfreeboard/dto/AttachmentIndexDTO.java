package me.cocoblue.springfreeboard.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttachmentIndexDTO {
    private long id;
    private String originalFilename;
    private String renamedFilename;
    private long articleId;
}
