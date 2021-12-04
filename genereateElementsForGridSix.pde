// ----- GENERATING_GRIDS ----- //

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
        imageSection.save(targetPathName + fileName + "-grid-6/" + fileName +  "-" + i + fileType);
        
        xStart = xStart - gridElementSize;
        i++;
      }
      yStart = yStart - gridElementSize;
      xStart = gridElementSize * 2;
    }
  }
}
