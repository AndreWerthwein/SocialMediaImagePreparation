// ----- GETTING_FILE_TYPE ----- //

String getFileType(String baseFileName) {
  // checking for multiple file type indicated by multiple '.'
  String[] splittingForFileTypeErrors = splitTokens(baseFileName, ".");
  if (splittingForFileTypeErrors.length == 1) {
    println("[INFO]: The File Name does not contain the File Type. The File Type '.jpg' is applied by default.");
    return ".jpg";
  } else if(splittingForFileTypeErrors.length == 2) {
    fileType = baseFileName.substring(baseFileName.indexOf("."), baseFileName.length());
    if (fileType.contains(".jpg") == true || fileType.contains(".png") == true || fileType.contains(".gif") == true || fileType.contains(".tga") == true) {
      println("File Type detected and applied.");
      return fileType;
    } else {
      println("[ERROR]: The File Name that is contained in the File Name is not supported by Processing. Please review the File Type.");
      return null;
    }
  } else {
    println("[ERROR: The File Name does seem to contain multiple File Types. Please review your File Name.");
    return null;
  }
}
