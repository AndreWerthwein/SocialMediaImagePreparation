// ----- PRE_PROCESSING ----- //

// transform image to 3:2
PImage transformToThreeToTwo(String commandName, PImage baseImage) {
  println("Pre-Processing: Checking aspect ratio of image and transform accordingly. Target aspection ratio is 3:2");
  PImage imageSection = baseImage;
  
  if (baseImage.width < baseImage.height) {
    println("[ERROR]: This image is unfit for the targeted transfomation.");
    return null;
  } else {
    int potentialGridElementSize = 0;
    
    // get grid-element size
    if ((baseImage.width / 3) > (baseImage.height / 2)) {
      potentialGridElementSize = baseImage.height / 2;
    } else {
      potentialGridElementSize = baseImage.width / 3;
    }
    
    int potentialTransformationWidth = potentialGridElementSize * 3;
    int potentialTransformationHeight = potentialGridElementSize * 2;
    int xStart = 0;
    int yStart = 0;
    
    if (baseImage.width > potentialTransformationWidth) {
      if (commandName.contains("top") == true || commandName.contains("bottom") == true) {
        println("[ERROR]: In this aspect ratio images can not be positioned on the 'y-Axis'; 'x-Axis' only. Please review your file naming!");
        return null;
      } else {
        if (commandName.contains("left") == true) {
          xStart = 0;
        } else if (commandName.contains("right") == true) {
          xStart = baseImage.width - potentialTransformationWidth;
        } else if (commandName.contains("center") == true) {
          xStart = (baseImage.width - potentialTransformationWidth) / 2;
        } else {
          // default: 'center'
          xStart = (baseImage.width - potentialTransformationWidth) / 2;
        }
      }
    } else if (baseImage.height > potentialTransformationHeight) {   
      if (commandName.contains("left") == true || commandName.contains("right") == true) {
        println("[ERROR]: In this aspect ratio images can not be positioned on the 'x-Axis'; 'y-Axis' only. Please review your file naming!");
        return null;
      } else {
        if (commandName.contains("top") == true) {
          yStart = 0;
        } else if (commandName.contains("bottom") == true) {
          yStart = baseImage.height - potentialTransformationHeight;
        } else if (commandName.contains("center") == true) {
          yStart = (baseImage.height - potentialTransformationHeight) / 2;
        } else {
          // default: 'center'
          yStart = (baseImage.height - potentialTransformationHeight) / 2;
        }
      }
    }
    
    imageSection = baseImage.get(xStart, yStart, potentialTransformationWidth, potentialTransformationHeight);
    imageSection.resize(1200, 0);
  }
  return imageSection;
}
