// ----- GENERATING_GRIDS ----- //

// generate elements for grid 2
void generateElementsForGridTwo(String commandName, PImage baseImage) {
  // transforming image into needed format
  PImage toBeTransformedImage = transformToTwoToOne(commandName, baseImage);
  image(toBeTransformedImage, 0, 0);
  
  println("Generating: All image sections to produce a grid, consisting of 3 sub-images.");
  int gridElementSize = toBeTransformedImage.width / 2;
  
  int xStart = gridElementSize;
  int i = 1;
  
  for (int x = 0; x < 2; x++) {
    PImage imageSection = toBeTransformedImage.get(xStart, 0, gridElementSize, gridElementSize);
    // image numeration goes from right to left, goes from bottom to top, to ensure grid-saftey
    imageSection.save(targetPathName + fileName + "-grid-2/" + fileName + "-" + i + fileType);
    
    xStart = xStart - gridElementSize;
    i++;
  }
}
