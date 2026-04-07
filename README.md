<div align="center">

# 💸 Zpendr — Budget & Expense Tracker

### _Track smarter. Budget better. Spend intentionally._

![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=apple&logoColor=white)
![macOS](https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows11&logoColor=white)
![Web](https://img.shields.io/badge/Web-4285F4?style=for-the-badge&logo=googlechrome&logoColor=white)
[![License](https://img.shields.io/badge/License-Proprietary-7C3AED?style=for-the-badge)](LICENSE)

![BUDGET-AND-EXPENSE-TRACKER](https://socialify.git.ci/Nihar16/BUDGET-AND-EXPENSE-TRACKER/image?custom_description=Track+income%2C+set+budgets+%26+take+control+of+your+finances+organized+by+category+with+smart+reminders.&description=1&font=Source+Code+Pro&name=1&pattern=Circuit+Board&theme=Dark)

</div>

---

## ✨ What is Zpendr?

**Zpendr** is a cross-platform personal finance app built with Flutter that helps users:

- Log **income and expenses** quickly.
- Create and monitor **category-based budgets**.
- Track **upcoming bills** with reminder workflows.
- Understand spending habits with **interactive analytics**.
- Export financial summaries to **PDF and Excel**.

Whether you’re managing a strict monthly budget or simply trying to gain clarity over your spending, Zpendr gives you a focused, modern experience across mobile, desktop, and web.

---

## 📚 Table of Contents

<table>
  <tr>
    <td valign="top" width="50%">
      <ul>
        <li>✨ <a href="#what-is-zpendr">What is Zpendr?</a></li>
        <li>🚀 <a href="#feature-highlights">Feature Highlights</a></li>
        <li>🧱 <a href="#architecture-overview">Architecture Overview</a></li>
        <li>🛠️ <a href="#tech-stack">Tech Stack</a></li>
        <li>📦 <a href="#getting-started">Getting Started</a></li>
        <li>⬇️ <a href="#download-software">Download Software</a></li>
        <li>⚙️ <a href="#environment-setup">Environment Setup</a></li>
        <li>🏃 <a href="#run-the-app">Run the App</a></li>
        <li>🏗️ <a href="#build-for-release">Build for Release</a></li>
      </ul>
    </td>
    <td valign="top" width="50%">
      <ul>
        <li>🐳 <a href="#run-web-with-docker">Run Web with Docker</a></li>
        <li>📁 <a href="#project-structure">Project Structure</a></li>
        <li>🗒️ <a href="#core-data-models">Core Data Models</a></li>
        <li>🖼️ <a href="#screenshots">Screenshots</a></li>
        <li>🗺️ <a href="#product-roadmap">Product Roadmap</a></li>
        <li>🤝 <a href="#contributing">Contributing</a></li>
        <li>📄 <a href="#license">License</a></li>
        <li>👨‍💻 <a href="#author">Author</a></li>
      </ul>
    </td>
  </tr>
</table>

---

## 🚀 Feature Highlights

### 💰 1) Income & Expense Tracking
- Add transactions with title, amount, date, note, and category.
- Separate **income** and **expense** types for clean reporting.
- Use filters/search to quickly find historical entries.

### 📊 2) Budget Planning & Control
- Create periodic budgets per category.
- View budget usage in real-time.
- Spot overspending early with visual progress indicators.

### 🔔 3) Bill Reminders
- Schedule recurring bill reminders (weekly/monthly/yearly).
- Mark reminders as paid.
- Keep an overview of upcoming liabilities.

### 📈 4) Analytics & Reports
- Visualize spending by category and timeline.
- Compare income vs. expense trends.
- Export records to **PDF** and **.xlsx** for sharing and bookkeeping.

### 🌍 5) Multi-Currency Support
- Record transactions in different currencies.
- Set a preferred base currency.
- Prepare for conversion-ready financial summaries.

### 🔒 6) Privacy & Security Focus
- Local-first storage approach.
- Optional cloud sync architecture.
- Support for biometric/PIN lock workflows (implementation-dependent).

---

## 🧱 Architecture Overview

Zpendr follows a **Clean Architecture-inspired** layering model:

```text
Presentation Layer   → Widgets, Screens, State Providers
Domain Layer         → Entities, Use Cases, Business Rules
Data Layer           → Models, Repositories, Local/Remote Sources
```

### Why this architecture?
- **Scalability:** easy to expand features without rewriting the app.
- **Testability:** domain logic remains isolated and test-friendly.
- **Maintainability:** clean separation between UI and data access.

---

## 🛠 Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter 3.x |
| Language | Dart 3.x |
| State Management | Riverpod |
| Local Persistence | Hive / SQLite (`sqflite`) |
| Cloud Services (optional) | Firebase (Firestore/Auth) |
| Charts | `fl_chart` |
| Export | `pdf`, `excel` |
| Notifications | `flutter_local_notifications` |
| Navigation | Go Router |
| CI/CD | GitHub Actions |
| Web Deployment | Docker + Nginx |

---

## 📦 Getting Started

### Prerequisites

Make sure you have the following installed:

- Flutter SDK `>= 3.0.0`
- Dart SDK `>= 3.0.0`
- Git
- Android Studio or VS Code + Flutter extensions
- (Optional) Docker Desktop for web container workflow

### 1) Clone the repository

```bash
git clone https://github.com/Nihar16/BUDGET-AND-EXPENSE-TRACKER.git
cd BUDGET-AND-EXPENSE-TRACKER
```

### 2) Install dependencies

```bash
flutter pub get
```

---

## ⬇️ Download Software

Use this section to share prebuilt installers so users can download and install Zpendr directly (no Flutter setup required).

> Replace `#` links below with your real release artifacts (GitHub Releases, website CDN, or app store links).

| Platform | Architecture / Target | Download | Notes |
|---|---|---|---|
| 🤖 Android Phone | Android API 21+ (Lollipop and newer) | [Download Android Phone Build](#) | Built for maximum Android phone compatibility. |
| 📱 Android Tablet | Android API 21+ (Lollipop and newer) | [Download Android Tablet Build](#) | Built for maximum Android tablet compatibility. |
| 📱 iPhone | iOS deployment target with widest supported range | [Download iPhone Build](#) | Built for maximum iPhone compatibility. |
| 📱 iPad | iPadOS deployment target with widest supported range | [Download iPad Build](#) | Built for maximum iPad compatibility. |
| 🪟 Windows | 64-bit (x64) | [Download Windows 64-bit](#) | Standard desktop/laptop release. |
| 🪟 Windows | ARM64 | [Download Windows ARM](#) | For Snapdragon/ARM-based Windows devices. |
| 🍎 macOS | Apple Silicon only | [Download macOS (Apple Silicon) Build](#) | Signed `.dmg` or `.pkg` recommended. |

> Tip: host these files on **GitHub Releases** and keep filenames/versioning consistent.

### Recommended release naming

```text
zpendr-android-phone-universal.apk
zpendr-android-tablet-universal.apk
zpendr-windows-64-bit.zip
zpendr-windows-arm64.zip
zpendr-ios-iphone.ipa
zpendr-ipados-ipad.ipa
zpendr-macos-apple-silicon.dmg
```

---

## ⚙️ Environment Setup

If environment variables are used for APIs or cloud setup:

```bash
cp .env.example .env
```

Then update `.env` with values like:

- Currency API key
- Firebase project configuration
- Any feature toggles required by your build

---

## 🏃 Run the App

```bash
# Android / iOS
flutter run

# Web
flutter run -d chrome

# macOS
flutter run -d macos

# Windows
flutter run -d windows
```

---

## 🏗 Build for Release

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# macOS
flutter build macos --release

# Windows
flutter build windows --release
```

---

## 🐳 Run Web with Docker

```bash
# Build image
docker build -t zpendr-web .

# Start container
docker run -p 8080:80 zpendr-web
```

Open: `http://localhost:8080`

---

## 📁 Project Structure

```text
BUDGET-AND-EXPENSE-TRACKER/
├── lib/
│   ├── core/
│   │   ├── constants/          # App-wide constants
│   │   ├── themes/             # Light & dark themes
│   │   ├── utils/              # Helper functions
│   │   └── errors/             # Error handling
│   ├── data/
│   │   ├── models/             # Data models (Transaction, Budget, etc.)
│   │   ├── repositories/       # Data access layer
│   │   ├── local/              # Hive / SQLite storage
│   │   └── remote/             # Firebase / API services
│   ├── domain/
│   │   ├── entities/           # Business entities
│   │   └── usecases/           # Application use cases
│   ├── presentation/
│   │   ├── screens/            # App screens
│   │   ├── widgets/            # Reusable widgets
│   │   └── providers/          # Riverpod providers
│   └── main.dart
├── assets/
│   ├── images/
│   ├── icons/
│   └── screenshots/
├── test/
│   ├── unit/
│   ├── widget/
│   └── integration/
├── android/
├── ios/
├── macos/
├── windows/
├── web/
├── Dockerfile
├── pubspec.yaml
└── README.md

```

---

## 🧾 Core Data Models

### Transaction

```dart
class Transaction {
  final String id;
  final String title;
  final double amount;
  final TransactionType type; // income | expense
  final String category;
  final DateTime date;
  final String? note;
  final String currency;
}
```

### Budget

```dart
class Budget {
  final String id;
  final String category;
  final double limit;
  final double spent;
  final DateTime periodStart;
  final DateTime periodEnd;
}
```

### BillReminder

```dart
class BillReminder {
  final String id;
  final String title;
  final double amount;
  final DateTime dueDate;
  final RecurrenceType recurrence; // once | weekly | monthly | yearly
  final bool isPaid;
  final int reminderDaysBefore;
}
```

---

## 🖼 Screenshots

> Screenshots are currently being updated. Add images under `assets/screenshots/` and embed them here.

Example markdown:

```md
![Dashboard](assets/screenshots/dashboard.png)
![Budget View](assets/screenshots/budget-view.png)
```

---

## 🗺 Product Roadmap

- [x] Income & expense tracking
- [x] Category-aware budgeting
- [x] Bill reminder system
- [x] Multi-currency support
- [x] Analytics and charting
- [x] PDF/Excel export
- [x] Docker-ready web deployment
- [ ] Cloud sync with Firebase
- [ ] Shared household budgets
- [ ] AI-assisted spending insights
- [ ] Home-screen widgets (iOS/Android)

---

## 🤝 Contributing

This project is currently **proprietary** and not open for direct external contributions.

If you'd like to collaborate, suggest a feature, or report issues, please open an issue in this repository.

---

## 📄 License

This project is proprietary software. All rights reserved.

Please read the [LICENSE](LICENSE) file before using, redistributing, or modifying this software.

---

## 👨‍💻 Author

**Nihar** ([@Nihar16](https://github.com/Nihar16))  
MSc Cybersecurity Graduate · Flutter Developer · Burnaby, BC, Canada

---

