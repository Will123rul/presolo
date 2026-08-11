# Pre-Solo 5.1 — Study Tools

Study tools for a student pilot pre-solo written exam at Aurora Municipal (KARR).
Two self-contained web pages, no build step, no dependencies, no network calls.

| Page | What it is |
| --- | --- |
| [`index.html`](index.html) | Landing page |
| [`study.html`](study.html) | Study deck — all 24 questions from the form, worked through |
| [`quiz.html`](quiz.html) | Quiz game — 100 multiple-choice questions, timed, scored |

## Study deck

Reveal each answer, then mark it **Got it** or **Flag for review** and filter down to
the flagged ones. Includes:

- **METAR decoder** — paste any METAR; it splits into groups, decodes each one, and
  produces a plain-English readback with a flag if anything is below your minimums.
- **Crosswind calculator** — pulls wind from the decoded METAR and computes the
  crosswind and headwind component for each runway against the reported gust.
- **Your POH numbers** — enter your aircraft's V-speeds once; they appear on every
  relevant card.

## Quiz game

Four options, one right, points for speed and for streaks. Pick topics and a clock
(10 / 20 / 35 seconds, or none). Every miss shows the correct answer and the reasoning
before you move on. Afterwards you get per-topic scoring worst-subject-first, and the
option to replay only what you missed.

Topics: documents & inspections, airspace, weather & METARs, aerodynamics,
engine & fuel systems, emergencies, V-speeds & the arcs, regs & student limits,
light gun signals, weight & balance.

Keyboard: `1`–`4` or `A`–`D` to answer, `Enter` for the next question.

## Running it

Open `index.html` in a browser. That's the whole procedure — there is no toolchain.

To serve locally:

```sh
python3 -m http.server 8000
# then visit http://localhost:8000
```

Both pages store progress in `localStorage` under the `presolo*` keys. Nothing is
transmitted anywhere, and both pages work offline once loaded.

## A caveat that matters

These are study aids, not an authority. The **POH for your tail number**, the
**current FARs**, and **your CFI** outrank anything here, in that order.

Regulation citations are included throughout so you can verify them yourself.
Aircraft-specific figures shown in examples are for a **Cessna 172S** (Lycoming
IO-360-L2A, fuel injected) — a 172N has a carbureted O-320 and different numbers
throughout, including a different answer to the rough-engine question. Enter your own
values in the study deck.

Three questions on the source form (the coffee-bean scenario, the inoperative
navigation light, and the departure confirmation) were only partially legible when
these pages were written. The governing regulations are covered, but read the actual
wording on the form before answering those.
