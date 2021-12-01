# Gernerating variations based on different Social-Media-Scenarios

This is a small Processing-Sketch, that automatically generates all the different Variations needed in different Social-Media-Scenarions, especially concerning Instagram.

# How to use?

## Fully Automatic

1. Pick images that are to be present of Social-Media.
2. Add a suffix to the name of every image you want variations of.
        - The suffix `-grid-9` will return _9 images_ that are _cropped_ and _numbered_ for a _grid of nine images_.
        - The suffix `-grid-6` will return _6 images_ that are _cropped_ and _numbered_ for a _grid of six images_.
        - The suffix `-grid-3` will return _3 images_ that are _cropped_ and _numbered_ for a _grid of six images_.
        - ~~The suffix `-square-center` will return a _square crop_ from the _center_ of the image.~~
        - ~~The suffix `-square-left` will return a _square crop_ from the _left_ of the image.~~
        - ~~The suffix `-square-right` will return a _square crop_ from the _right_ of the image.~~
2. Prepare a single directory containing all the base-images, for which variations need to be generated.
4. Input the _Source Directory_ in `sourcePathName`.
5. Input the _Target Directory_ in `targetPathName`.
6. Hit the "Play"-Button.

## UI-based Mode

_Not yet implemented._

# Notes 

- This was designed in / for [Processing 4](https://processing.org/)