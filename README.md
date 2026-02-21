# Watch It App 🎥

A premium Flutter application designed for seamless video streaming and playback. This app currently focuses on delivering high-quality Quranic recitations through an intuitive, card-based interface with embedded YouTube players.

## ✨ Features

- **Embedded YouTube Players**: Play videos directly within the app without navigating away, powered by `youtube_player_flutter`.
- **Card-Based UI**: A clean and modern layout featuring beautiful Material Design cards for each video.
- **Predefined Playlists**: Quick access to major Surahs including Al-Baqarah, Al-Imran, An-Nisa, and more.
- **Interactive Controls**: Full support for playback controls, seeking, and full-screen mode (where supported).
- **Lightweight & Fast**: Optimized for performance with a clean codebase.

## 🛠️ Technology Stack

- **Framework**: [Flutter](https://flutter.dev/) (3.8.1+)
- **Language**: [Dart](https://dart.dev/)
- **Key Dependencies**:
  - `youtube_player_flutter`: For robust YouTube integration.
  - `cupertino_icons`: For iOS-style iconography.

## 📁 Project Structure

```text
lib/
├── core/
│   └── ids.dart          # Centralized video data and YouTube IDs
├── screens/
│   ├── home_screen.dart   # Main feed with scrollable video cards
│   └── widgets/           # Reusable UI components
└── main.dart              # App entry point and theme configuration
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed.
- An Android/iOS emulator or a physical device.

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/TarekMohammedgg/watch_it_app.git
   cd watch_it_app
   ```

2. **Install dependencies**:

   ```bash
   flutter pub get
   ```

3. **Run the application**:

   ```bash
   flutter run
   ```

## 📝 License

This project is open-source and available under the [MIT License](LICENSE).

---

Built with ❤️ using Flutter
