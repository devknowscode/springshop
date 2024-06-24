package com.project.shopapp.utils;

import org.apache.coyote.BadRequestException;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

public final class ImageUtils {

    // Save image in a local directory
    public static String saveImageToStorage(String uploadDirectory, MultipartFile imageFile)
            throws IOException {
        if (!isImageFile(imageFile)) {
            throw new BadRequestException("Invalid image format");
        }
        String uniqueFileName = UUID.randomUUID() + "_" + imageFile.getOriginalFilename();

        Path uploadPath = Path.of(uploadDirectory);
        Path filePath = uploadPath.resolve(uniqueFileName);

        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        Files.copy(imageFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

        return uniqueFileName;
    }

    // Check image file type
    private static boolean isImageFile(MultipartFile imageFile) {
        String contentType = imageFile.getContentType();
        return contentType != null && contentType.startsWith("image/");
    }

    // View image
    public static byte[] getImage(String imageDirectory, String imageName)
            throws IOException {
        Path imagePath = Path.of(imageDirectory, imageName);

        if (Files.exists(imagePath)) {
            return Files.readAllBytes(imagePath);
        } else {
            return null;    // Handle missing image
        }
    }

    // Delete image
    public static String deleteImage(String imageDirectory, String imageName)
            throws IOException {
        Path imagePath = Path.of(imageDirectory, imageName);

        if (Files.exists(imagePath)) {
            Files.delete(imagePath);
            return "Success";
        } else {
            return "Failed";    // Handle missing delete
        }
    }
}
