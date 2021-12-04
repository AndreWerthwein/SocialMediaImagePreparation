// enter path to source directory here:
String sourcePathName = "C:/Users/andre/Documents/GitHub/SocialMediaImagePreparation/src/";

// enter path to target directory here:
String targetPathName = "C:/Users/andre/Documents/GitHub/SocialMediaImagePreparation/";

String fileName, fileType;
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
  if (imagesInDirectory.length == 0) {
    println("[WARNING]: The directory you specified does not contain any images that can be processed. Please review the specified 'sourcePathName'.");
    exit();
  } else { 
    automaticWorkflow(imagesInDirectory, sourcePathName, targetPathName);
    println("DONE.");
    exit();
  }
}
