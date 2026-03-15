# Design System — "Daan Style"

This is the complete design system used across Daniel Siahaya's interactive web pages (AI Adoption Visualization, ChatGPT-to-Claude Prompt Kit). Use this as the foundation for any new page in the same style.

---

## Core Identity

- **Aesthetic**: Minimal, editorial, warm. Feels like a well-designed blog post, not a SaaS landing page.
- **Vibe**: Anti-corporate, confident, readable. No gradients, no shadows, no flashy stuff.
- **Background**: #f8f6f2 (warm off-white, not cold white)
- **Text**: #2a2622 (warm near-black, not pure black)

---

## Typography

### Fonts (Google Fonts)
```
@import url('https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=DM+Sans:wght@300;400;500;600&family=DM+Mono:wght@300;400;500&display=swap');
```

### Usage
| Element | Font | Weight | Size | Color |
|---------|------|--------|------|-------|
| H1 (page title) | Instrument Serif | 400 | clamp(36px, 5vw, 52-56px) | #1a1714 |
| H1 italic/accent | Instrument Serif italic | 400 | same | #8a6d3b (warm gold) |
| H2 (section title) | Instrument Serif | 400 | 28-32px | #1a1714 |
| H3 (card/step title) | Instrument Serif | 400 | 22px | #3a3428 |
| Body text | DM Sans | 300 | 15-17px | #5a5549 |
| Subtitle/meta | DM Sans | 300 | 15px | #8a857c |
| Labels (uppercase) | DM Sans | 600 | 11px, uppercase, 0.1em tracking | #a09a90 |
| Code/prompts | DM Mono | 400 | 15px | #b8b2a8 (on dark bg) |
| Big numbers | Instrument Serif | 400 | 24-32px | #8a6d3b |

### Key rules
- Instrument Serif for anything that needs to feel editorial: titles, big numbers, accent text
- DM Sans for everything readable: body, labels, buttons, tips
- DM Mono for code blocks and prompt text
- letter-spacing: -0.03em on h1
- line-height: 1.1 on headings, 1.6-1.7 on body

---

## Color Palette

### Core
| Name | Hex | Usage |
|------|-----|-------|
| Background | #f8f6f2 | Page background |
| Surface | #fff | Cards, stat boxes |
| Text primary | #1a1714 | Headings |
| Text body | #2a2622 / #5a5549 | Body copy |
| Text secondary | #8a857c | Subtitles, meta, labels |
| Text dim | #a09a90 | Timestamps, footnotes |
| Accent gold | #8a6d3b | Italic text, big numbers, links, tips |
| Border | #e8e5df | Card borders, dividers |
| Border light | #edeae4 | Toggle background, tag backgrounds |
| Surface tinted | #f0ede8 / #faf8f5 | Source tags, tip backgrounds |

### Data visualization colors (from AI adoption chart)
| Name | Hex | Usage |
|------|-----|-------|
| Grey (inactive) | #ddd8d0 | Not using / faded |
| Green light | #a3c9a8 | Casual users |
| Green | #5aad6a | Regular users |
| Gold | #d4a032 | Paying subscribers |
| Red | #c94a3a | AI-native / scaffold |

### Prompt syntax coloring (on #1a1714 dark background)
| Name | Hex | Usage |
|------|-----|-------|
| Heading | #e8c96a | Section headings in prompt |
| Label | #7dbeaa | Field labels (teal) |
| Instruction | #d4cfc6 | Main instruction text |
| Example | #8a857c | Example text (italic) |
| Number | #c9866b | Step numbers (orange) |
| Dim | #5a5549 | Rules, meta text |
| Base text | #b8b2a8 | Default prompt text |

---

## Component Patterns

### Cards
```css
background: #fff;
border: 1px solid #e8e5df;
border-radius: 8-12px;
padding: 20-32px;
```

### Toggle buttons
```css
/* Container */
background: #edeae4;
border-radius: 8px;
padding: 3px;

/* Button (inactive) */
padding: 10px 22px;
border: none;
background: transparent;
color: #8a857c;
font-size: 14px;
border-radius: 6px;

/* Button (active) */
background: #fff;  /* or #1a1714 for dark variant */
color: #1a1714;    /* or #f8f6f2 for dark variant */
font-weight: 600;
box-shadow: 0 1px 3px rgba(0,0,0,0.08);
```

### Dark code/prompt blocks
```css
background: #1a1714;
border-radius: 10px;
padding: 24px 28px;
padding-top: 48px; /* room for label */

/* "PROMPT" label */
position: absolute;
top: 14px; left: 28px;
font-family: 'DM Mono';
font-size: 10px;
letter-spacing: 0.12em;
color: #4a4540;
```

### Copy button (inside dark block)
```css
position: absolute;
top: 10px; right: 14px;
padding: 6px 14px;
background: rgba(255,255,255,0.07);
border: 1px solid rgba(255,255,255,0.1);
color: #6a655c;
font-size: 12px;
border-radius: 6px;

/* Copied state */
background: #2d5e3f;
border-color: #2d5e3f;
color: #fff;
```

### Callout / quote block
```css
background: #fff;
border: 1px solid #e8e5df;
border-left: 3px solid #8a6d3b;
border-radius: 4px;
padding: 20px 24px;
```

### Source tags
```css
display: inline-block;
font-size: 11px;
color: #8a857c;
background: #f0ede8;
padding: 2px 8px;
border-radius: 3px;
```

### Pro tip box
```css
font-size: 15px;
color: #8a857c;
font-weight: 300;
background: #faf8f5;
border: 1px solid #edeae4;
border-radius: 6px;
padding: 12px 16px;

/* "Pro tip →" label */
color: #8a6d3b;
font-weight: 500;
```

### Stat cards
```css
background: #fff;
border: 1px solid #e8e5df;
border-radius: 8px;
padding: 16px;

/* Number */
font-family: 'Instrument Serif';
font-size: 32px;
font-weight: 400;

/* Label */
font-size: 12px;
color: #8a857c;
font-weight: 300;
```

### Step dots / progress indicator
```css
/* Dot (inactive) */
width: 8px; height: 8px;
border-radius: 50%;
background: #ddd8d0;

/* Dot (active) */
background: #1a1714;
width: 24px;
border-radius: 4px;
```

---

## Animation Patterns

### Card transitions (fade + slide)
```css
transition: opacity 0.4s ease, transform 0.4s ease;

/* Hidden state */
opacity: 0;
transform: translateY(16px);

/* Visible state */
opacity: 1;
transform: translateY(0);
```

### Dot grid transitions (staggered wave)
```css
transition: background 0.7s ease, opacity 0.7s ease;
/* Apply random delay per dot: Math.random() * 400 + 'ms' */
```

### Stat card stagger
```css
transition: all 0.5s ease;
/* Each card gets: transition-delay: i * 80ms */
```

---

## Layout

```css
body {
  background: #f8f6f2;
  padding: 48px 24px 80px;
  line-height: 1.6;
}

.wrap {
  max-width: 860px;
  margin: 0 auto;
}

/* Desktop zoom */
@media (min-width: 768px) {
  .wrap { zoom: 1.25; }
}
```

### Centering pattern
- Page title: text-align: center
- Subtitle: text-align: center + max-width: 560px + margin auto
- Toggle buttons: width: fit-content + margin: 0 auto
- Grid/content area: max-width: 660px + margin: 0 auto

---

## Footer
```css
text-align: center;
padding-top: 32px;
border-top: 1px solid #e8e5df;
font-size: 14px;
color: #8a857c;

/* Links */
color: #8a6d3b;
font-weight: 500;
```

---

## Do's and Don'ts

**Do:**
- Use Instrument Serif for anything editorial / display
- Keep backgrounds warm (#f8f6f2, never pure white)
- Use 1px borders (#e8e5df), never shadows for cards
- Animate with opacity + translateY, stagger where possible
- Keep text light weight (300-400), only bold (500-600) for labels and active states

**Don't:**
- Use pure black (#000) or pure white (#fff) for backgrounds
- Add box-shadows (except subtle ones on active toggle buttons)
- Use gradients anywhere
- Use more than 2 font weights per element
- Over-round corners (4-12px max, never pill-shaped except dots)
