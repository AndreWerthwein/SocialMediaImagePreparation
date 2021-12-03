// ----- PRE_PROCESSING ----- //

// transform image to 3:1
PImage transformToThreeToOne(String commandName, PImage baseImage) {
  println("Pre-Processing: Checking aspect ratio of image and transform accordingly. Target aspection ratio is 3:1");
  PImage imageSection = baseImage;
  
  if (baseImage.width < baseImage.height) {
    println("[ERROR]: This image is unfit for the targeted transfomation.");
  } else {
    int potentialElementHeight = baseImage.width / 3;
    
    if (potentialElementHeight > baseImage.height) {
      println("[ERROR]: This image is unfit for the targeted transfomation.");
    } else {
      int yStart = 0;
      
      if (commandName.contains("top") == true) {
        yStart = 0; 
      } else if (commandName.contains("bottom") == true) {
        yStart = baseImage.height - potentialElementHeight;
      } else if (commandName.contains("center") == true) {
        yStart = (baseImage.height - potentialElementHeight) / 2;
      } else {
        // default: 'center'
        yStart = (baseImage.height - potentialElementHeight) / 2;
      }
      
      imageSection = baseImage.get(0, yStart, baseImage.width, potentialElementHeight);
      imageSection.resize(1200, 0);
    }
  }
  return imageSection;
}
