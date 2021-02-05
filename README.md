# Godot video rendering demo

**A project that shows how to render high-quality "offline" videos with Godot.**

## Example output

[![Preview](https://thumbs.gfycat.com/MemorableUncommonCrownofthornsstarfish-small.gif)](https://gfycat.com/memorableuncommoncrownofthornsstarfish)

*Click for higher quality.*

## Installation

**This demo currently requires
[Godot 3.1 beta 8](https://godotengine.org/article/dev-snapshot-godot-3-1-beta-8)
or later.**

- Clone this repository or
  [download a ZIP archive](https://github.com/Calinou/godot-video-rendering-demo/archive/master.zip).
- Import this project in Godot.

## Usage

**Make sure to run the project from the command line using the `--fixed-fps 60`
command line argument. Otherwise, frame timings won't be correct.**

When run *outside of the editor*, frames will be rendered and saved to
PNG images in the `render/` directory located in the project data directory.
These can be combined into a video using [FFmpeg](https://ffmpeg.org/)
by running the following command while in the `render/` directory:

```bash
ffmpeg -r 60 -f image2 -s 2560x1440 -i %d.png -vcodec libx264 -crf 15 video.mp4
```

## License

Copyright © 2019 Hugo Locurcio and contributors

- Unless otherwise specified, files in this repository are licensed under
  the MIT license; see [LICENSE.md](LICENSE.md) for more information.
- The Suzanne model was taken from the
  [glTF samples repository](https://github.com/KhronosGroup/glTF-Sample-Models/tree/master/2.0/Suzanne).
