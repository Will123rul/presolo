# Student Pilot Study Tools

Study tools for a student pilot flying out of Aurora Municipal (KARR) — the pre-solo
exam, and the FAA Private Pilot knowledge test after it. Self-contained web pages:
no build step, no dependencies, no network calls.

| Page | What it is |
| --- | --- |
| [`index.html`](index.html) | Landing page |
| [`study.html`](study.html) | Study deck — all 24 questions from the pre-solo form, worked through |
| [`quiz.html`](quiz.html) | Quiz game — 100 multiple-choice questions, timed, scored |
| [`written.html`](written.html) | Private Pilot knowledge test prep — 123 questions, mock exam, E6B tools |
| [`equipment.html`](equipment.html) | A TOMATO FLAMES and FLAPS — the §91.205 required-equipment lists, drilled |

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

## Private Pilot written

Four tabs:

- **Practice** — pick subjects, answer with immediate feedback and an explanation.
  "My weak areas" auto-selects the subjects you score below 80% on.
- **Mock exam** — 60 questions drawn across every subject in roughly the real test's
  proportions, 150 minutes, 70% to pass. No feedback until you submit. Skip, flag, and
  jump around with the question navigator, the way the testing-centre software works.
- **Tools & tables** — density altitude, the wind triangle (true course → compass
  heading and groundspeed), time/distance/fuel, crosswind components, the full VFR
  minimums table, and a quick-reference sheet.
- **Progress** — lifetime accuracy per subject, bank coverage, and exam history.

123 questions across the twelve ACS subject areas.

### Scope

The real FAA bank runs to several hundred items, many of which reference figures in
the printed **FAA-CT-8080-2** supplement — sectional excerpts, performance charts,
weight and balance tables — that can't be reproduced here. This bank covers the
*concepts* behind every subject area. Use it alongside a full prep course and the
official supplement for the figure-based questions.

## Required equipment

`equipment.html` drills the two §91.205 lists — **A TOMATO FLAMES** for day VFR and
**FLAPS** for what night adds on top of it. Four tabs:

- **Letter round** — one multiple-choice question per letter, eighteen in all: thirteen
  for A TOMATO FLAMES and five for FLAPS. Four options, and **every option starts with
  the letter under test**, so the first initial gives nothing away and you have to know
  which one it actually is. The second A offers airspeed, altimeter, attitude indicator
  and anchor; the first O offers oil pressure against oil temperature. Runs in acronym
  order by default, with the whole word shown above so you can see where you are.
- **Learn** — every letter with the regulation it comes from and the condition attached
  to it, since that is where the questions live: "if the aircraft has retractable gear,"
  "for hire," "certificated after March 11, 1996."
- **Drill** — you get a letter, you say what it stands for, from memory. No options to
  pick from: either **type it** in free text and get marked, or work it as
  **flashcards** and grade yourself.

  The matcher is deliberately loose about wording and strict about substance. "oil
  temp" passes for the oil temperature gauge; bare "temperature" comes back *nearly —
  be more specific*, because the point of that letter is that it is the **oil** one.
  Naming the sibling item is a clean miss rather than a near miss, so "oil temperature"
  typed at the oil-*pressure* slot fails outright, as does "landing light" at the
  landing-*gear* slot. Those two pairs are the ones that blur together.
- **Quiz** — 32 multiple-choice questions weighted toward the traps: items people put
  on the wrong list, the two dates that get swapped, and the three separate
  regulations that each define "night" differently.

Keyboard in the quiz tab: `1`–`4` or `A`–`D` to answer, `Enter` for the next question.
In the drill, `Enter` checks your answer and `Enter` again advances.

## Running it

Open `index.html` in a browser. That's the whole procedure — there is no toolchain.

To serve locally:

```sh
python3 -m http.server 8000
# then visit http://localhost:8000
```

All pages store progress in `localStorage` under the `presolo*` keys. Nothing is
transmitted anywhere, and every page works offline once loaded.

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
