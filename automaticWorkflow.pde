// ----- PROGRAM_FLOW ----- //

// program-flow for fully automatic mode
void automaticWorkflow(String[] filesToParse, String sourcePathName, String targetPathName) {
  println("# FULLY AUTOMATIC MODE");
  println("Generating variations for Social-Media-Scenarios");
  println();
  
  for (int x = 0; x < filesToParse.length; x++) {
    fileType = getFileType(filesToParse[x]);
 
    if (fileType == null) {
        println("Generating: ----");
    } else {
      PImage baseImage = loadImage(sourcePathName + filesToParse[x]);
      
      if (baseImage.width < 1200) {
        println("[ERROR]: The given image is too small to be qualify for any of the implemented Social-Media-Scenarios.");
        println("Generating: ----");
      } else {
        fileName = cleanUpFileName(filesToParse[x]);
        println("Current Transformation: '" + fileName + "'");
        commandName = filesToParse[x];
        
        if (commandName.contains("-grid-9") == true) {
          genereateElementsForGridNine(commandName, baseImage);
        } else if (commandName.contains("-grid-6") == true) {
          genereateElementsForGridSix(commandName, baseImage);
        } else if (commandName.contains("-grid-3") == true) {
          if (commandName.contains("left") == true || commandName.contains("right") == true) {
            println("[ERROR]: In 'Portrait Format' images can not be positioned on the 'x-Axis'; 'y-Axis' only. Please review your file naming!");
          } else {
            genereateElementsForGridThree(commandName, baseImage);
          }
        } else if (commandName.contains("gallery") == true) {
          galleryFraming(commandName, baseImage, targetPathName, fileName);
        } else if (commandName.contains("square") == true) {
          cropToSquare(commandName, baseImage);
        }
      }
    }
    println();
    println("------------");
    println();
  }
}
