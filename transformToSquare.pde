// ----- PRE_PROCESSING ----- //

// transform image to 1:1
PImage transformToSquare(String commandName, PImage baseImage) {
  println("Checking aspect ratio of image and transform accordingly. Target aspect ratio is 1:1");
  PImage imageSection = baseImage;
  
  if (baseImage.width == baseImage.height) {
    println("[INFO]: No transoformation, necessary.");
    baseImage.resize(1200, 0);
    imageSection = baseImage; 
  } else if (baseImage.width > baseImage.height) {
    baseImage.resize(0, 1200);
    int xStart = 0;
    
    if (commandName.contains("top") == true || commandName.contains("bottom") == true) {
      println("[ERROR]: In 'Landscape Format' images can not be positioned on the 'y-Axis'; 'x-Axis' only. Please review your file naming!");
      return null;
    } else {
      if (commandName.contains("left") == true) {
        xStart = 0;
      } else if (commandName.contains("right") == true) {
        xStart = baseImage.width - baseWidth;
      } else if (commandName.contains("center") == true) {
        xStart = (baseImage.width - baseWidth) / 2;
      } else {
        // default: 'center'
        xStart = (baseImage.width - baseWidth) / 2;
      }
    }
    imageSection = baseImage.get(xStart, 0, baseWidth, baseHeight);
  } else if (baseImage.width < baseImage.height) {
    baseImage.resize(1200, 0);
    int yStart = 0;
    if (commandName.contains("left") == true || commandName.contains("right") == true) {
      println("[ERROR]: In 'Portrait Format' images can not be positioned on the 'x-Axis'; 'y-Axis' only. Please review your file naming!");
      return null;
    } else {
      if (commandName.contains("top") == true) {
        yStart = 0;
      } else if (commandName.contains("bottom") == true) {
        yStart = baseImage.height - baseHeight;
      } else if (commandName.contains("center") == true) {
        yStart = (baseImage.height - baseHeight) / 2;
      } else {
        // default: 'center'
        yStart = (baseImage.height - baseHeight) / 2;
      }
    }
    imageSection = baseImage.get(0, yStart, baseWidth, baseHeight);
  }
  return imageSection;
}
