// ----- GALLERY_FRAMING ----- //

void galleryFraming(String commandName, PImage baseImage, String targetPathName, String fileName) {
  println("Generating: A gallery-style framed image.");
  size(1200, 1200);
   
  if (commandName.contains("white") == true) {
    background(255, 255, 255);
  } else if (commandName.contains("black") == true) {
    background(0, 0, 0);
  } else {
    // custom color, by default: white
    background(255, 255, 255);
  }
  int xStart = 0;
  int yStart = 0;
  int offsetSmallImage = 100;
  int offsetMediumImage = 50;
  
  if (baseImage.width > baseImage.height) {
    if (commandName.contains("gallery-s") == true) {
      baseImage.resize(800, 0);
      
      if (commandName.contains("left") == true) {
        xStart = offsetSmallImage;
      } else if (commandName.contains("right") == true) {
        xStart = baseWidth - (baseImage.width + offsetSmallImage);
      } else if (commandName.contains("center") == true) {
        xStart = (baseWidth - baseImage.width) / 2;        
      } else {
        xStart = (baseWidth - baseImage.width) / 2;
      }
      yStart = (baseHeight - baseImage.height) / 2;
    }
    
    if (commandName.contains("gallery-m") == true) {
      baseImage.resize(1000, 0);
      
      if (commandName.contains("left") == true) {
        xStart = offsetMediumImage;
      } else if (commandName.contains("right") == true) {
        xStart = baseWidth - (baseImage.width + offsetMediumImage);
      } else if (commandName.contains("center") == true) {
        xStart = (baseWidth - baseImage.width) / 2;        
      } else {
        xStart = (baseWidth - baseImage.width) / 2;
      }
      yStart = (baseHeight - baseImage.height) / 2;
    }
    
    if (commandName.contains("gallery-l") == true) {
      baseImage.resize(1200, 0);
      
      xStart = 0;
      yStart = (baseHeight - baseImage.height) / 2;
    }
  } else {
    if (commandName.contains("gallery-s") == true) {
      baseImage.resize(0, 800);
     
      if (commandName.contains("left") == true) {
        xStart = offsetSmallImage;
      } else if (commandName.contains("right") == true) {
        xStart = baseWidth - (baseImage.width + offsetSmallImage);
      } else if (commandName.contains("center") == true) {
        xStart = (baseWidth - baseImage.width) / 2;        
      } else {
        xStart = (baseWidth - baseImage.width) / 2;
      }
      yStart = (baseHeight - baseImage.height) / 2;
    }
    
    if (commandName.contains("gallery-m") == true) {
      baseImage.resize(0, 1000);
      
      if (commandName.contains("left") == true) {
        xStart = offsetMediumImage;
      } else if (commandName.contains("right") == true) {
        xStart = baseWidth - (baseImage.width + offsetMediumImage);
      } else if (commandName.contains("center") == true) {
        xStart = (baseWidth - baseImage.width) / 2;        
      } else {
        xStart = (baseWidth - baseImage.width);
      }
      yStart = (baseHeight - baseImage.height) / 2;
    }
    
    if (commandName.contains("gallery-l") == true) {
      baseImage.resize(0, 1200);
      
      yStart = 0;
      xStart = (baseWidth - baseImage.width) / 2;
    }
  }
  image(baseImage, xStart, yStart);
  
  saveFrame(targetPathName + fileName + ".jpg");
}
