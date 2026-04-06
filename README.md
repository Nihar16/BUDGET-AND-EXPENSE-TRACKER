![BUDGET-AND-EXPENSE-TRACKER](https://socialify.git.ci/Nihar16/BUDGET-AND-EXPENSE-TRACKER/image?custom_description=Track+income%2C+set+budgets+%26+take+control+of+your+finances+%E2%80%94+organized+by+category+with+smart+reminders.%0AAnalyze+spending+with+charts%2C+support+multiple+currencies%2C+and+export+reports.+&description=1&font=Source+Code+Pro&name=1&pattern=Circuit+Board&theme=Dark)

💸 Zpendr — Budget & Expense Tracker
Track income and expenses, set budgets, and take full control of your finances.
Organize spending by category, monitor upcoming bills, and never miss a payment with smart reminders.
Analyze your money with interactive charts, export reports to PDF or Excel, and support multiple currencies.
Available on Android, iOS, macOS, Windows, and the web — your finances, simplified.
![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-Proprietary-red?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20macOS%20%7C%20Windows%20%7C%20Web-lightgrey?style=for-the-badge)
![GitHub Stars](https://img.shields.io/github/stars/Nihar16/BUDGET-AND-EXPENSE-TRACKER?style=for-the-badge&logo=github)
---
📋 Table of Contents
Overview
Features
Screenshots
Tech Stack
Architecture
Getting Started
Project Structure
Data Models
Supported Platforms
Roadmap
Contributing
License
Author
---
🧾 Overview
Zpendr is a cross-platform personal finance application built with Flutter. It empowers users to take complete control of their financial lives by providing an intuitive interface for tracking income and expenses, managing budgets, monitoring bills, and generating insightful reports.
Whether you're tracking daily coffee purchases or managing complex monthly budgets across multiple currencies, Zpendr provides the tools to keep your finances organized and transparent — on any device you use.
---
✨ Features
💰 Income & Expense Tracking
Log income and expense transactions with custom notes
Categorize transactions (Food, Transport, Bills, Entertainment, Health, etc.)
Attach receipts and notes to individual entries
View detailed transaction history with search and filter support
📊 Budget Management
Create monthly or custom-period budgets per category
Real-time budget progress with visual indicators
Overspending alerts and notifications
Budget vs. actual spending comparison
🔔 Smart Bill Reminders
Set recurring bills (monthly, weekly, yearly)
Receive push notifications before due dates
Mark bills as paid directly from the reminder
Upcoming bills dashboard with priority indicators
📈 Analytics & Reports
Interactive pie charts, bar graphs, and line charts for spending trends
Monthly and yearly financial summaries
Category-wise spending breakdown
Income vs. expense comparison over time
Export reports to PDF or Excel (.xlsx)
🌍 Multi-Currency Support
Support for 150+ world currencies
Real-time exchange rate integration
Set a base currency and auto-convert transactions
Currency symbol display on all financial entries
🔒 Security & Privacy
Local data storage with optional cloud backup
Biometric authentication (fingerprint / Face ID)
PIN lock for added privacy
No third-party data sharing
🎨 User Experience
Clean, modern Material 3 UI
Dark and light theme support
Fully responsive layout for phone, tablet, and desktop
Offline-first design — works without internet
---
📱 Screenshots
> Screenshots coming soon. App is currently under active development.
---
🛠 Tech Stack
Layer	Technology
Framework	Flutter 3.x (Dart 3.x)
State Management	Riverpod
Local Database	Hive / SQLite (via `sqflite`)
Cloud Sync	Firebase Firestore (optional)
Authentication	Firebase Auth + Local Biometrics
Charts	`fl_chart`
PDF Export	`pdf` package
Excel Export	`excel` package
Currency API	Open Exchange Rates / Fixer.io
Notifications	`flutter_local_notifications`
Navigation	Go Router
CI/CD	GitHub Actions
Containerization	Docker + Nginx (Web)
---
🏗 Architecture
Zpendr follows a clean architecture pattern with clear separation of concerns:
```
┌─────────────────────────────────────┐
│           Presentation Layer         │
│     (Widgets, Screens, ViewModels)   │
├─────────────────────────────────────┤
│            Domain Layer              │
│     (Use Cases, Entities, Repos)     │
├─────────────────────────────────────┤
│             Data Layer               │
│  (Local DB, Remote API, Models)      │
└─────────────────────────────────────┘
```
State Management
The app uses Riverpod for reactive state management, ensuring a clean unidirectional data flow from data sources to UI components.
Offline-First
All data is stored locally using Hive (NoSQL) or SQLite for structured queries. Cloud sync is opt-in and handled via Firebase Firestore.
---
🚀 Getting Started
Prerequisites
Flutter SDK `>=3.0.0`
Dart SDK `>=3.0.0`
Git
Android Studio / VS Code with Flutter extension
For Docker (web): Docker Desktop
Installation
1. Clone the repository
```bash
git clone https://github.com/Nihar16/BUDGET-AND-EXPENSE-TRACKER.git
cd BUDGET-AND-EXPENSE-TRACKER
```
2. Install dependencies
```bash
flutter pub get
```
3. Configure environment
```bash
cp .env.example .env
# Add your API keys (currency API, Firebase config, etc.)
```
4. Run the app
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
Running with Docker (Web)
```bash
# Build the Docker image
docker build -t zpendr-web .

# Run the container
docker run -p 8080:80 zpendr-web

# Visit http://localhost:8080
```
Build for Production
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
📁 Project Structure
```
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
🗃 Data Models
Transaction
```dart
class Transaction {
  final String id;
  final String title;
  final double amount;
  final TransactionType type;   // income | expense
  final String category;
  final DateTime date;
  final String? note;
  final String currency;
}
```
Budget
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
Bill Reminder
```dart
class BillReminder {
  final String id;
  final String title;
  final double amount;
  final DateTime dueDate;
  final RecurrenceType recurrence;   // once | weekly | monthly | yearly
  final bool isPaid;
  final int reminderDaysBefore;
}
```
---
📲 Supported Platforms
Platform	Status
🤖 Android	✅ Supported
🍎 iOS	✅ Supported
📱 iPadOS	✅ Supported
🖥️ macOS	✅ Supported
🪟 Windows	✅ Supported
🌐 Web	✅ Supported (Docker-ready)
---
🗺 Roadmap
[x] Core transaction tracking (income & expense)
[x] Category management
[x] Budget creation and monitoring
[x] Multi-currency support
[x] Bill reminders with notifications
[x] Interactive charts and analytics
[x] PDF & Excel export
[x] Docker web deployment
[ ] Cloud sync with Firebase
[ ] Shared budgets / household accounts
[ ] AI-powered spending insights
[ ] Bank account integration (Plaid / Open Banking)
[ ] Widget support (iOS & Android home screen)
[ ] Apple Watch / Wear OS companion app
[ ] CSV import from bank statements
---
🤝 Contributing
This project is currently proprietary and closed to external contributions. If you are interested in collaborating or have suggestions, feel free to open an issue or reach out directly.
---
📄 License
This project is proprietary software. All rights reserved.
See the LICENSE file for full terms and conditions.
Unauthorized copying, distribution, or modification of this software is strictly prohibited.
---
👨‍💻 Author
Nihar · @Nihar16
MSc Cybersecurity Graduate · Flutter Developer · Burnaby, BC, Canada
![GitHub](https://img.shields.io/badge/GitHub-Nihar16-181717?style=for-the-badge&logo=github)
![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin)
---
> Made with ❤️ and Flutter — Star this repo if you find it useful!
