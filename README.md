# Gernerating variations based on different Social-Media-Scenarios

This is a small Processing-Sketch, that automatically generates all the different Variations needed in different Social-Media-Scenarions, especially concerning Instagram.

# How to use?

## Fully Automatic

1. Pick images that are to be present of Social-Media.
2. Add a suffix to the name of every image you want variations of.
2. Prepare a single directory containing all the base-images, for which variations need to be generated.
4. Input the _Source Directory_ in `sourcePathName`.
5. Input the _Target Directory_ in `targetPathName`.
6. Hit the "Play"-Button.

### How to configure Variations

- The generated variations in the _Fully Automatic Mode_ are configured by _using_ the following _operators_:

#### Social Media Scenario

| Operator | Effect on the automatic Generation |
| --- | --- |
| `-grid-9` | |
| `-grid-6` | |
| `-grid-3` | |
| `-gallery-s` | |
| `-gallery-m` | |
| `-gallery-l` | |

#### Position of basic transformations

| Operator | Effect on the automatic Generation |
| --- | --- |
| `-top` | The basic transformation of the image, which is a default preparatiom, is positioned -- if possible -- at the top of the original image. |
| `-bottom` | The basic transformation of the image, which is a default preparatiom, is positioned -- if possible -- at the bottom of the original image. |
| `-left` | The basic transformation of the image, which is a default preparatiom, is positioned -- if possible -- at the left of the original image. |
| `-right` | The basic transformation of the image, which is a default preparatiom, is positioned -- if possible -- at the right of the original image. |
| `-center` | The basic transformation of the image, which is a default preparatiom, is positioned -- if possible -- at the center of the original image. |

_Note:_ Please be aware that the operators `-left` and `-right` can not be used for images in portrait format, since always the full available width of the image is used.
_Note:_ Please be aware that the operators `-top` and `-bottom` can not be used for images in landscape format, since always the full available height of the image is used.
#### Extras

- This operators can be included, but are only applied within the proper Scenarios.

| Operator | Effect on the automatic Generation |
| --- | --- |
| `black` | The background of a scenario such as `-gallery-s`, `-gallery-m` or `-gallery-l` is set to black. |
| `white` | The background of a scenario such as `-gallery-s`, `-gallery-m` or `-gallery-l` is set to white. |

## UI-based Mode

_Not yet implemented._

# Notes 

- This was designed in / for [Processing 4](https://processing.org/)
