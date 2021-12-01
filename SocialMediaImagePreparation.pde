PImage originalImage;
PImage newImage;
int baseWidth = 1200;
int baseHeight = 1200;

void setup()
{
  size(1200, 1200);
  originalImage = loadImage("test.jpg");
  noLoop();
}

void draw()
{
  if (originalImage.width < 1200) {
    println("The given image is too small to be qualify for any of the implemented Social-Media-Scenarios.");
    exit();
  } else {
    println("Current Image: ");
    println();
    
    genereateElementsForGridNine(originalImage);
    genereateElementsForGridThree(originalImage);
    genereateElementsForGridSix(originalImage);
  }
  println();
  println("Done.");
  exit();
}

// generate elements for grid 3:3:3
void genereateElementsForGridNine(PImage baseImage)
{
  // transforming image into needed format
  PImage toBeTransformedImage = transformToSquare(baseImage);
  image(toBeTransformedImage, 0, 0);
  
  println("Generating image sections to produce a grid, consisting of 9 sub-images.");  
  int gridElementSize = toBeTransformedImage.width / 3;

  int xStart = gridElementSize * 2;
  int yStart = gridElementSize * 2;
  int i = 1;
  
  for (int y = 0; y < 3; y++)
  {
    for (int x = 0; x < 3; x++)
    {
      PImage imageSection = toBeTransformedImage.get(xStart, yStart, gridElementSize, gridElementSize);
      // image numeration goes from right to left, goes from bottom to top, to ensure grid-saftey
      imageSection.save("Neu-9-" + i + ".jpg");
      
      xStart = xStart - gridElementSize;
      
      i++;
    }
    yStart = yStart - gridElementSize;
    // reset, to start from the right
    xStart = gridElementSize * 2;
  }
}

// generate elements for grid 3:3
void genereateElementsForGridSix(PImage baseImage)
{
  // transforming image into needed format
  PImage toBeTransformedImage = transformToSquare(baseImage);
  image(toBeTransformedImage, 0, 0);
  
  println("Generating image sections to produce a grid, consisting of 6 sub-images.");
  int gridElementSize = toBeTransformedImage.width / 3;
  
  int xStart = gridElementSize * 2;
  int yStart = gridElementSize;
  int i = 1;
  
  for (int y = 0; y < 2; y++)
  {
    for (int x = 0; x < 3; x++)
    {
      PImage imageSection = toBeTransformedImage.get(xStart, yStart, gridElementSize, gridElementSize);
      imageSection.save("Neu-6-" + i + ".jpg");
      
      xStart = xStart - gridElementSize;
      i++;
    }
    yStart = yStart - gridElementSize;
    xStart = gridElementSize * 2;
  }
}

// generate elements for grid 3
void genereateElementsForGridThree(PImage baseImage)
{
  // transforming image into needed format
  PImage toBeTransformedImage = transformToThreeToOne(baseImage);
  image(toBeTransformedImage, 0, 0);
  
  println("Generating image sections to produce a grid, consisting of 3 sub-images.");
  int gridElementSize = toBeTransformedImage.width / 3;
  
  int xStart = gridElementSize * 2;
  int i = 1;
  
  for (int x = 0; x < 3; x++)
  {
    PImage imageSection = toBeTransformedImage.get(xStart, 0, gridElementSize, gridElementSize);
    // image numeration goes from right to left, goes from bottom to top, to ensure grid-saftey
    imageSection.save("Neu-3-" + i + ".jpg");
    
    xStart = xStart - gridElementSize;
    i++;
  }
}

// transform image to 1:1
PImage transformToSquare(PImage baseImage)
{
  println("Checking aspect ration of image and transform accordingly. Target aspection ratio is 1:1");
  PImage imageSection = baseImage;
  
  if (baseImage.width == baseImage.height)
  {
    println("No transoformation, necessary.");
    baseImage.resize(1200, 0);
  } else if (baseImage.width > baseImage.height) {
    println("Detected: 'Landscape Format'. >> Target: 'Square Format'");
    baseImage.resize(0, 1200);
    
    int xStart = (baseImage.width - baseWidth) / 2;
    imageSection = baseImage.get(xStart, 0, baseWidth, baseHeight);
  } else if (baseImage.width < baseImage.height) {
    println("Detected: 'Portrait Format'. >> Target: 'Square Format'");
    baseImage.resize(1200, 0);
    
    int yStart = (baseImage.height - baseHeight) / 2;
    imageSection = baseImage.get(0, yStart, baseWidth, baseHeight);
  }
  return imageSection;
}

// transform image to 3:2
PImage transformToThreeToTwo(PImage baseImage)
{
  println("Checking aspect ration of image and transform accordingly. Target aspection ratio is 3:2");
  PImage imageSection = baseImage;
  
  if (baseImage.width < baseImage.height)
  {
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
PImage transformToThreeToOne(PImage baseImage)
{
  println("Checking aspect ration of image and transform accordingly. Target aspection ratio is 3:1");
  PImage imageSection = baseImage;
  
  if (baseImage.width < baseImage.height)
  {
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
