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
        imageSection.save(targetPathName + fileName + "-grid-9/" + fileName + "-" + i + fileType);
        
        xStart = xStart - gridElementSize;
        
        i++;
      }
      yStart = yStart - gridElementSize;
      // reset, to start from the right
      xStart = gridElementSize * 2;
    }
  }
}
