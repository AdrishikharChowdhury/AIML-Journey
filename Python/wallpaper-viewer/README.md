# Wallpaper Viewer

A simple desktop wallpaper viewer built with Python, using `tkinter` for the GUI and `Pillow` for image processing.

## Features

- Displays wallpapers from a local directory in a fixed-width grid
- Automatically resizes images to fit the window while preserving aspect ratio
- Navigate through wallpapers with a **Next** button
- Clean, minimal dark-themed interface

## Requirements

- Python >= 3.13
- [Pillow](https://python-pillow.org/) >= 12.3.0

## Installation

1. Clone the repository:
   ```bash
   git clone <repo-url>
   cd wallpaper-viewer
   ```

2. Install dependencies using [uv](https://docs.astral.sh/uv/):
   ```bash
   uv sync
   ```

3. Place your wallpapers in the `Pictures/Wallpapers` directory at the project root.

## Usage

Run the viewer with:

```bash
wallpaper-viewer
```

Or directly via Python:

```bash
python -m wallpaper_viewer
```

Use the **Next** button to cycle through your wallpapers.

## Project Structure

```
wallpaper-viewer/
├── src/wallpaper_viewer/
│   └── __init__.py    # Main application code
├── Pictures/Wallpapers/  # Place your wallpapers here
├── pyproject.toml
├── README.md
└── uv.lock
```

## How It Works

1. The application reads all image files from the `Pictures/Wallpapers` directory.
2. Each image is resized to a fixed width of **640px** while maintaining its original aspect ratio using `PIL.ImageOps.fit`.
3. Images are converted to `PhotoImage` objects for display in a `tkinter` window.
4. Clicking **Next** cycles through the loaded wallpapers.

## Dependencies

- [tkinter](https://docs.python.org/3/library/tkinter.html) (standard library)
- [Pillow](https://python-pillow.org/)

## License

See [LICENSE](LICENSE) for details.
