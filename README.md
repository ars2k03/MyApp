<div align="center">

# 🚀 ARS Portfolio App

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Provider](https://img.shields.io/badge/Provider-6C63FF?style=for-the-badge&logo=flutter&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**A modern Flutter portfolio application with dynamic theme switching, smooth animations, and a clean UI showcasing skills, projects & contact info.**

[✨ Features](#-features) • [📸 Screenshots](#-screenshots) • [🛠 Tech Stack](#-tech-stack) • [🚀 Getting Started](#-getting-started) • [📁 Project Structure](#-project-structure) • [📬 Contact](#-contact)

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
- 👤 **Profile Section** — Profile picture with full-screen view, name, title badge, follower & repo stats
- 🧠 **Skills Showcase** — 7 categorized skill grids with local asset logos (Programming, App Dev, Web Dev, Tools, Design, Office, Extra)
- 📂 **Projects Section** — Project cards with descriptions linking directly to GitHub repositories
- 📬 **Contact Section** — Email, X (Twitter), LinkedIn, GitHub quick-links + CV download button
- 📍 **Info Cards** — Location and University details with tap feedback
- 🎨 **Custom Color Palette** — Consistent theming with `Palette` class (primary, accent, gradients)
- 💬 **SnackBar Feedback** — Themed floating SnackBars for user interactions
- 🔗 **URL Launcher** — Opens links in external browser with success/error handling

---

## 📸 Screenshots

<div align="center">

| Light Mode | Dark Mode |
|:---:|:---:|
| <img src="assets/screenshots/light_mode.jpeg" width="250"/> | <img src="assets/screenshots/dark_mode.jpeg" width="250"/> |

</div>

> 📌 **Note:** Place your screenshots as `light_mode.jpeg` and `dark_mode.jpeg` inside the `assets/screenshots/` folder.

---

## 🛠 Tech Stack

| Category | Technology |
|---|---|
| **Framework** | Flutter (Dart) |
| **State Management** | Provider |
| **Local Storage** | SharedPreferences |
| **Icons** | FontAwesome Flutter, Cupertino Icons |
| **URL Handling** | url_launcher |
| **Fonts** | Google Fonts |

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  url_launcher: ^6.3.2
  font_awesome_flutter: ^10.12.0
  flutter_speed_dial: ^7.0.0
  animated_icon: ^1.0.0
  curved_navigation_bar: ^1.0.6
  provider: ^6.1.5+1
  shared_preferences: ^2.5.4
  flutter_animated_button: ^2.0.4
  http: ^1.6.0
  google_fonts: ^8.0.2
  iconify_flutter_plus: ^1.0.4
  change_app_package_name: ^1.5.0
  flutter_launcher_icons: ^0.14.4
  icons_launcher: ^3.0.3
```

---

## 🚀 Getting Started

### ✅ Prerequisites

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
│   ├── main.dart                  # App entry point, MaterialApp & theme setup
│   ├── config/
│   │   └── palette.dart           # Color constants & gradient definitions
│   ├── theme/
│   │   └── theme_provider.dart    # ThemeProvider (Light/Dark/System) with SharedPreferences
│   └── screen/
│       ├── Home_Screen.dart       # Main portfolio screen (Profile, About, Skills, Projects, Contact)
│       └── profile.dart           # Full-screen profile image viewer
├── assets/
│   ├── images/                    # Skill logos, profile picture & app assets
│   └── screenshots/               # App screenshots for README
├── pubspec.yaml                   # Project configuration & dependencies
└── README.md
```

---

## 🎨 Color Palette

| Name | Hex | Preview |
|---|---|---|
| Primary | `#6C63FF` | 🟣 Purple |
| Accent | `#00D9FF` | 🔵 Cyan |
| Error | `#FF6B6B` | 🔴 Red |
| Dark BG | `#0F0F1A` | ⬛ Deep Navy |
| Dark Surface | `#1A1A2E` | ⬛ Dark Blue |
| Light BG | `#F5F7FA` | ⬜ Soft White |
| Light Surface | `#FFFFFF` | ⬜ White |

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

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

<div align="center">

**Built with 💙 Flutter by [ars2k03](https://github.com/ars2k03)**

⭐ If you like this project, please consider **starring** the repository!

</div>