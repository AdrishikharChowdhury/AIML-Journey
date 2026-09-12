# News App

A simple desktop news viewer built with Python, using `tkinter` for the GUI and the **NewsAPI** to fetch top headlines from around the world.

## Features

- Fetches and displays top headlines from the US via [NewsAPI.org](https://newsapi.org/)
- Shows article title, image, and description in a clean dark-themed interface
- Navigate between articles with **Previous** and **Next** buttons
- **Read More** button opens the full article in your default browser
- Graceful error handling — displays a fallback image if an article's image fails to load
- Auto-rotates through available articles

## Requirements

- Python >= 3.13
- Dependencies listed in `pyproject.toml`:
  - `requests>=2.34.2`
  - `pillow>=12.3.0`
  - `python-dotenv>=1.2.3`
  - `newsapi-python>=0.2.7`

## Setup

1. Get a free API key from [NewsAPI.org](https://newsapi.org/register).
2. Create a `.env` file in the project root with your key:
   ```env
   NEWS_API_KEY=your_api_key_here
   ```
3. Install dependencies:
   ```bash
   uv sync
   ```

## Usage

```bash
news-app
```

Or directly:

```bash
python -m news_app
```

## Project Structure

```
news-app/
├── src/
│   ├── assets/
│   │   └── error.webp    # Fallback image for failed loads
│   └── news_app/
│       └── __init__.py   # Main application code
├── .env                  # API key (gitignored)
├── pyproject.toml
├── README.md
└── uv.lock
```

## How It Works

1. On startup, the app fetches top headlines from `newsapi.org` using the API key from `.env`.
2. The first article is displayed with its title, image, and description.
3. **Previous/Next** buttons cycle through articles with wraparound.
4. **Read More** opens the article URL in the system's default browser.
5. If an image fails to load (e.g., 403 Forbidden), a fallback `error.webp` image is displayed along with the error message.

## Dependencies

- [tkinter](https://docs.python.org/3/library/tkinter.html) (standard library)
- [requests](https://docs.python-requests.org/)
- [Pillow](https://python-pillow.org/)
- [python-dotenv](https://github.com/theskumar/python-dotenv)
- [NewsAPI](https://newsapi.org/)

## License

See [LICENSE](LICENSE) for details.
