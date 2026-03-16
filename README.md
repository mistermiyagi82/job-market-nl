# AI Exposure of the Dutch Job Market

An interactive treemap visualizing how exposed 113 Dutch occupations are to artificial intelligence — built as a single-page, zero-dependency web app.

**Live:** [production.up.railway.app](https://production.up.railway.app) · Dutch version at `/nl/`

![treemap preview](docs/design-system-claude-daan.md)

---

## What it shows

- **Tile size** = number of employees in that occupation (CBS 2024)
- **Color** = AI exposure score (0–10), from green (low) to red (high)
- **Click any tile** to see detailed data: exposure score, employment figures, wage, growth forecast, market tension, and education level

A sidebar shows aggregate stats: weighted average exposure, tier breakdown (low / medium / high), total wages at risk, and a filter by sector.

An intro modal explains the methodology, data sources, and contextual research — in both English and Dutch.

---

## Data sources

| Source | What it provides |
|--------|-----------------|
| [CBS StatLine `85517NED`](https://www.cbs.nl) | Employment per occupation (workers, median hourly wage) — 2024 |
| [ROA AIS tot 2030](https://roa.nl) | Growth forecasts, market tension, recruitment bottlenecks, education levels — 2025–2030 |
| [UWV](https://www.uwv.nl) | Wage data and labour market tension |
| LLM scoring (Gemini Flash via OpenRouter) | AI exposure scores based on ESCO task descriptions |

**Key caveats:**
- Employment figures cover *werknemers* (wage employees) only — excludes ~1.2M self-employed (ZZP)
- AI exposure scores are LLM judgments, not empirical measurements — treat as directional
- Theoretical exposure ≠ observed adoption (see Anthropic Economic Index below)

---

## Research context

The intro modal references three studies:

- **[Anthropic Economic Index](https://www.anthropic.com/research/labor-market-impacts)** — Massenkoff & McCrory (2026): distinguishes theoretical vs. observed AI exposure; finds no systematic increase in unemployment so far, but early signs of slower hiring for workers aged 22–25 in exposed roles
- **[Microsoft Research](docs/microsoft-research-ai-workforce.pdf)** — Tomlinson et al. (2025): analyzed 200k anonymized Bing Copilot conversations; AI most applicable to information work (communicating, learning, writing)
- **[Nowcasting Economic Report](docs/Nowcasting_Econ-Report-v16.pdf)**: labour market nowcasting methodology

---

## Folder structure

```
job-market-nl/
├── index.html          # English version
├── data.json           # Occupation data (EN labels)
├── nl/
│   ├── index.html      # Dutch version
│   └── data.json       # Occupation data (NL labels)
├── docs/
│   ├── microsoft-research-ai-workforce.pdf
│   ├── Microsoft_Insights_on_Workforce_Transformation_EN_US.pdf
│   ├── Nowcasting_Econ-Report-v16.pdf
│   └── design-system-claude-daan.md   # Visual design reference
├── Dockerfile
├── nginx.conf
└── archive/            # Old prototype versions (v2, v3)
```

---

## Running locally

No build step — just open `index.html` in a browser. Or serve with any static server:

```bash
npx serve .
# then open http://localhost:3000
```

---

## Deploying with Docker

The app ships as a static nginx container.

```bash
docker build -t job-market-nl .
docker run -p 8080:8080 -e PORT=8080 job-market-nl
```

The `Dockerfile` copies all static files into nginx and the `nginx.conf` injects the `$PORT` environment variable at startup (required for Railway).

---

## data.json format

Each entry in `data.json` represents one occupation group:

```json
{
  "name": "Software developers",
  "sector": "ICT",
  "jobs": 124000,
  "exposure": 8.6,
  "wage_median_hourly": 32.50,
  "growth_pct_yr": 1.8,
  "tension": "Tight",
  "bottleneck": "Very large",
  "education": "HBO/WO"
}
```

---

## Tech stack

- Vanilla HTML/CSS/JS — no frameworks, no build tools
- Canvas-based treemap rendered with a custom squarified layout algorithm
- Deployed on [Railway](https://railway.app) via Docker + nginx

---

## Author

**Daniel Siahaya** — built as a public-interest data visualization of the Dutch labour market.

Contributions, corrections to the data, and translations welcome via issues or pull requests.
