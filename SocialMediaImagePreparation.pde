// enter path to source directory here:
String sourcePathName = "C:/Users/andre/Documents/GitHub/SocialMediaImagePreparation/src/";

// enter path to target directory here:
String targetPathName = "C:/Users/andre/Documents/GitHub/SocialMediaImagePreparation/";

String fileName;
String commandName;

int baseWidth = 1200;
int baseHeight = 1200;

java.io.File folder = new java.io.File(dataPath(sourcePathName));
String[] imagesInDirectory = folder.list();

void setup() {
  size(1200, 1200);
  noLoop();
}

void draw() {
  if (imagesInDirectory.length == 0) {
    println("[WARNING]: The directory you specified does not contain any images that can be processed. Please review the specified 'sourcePathName'.");
    exit();
  } else { 
    automaticWorkflow(imagesInDirectory, sourcePathName, targetPathName);
    println("DONE.");
    exit();
  }
}

// ----- CROPPING_TO_SQUARE ----- //

void cropToSquare(String commandName, PImage baseImage) {
    PImage toBeTransformedImage = transformToSquare(commandName, baseImage);
    
    if (toBeTransformedImage == null) {
      println("Generating: ----");
    } else {
      println("Generating: An image cropped to square.");
      toBeTransformedImage.save(targetPathName + fileName + ".jpg");
    }
}

// ----- GENERATING_GRIDS ----- //

// generate elements for grid 3:3:3
void genereateElementsForGridNine(String commandName, PImage baseImage) {
  // transforming image into needed format
  PImage toBeTransformedImage = transformToSquare(commandName, baseImage);
  
  if (toBeTransformedImage == null) {
    println("Generating: ----");
  } else {
    image(toBeTransformedImage, 0, 0);
    
    println("Generating: All image sections to produce a grid, consisting of 9 sub-images.");  
    int gridElementSize = toBeTransformedImage.width / 3;
  
    int xStart = gridElementSize * 2;
    int yStart = gridElementSize * 2;
    int i = 1;
    
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        PImage imageSection = toBeTransformedImage.get(xStart, yStart, gridElementSize, gridElementSize);
        // image numeration goes from right to left, goes from bottom to top, to ensure grid-saftey
        imageSection.save(targetPathName + fileName + "-grid-9/" + fileName + "-" + i + ".jpg");
        
        xStart = xStart - gridElementSize;
        
        i++;
      }
      yStart = yStart - gridElementSize;
      // reset, to start from the right
      xStart = gridElementSize * 2;
    }
  }
}

// generate elements for grid 3:3
void genereateElementsForGridSix(String commandName, PImage baseImage) {
  // transforming image into needed format
  PImage toBeTransformedImage = transformToThreeToTwo(commandName, baseImage);
  
  if (toBeTransformedImage == null) {
    println("Generating: ----");
  } else {
    image(toBeTransformedImage, 0, 0);
    
    println("Generating: All image sections to produce a grid, consisting of 6 sub-images.");
    int gridElementSize = toBeTransformedImage.width / 3;
    
    int xStart = gridElementSize * 2;
    int yStart = gridElementSize;
    int i = 1;
    
    for (int y = 0; y < 2; y++) {
      for (int x = 0; x < 3; x++) {
        PImage imageSection = toBeTransformedImage.get(xStart, yStart, gridElementSize, gridElementSize);
        imageSection.save(targetPathName + fileName + "-grid-6/" + fileName +  "-" + i + ".jpg");
        
        xStart = xStart - gridElementSize;
        i++;
      }
      yStart = yStart - gridElementSize;
      xStart = gridElementSize * 2;
    }
  }
}

// generate elements for grid 3
void genereateElementsForGridThree(String commandName, PImage baseImage) {
  // transforming image into needed format
  PImage toBeTransformedImage = transformToThreeToOne(commandName, baseImage);
  image(toBeTransformedImage, 0, 0);
  
  println("Generating: All image sections to produce a grid, consisting of 3 sub-images.");
  int gridElementSize = toBeTransformedImage.width / 3;
  
  int xStart = gridElementSize * 2;
  int i = 1;
  
  for (int x = 0; x < 3; x++) {
    PImage imageSection = toBeTransformedImage.get(xStart, 0, gridElementSize, gridElementSize);
    // image numeration goes from right to left, goes from bottom to top, to ensure grid-saftey
    imageSection.save(targetPathName + fileName + "-grid-3/" + fileName + "-" + i + ".jpg");
    
    xStart = xStart - gridElementSize;
    i++;
  }
}

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

// ----- PRE_PROCESSING ----- //

// transform image to 1:1
PImage transformToSquare(String commandName, PImage baseImage) {
  println("Checking aspect ratio of image and transform accordingly. Target aspection ratio is 1:1");
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

// ----- CLEAN_UP_OUTPUT ----- //

// clean-up of input file name for scenario-specific output
String cleanUpFileName(String baseFileName) {
  String modifiedFileName = baseFileName.replace(".jpg", "");
  String[] commandNamesAll = {"-grid-9", "-grid-6", "-grid-3", "-top", "-bottom", "-left", "-right", "-center", "-gallery-s", "-gallery-m", "-gallery-l", "-black", "-white", "-square" };
  
  // commands to apply intended social media variations are not part of the filename 
  for (int i = 0; i < commandNamesAll.length; i++) {
    if (modifiedFileName.contains(commandNamesAll[i]) == true) {
      modifiedFileName = modifiedFileName.replace(commandNamesAll[i], "");
    }
  }
  return modifiedFileName;
}
