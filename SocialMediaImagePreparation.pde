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
  automaticWorkflow(imagesInDirectory, sourcePathName, targetPathName);
  println("DONE.");
  exit();
}

// generate elements for grid 3:3:3
void genereateElementsForGridNine(String commandName, PImage baseImage) {
  // transforming image into needed format
  PImage toBeTransformedImage = transformToSquare(commandName, baseImage);
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
      imageSection.save(targetPathName + fileName + "-" + i + ".jpg");
      
      xStart = xStart - gridElementSize;
      
      i++;
    }
    yStart = yStart - gridElementSize;
    // reset, to start from the right
    xStart = gridElementSize * 2;
  }
}

// generate elements for grid 3:3
void genereateElementsForGridSix(String commandName, PImage baseImage) {
  // transforming image into needed format
  PImage toBeTransformedImage = transformToThreeToTwo(commandName, baseImage);
  image(toBeTransformedImage, 0, 0);
  
  println("Generating: All image sections to produce a grid, consisting of 6 sub-images.");
  int gridElementSize = toBeTransformedImage.width / 3;
  
  int xStart = gridElementSize * 2;
  int yStart = gridElementSize;
  int i = 1;
  
  for (int y = 0; y < 2; y++) {
    for (int x = 0; x < 3; x++) {
      PImage imageSection = toBeTransformedImage.get(xStart, yStart, gridElementSize, gridElementSize);
      imageSection.save(targetPathName + fileName + "-" + i + ".jpg");
      
      xStart = xStart - gridElementSize;
      i++;
    }
    yStart = yStart - gridElementSize;
    xStart = gridElementSize * 2;
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
    imageSection.save(targetPathName + fileName + "-" + i + ".jpg");
    
    xStart = xStart - gridElementSize;
    i++;
  }
}

// transform image to 1:1
PImage transformToSquare(String commandName, PImage baseImage) {
  println("Checking aspect ratio of image and transform accordingly. Target aspection ratio is 1:1");
  PImage imageSection = baseImage;
  
  if (baseImage.width == baseImage.height) {
    println("[INFO]: No transoformation, necessary.");
    baseImage.resize(1200, 0);
    imageSection = baseImage; 
  } else if (baseImage.width > baseImage.height) {
    baseImage.resize(1200, 0);
    int xStart = 0;
    
    if (commandName.contains("top") == true || commandName.contains("top") == true) {
      println("[ERROR]: In 'Landscape Format' images can not be positioned on the 'y-Axis'; 'x-Axis' only. Please review your file naming!");
    } else {
      if (commandName.contains("left") == true) {
        xStart = 0;
      } else if (commandName.contains("right") == true) {
        xStart = baseImage.width - baseWidth;
      } else if (commandName.contains("center") == true) {
        xStart = (baseImage.width - baseWidth) / 2;
      }
    }
    
    imageSection = baseImage.get(xStart, 0, baseWidth, baseHeight);
  } else if (baseImage.width < baseImage.height) {
    baseImage.resize(0, 1200);
    int yStart = 0;
    
    if (commandName.contains("top") == true) {
      yStart = 0;
    } else if (commandName.contains("bottom") == true) {
      yStart = baseImage.height - baseHeight;
    } else if (commandName.contains("center") == true) {
      yStart = (baseImage.width - baseWidth) / 2;
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
    exit();
  } else {
    if ((baseImage.width / 3) > (baseImage.height / 2)) {
      int potentialGridElementSize = baseImage.height / 2;
      int potentialTransformationWidth = potentialGridElementSize * 3;
      int potentialTransformationHeight = baseImage.height;
      int xStart = 0;
      
      if (commandName.contains("left") == true){
        xStart = 0;
      } else if (commandName.contains("right") == true){
        xStart = baseImage.height - potentialTransformationWidth;
      } else if (commandName.contains("center") == true){
        xStart = (baseImage.height - potentialTransformationWidth) / 2;
      }
     
      imageSection = baseImage.get(xStart, 0, potentialTransformationWidth, potentialTransformationHeight);
    } else {
      int potentialGridElementSize = baseImage.width / 3;
      int potentialTransformationWidth = baseImage.width;
      int potentialTransformationHeight = potentialGridElementSize * 2;
      int yStart = 0;
      
      if (commandName.contains("top") == true){
        yStart = 0;
      } else if (commandName.contains("bottom") == true){
        yStart = baseImage.height - potentialTransformationHeight;
      } else if (commandName.contains("center") == true){
        yStart = (baseImage.height - potentialTransformationHeight) / 2;
      }
      
      imageSection = baseImage.get(0, yStart, potentialTransformationWidth, potentialTransformationHeight);
      imageSection.resize(1200, 0);
    }
  }
  return imageSection;
}

// transform image to 3:1
PImage transformToThreeToOne(String commandName, PImage baseImage) {
  println("Pre-Processing: Checking aspect ratio of image and transform accordingly. Target aspection ratio is 3:1");
  PImage imageSection = baseImage;
  
  if (baseImage.width < baseImage.height) {
    println("[ERROR]: This image is unfit for the targeted transfomation.");
    exit();
  } else {
    int potentialElementHeight = baseImage.width / 3;
    
    if (potentialElementHeight > baseImage.height) {
      println("[ERROR]: This image is unfit for the targeted transfomation.");
      exit();
    } else {
      int yStart = 0;
      
      if (commandName.contains("top") == true){
        yStart = 0;
      } else if (commandName.contains("bottom") == true){
        yStart = baseImage.height - potentialElementHeight;
      } else if (commandName.contains("center") == true){
        yStart = (baseImage.height - potentialElementHeight) / 2;
      }
      
      imageSection = baseImage.get(0, yStart, baseImage.width, potentialElementHeight);
      imageSection.resize(1200, 0);
    }
  }
  return imageSection;
}

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
        xStart = (baseWidth - baseImage.width);        
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


// clean-up of input file name for scenario-specific output
String cleanUpFileName(String baseFileName) {
  String modifiedFileName = baseFileName.replace(".jpg", "");
  String[] commandNamesAll = {"-grid-9", "-grid-6", "-grid-3", "-top", "-bottom", "-left", "-right", "-center", "-gallery-s", "-gallery-m", "-gallery-l", "-black", "-white" };
  
  // commands to apply intended social media variations are not part of the filename 
  for (int i = 0; i < commandNamesAll.length; i++) {
    if (modifiedFileName.contains(commandNamesAll[i]) == true) {
      String currentCommandName = modifiedFileName;
      modifiedFileName = modifiedFileName.replace(commandNamesAll[i], "");
      
      if (currentCommandName.contains("grid") == true) {
        modifiedFileName = modifiedFileName.substring(0, (modifiedFileName.length() - 2));
      }
    }
  }
  return modifiedFileName;
}

// program-flow for fully automatic mode
void automaticWorkflow(String[] filesToParse, String sourcePathName, String targetPathName) {
  println("# FULLY AUTOMATIC MODE");
  println("Generating variations for Social-Media-Scenarios");
  println();
  
  for (int x = 0; x < filesToParse.length; x++) {
    PImage baseImage = loadImage(sourcePathName + filesToParse[x]);
    
    if (baseImage.width < 1200) {
      println("The given image is too small to be qualify for any of the implemented Social-Media-Scenarios.");
      exit();
    } else {
      fileName = cleanUpFileName(filesToParse[x]);
      println("Current Transformation: '" + fileName + "'");
      commandName = filesToParse[x];
      
      if (commandName.contains("-grid-9") == true) {
        genereateElementsForGridNine(commandName, baseImage);
      } else if (commandName.contains("-grid-6") == true) {
        genereateElementsForGridSix(commandName, baseImage);
      } else if (commandName.contains("-grid-3") == true) {
        genereateElementsForGridThree(commandName, baseImage);
      } else if (commandName.contains("gallery") == true) {
        galleryFraming(commandName, baseImage, targetPathName, fileName);
      }
    }
    println();
    println("------------");
    println();
  }
}
