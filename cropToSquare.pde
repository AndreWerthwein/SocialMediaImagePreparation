// ----- CROPPING_TO_SQUARE ----- //

void cropToSquare(String commandName, PImage baseImage) {
    PImage toBeTransformedImage = transformToSquare(commandName, baseImage);
    
    if (toBeTransformedImage == null) {
      println("Generating: ----");
    } else {
      println("Generating: An image cropped to square.");
      toBeTransformedImage.save(targetPathName + fileName + fileType);
    }
}
