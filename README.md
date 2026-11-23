# NaswendaHR: Management systems

A web app for [Naswenda](https://naswenda.co.za/) staff to log in and apply for, track and cancel leave. It replaces the paper **Leave Application Form** (`HR Leave Form v1`).

> Status: early development. Only the public landing page exists so far.

## What the app will do

Based on the paper form:

- **Apply for leave**: Annual, Study, Examination, Sick, Unpaid, or Other (specify), with start date, end date and number of days.
- **Cancel leave**: pick previously approved leave and cancel it.
- **Approval flow**: employee submits, then the line manager approves, then the HR Training Manager gives final approval.
- **Employee details**: full name, employee number and department.

## Tech stack

| Layer    | Choice                          |
| -------- | ------------------------------- |
| Frontend | React (Vite) + Tailwind CSS v4  |
| Backend  | To be decided with the backend dev |
| Database | PostgreSQL                      |

## Repository layout

```
NaswendaHR/
├── frontend/            React app (see below)
├── backend/             API + database code (to be added)
└── README.md
```

### Frontend structure

The frontend is organised by **feature slice**. Each slice owns its pages, components and (later) API calls, so one person can own a slice end to end.

```
frontend/src/
├── features/
│   └── landing/              
│       └── components/       Navbar, Hero, LeaveTypes, HowItWorks, Footer
├── pages/
│   └── LandingPage.tsx       Landing Page
├── shared/
│   └── components/           Reusable pieces used by many slices (e.g. Logo)
├── App.tsx                   Root component (router goes here later)
└── main.tsx                  App entry point
```


## Getting started

Requires [Node.js](https://nodejs.org/) 20 or newer.

```powershell
cd frontend
npm install
npm run dev
```

Then open the URL Vite prints (usually http://localhost:5173).

| Command           | What it does                      |
| ----------------- | --------------------------------- |
| `npm run dev`     | Start the dev server              |
| `npm run build`   | Production build into `dist/`     |
| `npm run preview` | Preview the production build      |
| `npm run lint`    | Lint the code                     |

## Branching

`main` is protected: changes must go through a pull request.

```powershell
git checkout -b feature/short-name
# ...work, commit...
git push -u origin feature/short-name
```

Then open a pull request on GitHub.

## Branding

Brand colours live in `frontend/src/assets/theme.css` under `@theme` and are used as `bg-brand-green`, `text-brand-turquoise`, `bg-brand-orange`, etc. The current hex values are placeholders: replace them with the official brand colours.