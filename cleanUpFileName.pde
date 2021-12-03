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
