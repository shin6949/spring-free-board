package me.cocoblue.springfreeboard.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class AttachmentDTO {
    private final MultipartFile fileData;
    private final String callback;
    private final String callbackFunc;
}
