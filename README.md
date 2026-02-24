<div align="center">

  # 🚀 ARS Portfolio App
  
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![GitHub API](https://img.shields.io/badge/GitHub_API-181717?style=for-the-badge&logo=github&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**A modern, responsive Flutter portfolio application with dynamic theming, smooth animations, and real-time GitHub API integration.**

[📱 Features](#-features) • [📸 Screenshots](#-screenshots) • [🛠 Tech Stack](#-tech-stack) • [🚀 Getting Started](#-getting-started) • [📁 Project Structure](#-project-structure) • [📬 Contact](#-contact)

</div>

---

## 👤 About Me

Hi there 👋, I'm **Md. Arafat Rahman Sohan** (ARS Arafat) — a passionate Flutter Developer from Rajshahi, Bangladesh. Currently studying at **Rajshahi University of Engineering & Technology (RUET)**.

- 🔭 Currently working on: Flutter mobile app development
- 🌱 Currently learning: Backend development with Node.js (Full-Stack Flutter Developer journey)
- 👯 Looking to collaborate on: Open-source Flutter & Full-Stack projects
- 💬 Ask me about: Flutter, Dart, Mobile UI/UX & Backend fundamentals
- 📫 Reach me at: [arafatsohan2003@gmail.com](mailto:arafatsohan2003@gmail.com)
- 😄 Pronouns: He/Him
- ⚡ Fun fact: I love turning ideas into real-world apps 🚀

---

## ✨ Features

- 🌗 **Dynamic Theme Switching** — Seamless Light/Dark mode toggle with persistent state via `SharedPreferences`
- 🔗 **Real-time GitHub API Integration** — Auto-fetches live profile data (avatar, name, followers, repos)
- 👤 **Profile Section** — Dynamic profile picture, name, bio, follower & repo count
- 🧠 **Skills Showcase** — Categorized skill grid with local asset logos
- 📂 **Projects Section** — Cards linking directly to GitHub repositories
- 📬 **Contact Section** — Email, X (Twitter), LinkedIn, GitHub quick-links + CV download button
- 📍 **Info Cards** — Location and University details
- 📱 **Fully Responsive** — Works great on all screen sizes
- ⚡ **Error Handling** — Graceful loading, error, and retry states with SnackBar feedback

---

## 📸 Screenshots

<div align="center">

| Light Mode | Dark Mode |
|:---:|:---:|
| <img src="assets/screenshots/light_mode.jpeg" width="250"/> | <img src="assets/screenshots/dark_mode.jpeg" width="250"/> |

</div>

> 📌 **Note:** Rename your screenshot files to `light_mode.jpeg` and `dark_mode.jpeg`, then place them inside `assets/screenshots/` folder. GitHub does **not** support filenames with spaces.

---

## 🛠 Tech Stack

| Category | Technology |
|---|---|
| **Framework** | Flutter (Dart) |
| **State Management** | Provider |
| **HTTP Client** | http |
| **Local Storage** | SharedPreferences |
| **Icons** | FontAwesome Flutter |
| **URL Handling** | url_launcher |
| **API** | GitHub REST API v3 |

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.5+1
  http: ^1.6.0
  url_launcher: ^6.3.2
  font_awesome_flutter: ^10.12.0
  shared_preferences: ^2.5.4
  google_fonts: ^8.0.2
  cupertino_icons: ^1.0.8
```

---

## 🚀 Getting Started

### ✅ Prerequisites

Make sure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart SDK
- Android Studio / VS Code
- Android Emulator or a physical device

### 📥 Installation

**1. Clone the repository**
```bash
git clone https://github.com/ars2k03/MyApp.git
cd MyApp
```

**2. Install dependencies**
```bash
flutter pub get
```

**3. Run the app**
```bash
flutter run
```

**4. Build APK (Release)**
```bash
flutter build apk --release
```

---

## 📁 Project Structure

```
myapp/
├── lib/
│   ├── main.dart                  # App entry point & MaterialApp setup
│   ├── config/
│   │   └── palette.dart           # Color constants & gradients
│   ├── theme/
│   │   └── theme_provider.dart    # ThemeProvider (Light/Dark/System)
│   └── screen/
│       └── Home_Screen.dart       # Main portfolio screen
├── assets/
│   ├── images/                    # Skill logos & app assets
│   └── screenshots/               # App screenshots for README
├── pubspec.yaml                   # Project configuration & dependencies
└── README.md
```

---

## 🌐 GitHub API Integration

The app fetches live data from the **GitHub REST API**:

```
GET https://api.github.com/users/ars2k03
```

**Fields used:**

| Field | Description |
|---|---|
| `avatar_url` | Profile picture |
| `name` | Full name |
| `followers` | Follower count |
| `public_repos` | Public repository count |

> ⚠️ GitHub API has a rate limit of **60 requests/hour** for unauthenticated requests.

---

## 🎨 Color Palette

| Name | Hex | Preview |
|---|---|---|
| Primary | `#6C63FF` | 🟣 Purple |
| Accent | `#00D9FF` | 🔵 Cyan |
| Error | `#FF6B6B` | 🔴 Red |
| Dark BG | `#0F0F1A` | ⬛ Deep Navy |
| Light BG | `#F5F7FA` | ⬜ Soft White |

---

## 🗺️ Roadmap

Future updates will focus on enhancing **scalability**, **performance**, and overall **user experience**.

---


## 📂 Related Projects

| Project | Description | Repo |
|---|---|---|
| **WhatsApp Clone** | Flutter WhatsApp UI clone with Hive, QR Scanner & dark mode | [🔗 GitHub](https://github.com/ars2k03/WhatsApp) |
| **YouTube Clone** | Flutter YouTube search app with Lottie & in-app WebView | [🔗 GitHub](https://github.com/ars2k03/YouTube) |

---

## 📬 Contact

<div align="center">

| Platform | Link |
|---|---|
| 📧 Email | [arafatsohan2003@gmail.com](mailto:arafatsohan2003@gmail.com) |
| 🐦 X (Twitter) | [@ars_2k03](https://x.com/ars_2k03) |
| 💼 LinkedIn | [LinkedIn](https://www.linkedin.com/) |
| 🐙 GitHub | [@ars2k03](https://github.com/ars2k03) |

</div>

---

## 📄 License

```
MIT License

Copyright (c) 2026 ars2k03 (Md. Arafat Rahman Sohan)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

<div align="center">

**Built with 💙 Flutter by [ars2k03](https://github.com/ars2k03)**

⭐ If you like this project, please consider **starring** the repository!

</div>
