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
  println("Generating variations for Social-Media-Scenarios");
  println();

  for (int x = 0; x < imagesInDirectory.length; x++) {
    PImage originalImage = loadImage(sourcePathName + imagesInDirectory[x]);
    
    if (originalImage.width < 1200) {
      println("The given image is too small to be qualify for any of the implemented Social-Media-Scenarios.");
      exit();
    } else {
      fileName = cleanUpFileName(imagesInDirectory[x]);
      commandName = imagesInDirectory[x];
      
      automaticWorkflow(commandName, originalImage);
    }
    println("------------");
  }
  println();
  println("Done.");
  exit();
}

// generate elements for grid 3:3:3
void genereateElementsForGridNine(String commandName, PImage baseImage) {
  // transforming image into needed format
  PImage toBeTransformedImage = transformToSquare(commandName, baseImage);
  image(toBeTransformedImage, 0, 0);
  
  println("Generating image sections to produce a grid, consisting of 9 sub-images.");  
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
  
  println("Generating image sections to produce a grid, consisting of 6 sub-images.");
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
  
  println("Generating image sections to produce a grid, consisting of 3 sub-images.");
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
  println("Checking aspect ration of image and transform accordingly. Target aspection ratio is 1:1");
  PImage imageSection = baseImage;
  
  if (baseImage.width == baseImage.height) {
    println("No transoformation, necessary.");
    baseImage.resize(1200, 0);
    imageSection = baseImage; 
  } else if (baseImage.width > baseImage.height) {
    println("Detected: 'Landscape Format'. >> Target: 'Square Format'");
    baseImage.resize(0, 1200);
    int xStart = 0;
    
    if (commandName.contains("top") == true || commandName.contains("top") == true) {
      println("[ERROR] In 'Landscape Format' images can not be positioned on the 'y-Axis'; 'x-Axis' only. Please review your file naming!");
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
    println("Detected: 'Portrait Format'. >> Target: 'Square Format'");
    baseImage.resize(1200, 0);
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
  println("Checking aspect ration of image and transform accordingly. Target aspection ratio is 3:2");
  PImage imageSection = baseImage;
  
  if (baseImage.width < baseImage.height) {
    println("[ERROR] This image is unfit for the targeted transfomation.");
    exit();
  } else {
    if ((baseImage.width / 3) > (baseImage.height / 2)) {
      int potentialGridElementSize = baseImage.height / 2;
      int potentialTransformationWidth = potentialGridElementSize * 3;
      int potentialTransformationHeight = baseImage.height;
      
      int xStart = (baseImage.width - potentialTransformationWidth) / 2;
      imageSection = baseImage.get(xStart, 0, potentialTransformationWidth, potentialTransformationHeight);
    } else {
      int potentialGridElementSize = baseImage.width / 3;
      int potentialTransformationWidth = baseImage.width;
      int potentialTransformationHeight = potentialGridElementSize * 2;
      
      int yStart = (baseImage.height - potentialTransformationHeight) / 2;
      imageSection = baseImage.get(0, yStart, potentialTransformationWidth, potentialTransformationHeight);
      imageSection.resize(1200, 0);
    }
  }
  return imageSection;
}

// transform image to 3:1
PImage transformToThreeToOne(String commandName, PImage baseImage) {
  println("Checking aspect ration of image and transform accordingly. Target aspection ratio is 3:1");
  PImage imageSection = baseImage;
  
  if (baseImage.width < baseImage.height) {
    println("[ERROR] This image is unfit for the targeted transfomation.");
    exit();
  } else {
    int potentialElementHeight = baseImage.width / 3;
    
    if (potentialElementHeight > baseImage.height) {
      println("[ERROR] This image is unfit for the targeted transfomation.");
      exit();
    } else {
      int yStart = (baseImage.height - potentialElementHeight) / 2;
      
      imageSection = baseImage.get(0, yStart, baseImage.width, potentialElementHeight);
      imageSection.resize(1200, 0);
    }
  }
  return imageSection;
}

String cleanUpFileName(String baseFileName) {
  String modifiedFileName = baseFileName.replace(".jpg", "");
  
  // commands to apply intended social media variations are not part of the filename
  if (modifiedFileName.contains("-grid-9") == true) {
    modifiedFileName = modifiedFileName.replace("-grid-9", "");
  }
  
  if (modifiedFileName.contains("-grid-6") == true) {
    modifiedFileName = modifiedFileName.replace("-grid-6", "");
  }
  
  if (modifiedFileName.contains("-grid-3") == true) {
    modifiedFileName = modifiedFileName.replace("-grid-3", "");
  }
 
  if (modifiedFileName.contains("-top") == true) {
    modifiedFileName = modifiedFileName.replace("-top", "");
  }
  
  if (modifiedFileName.contains("-bottom") == true) {
    modifiedFileName = modifiedFileName.replace("-bottom", "");
  }
  
  if (modifiedFileName.contains("-left") == true) {
    modifiedFileName = modifiedFileName.replace("-left", "");
  }
  
  if (modifiedFileName.contains("-right") == true) {
    modifiedFileName = modifiedFileName.replace("-right", "");
  }
  
  if (modifiedFileName.contains("-center") == true) {
    modifiedFileName = modifiedFileName.replace("-center", "");
  }
  
  // due to naming-convention filenames may contain single-digit numbers
  if (modifiedFileName.contains("1") == true 
      || modifiedFileName.contains("2") == true 
      || modifiedFileName.contains("3") == true
      || modifiedFileName.contains("4") == true 
      || modifiedFileName.contains("5") == true 
      || modifiedFileName.contains("6") == true 
      || modifiedFileName.contains("7") == true
      || modifiedFileName.contains("8") == true 
      || modifiedFileName.contains("9") == true) {
    modifiedFileName = modifiedFileName.substring(0, (modifiedFileName.length() - 2));
  }
  print("Modifizierter Dateiname: " + modifiedFileName);
  
  return modifiedFileName;
}

// program-flow for fully automatic mode
void automaticWorkflow(String commandName, PImage baseImage) {
  println("# FULLY AUTOMATIC MODE");
  println();
  println("Current Transformation:" + fileName);
  
  if (commandName.contains("-grid-9") == true) {
    genereateElementsForGridNine(commandName, baseImage);
  } else if (commandName.contains("-grid-6") == true) {
    genereateElementsForGridSix(commandName, baseImage);
  } else if (commandName.contains("-grid-3") == true) {
    genereateElementsForGridThree(commandName, baseImage);
  }
}
