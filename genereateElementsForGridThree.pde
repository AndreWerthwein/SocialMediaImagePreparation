// ----- GENERATING_GRIDS ----- //

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
