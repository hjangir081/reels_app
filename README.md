# Reels App 🎬

A Flutter-based Instagram/TikTok style Reels application built using Clean Architecture, Riverpod, and Firebase Firestore.

The app supports:

- Vertical reel scrolling
- Auto play/pause videos
- Video preloading
- Video caching
- Like functionality
- Firestore integration
- Error handling
- Optimized reel playback experience

---

# 🏗️ Architecture

This project follows Clean Architecture with proper separation of concerns.

```text
lib/
│
├── config/
│   ├── di/
│   ├── router/
│   └── theme/
│
├── data/
│   ├── datasource/
│   │   ├── local/
│   │   └── remote/
│   │
│   └── repositories/
│
├── domain/
│   ├── models/
│   └── repositories/
│
├── presentation/
│   ├── reels/
│   │   ├── page/
│   │   ├── provider/
│   │   └── widget/
│
└── utils/
    ├── helpers/
    ├── services/
    └── common/
```

---

# 🧠 State Management

This project uses:

```yaml
flutter_riverpod
```

Riverpod was used for:

- Reels state management
- Video playback control
- Like state handling
- Video preloading
- Reactive UI updates

---

# 🛣️ Navigation

Navigation is implemented using:

```yaml
auto_route
```

Benefits:

- Type-safe navigation
- Scalable routing
- Cleaner route management

---

# 💉 Dependency Injection

Dependency Injection is implemented using:

```yaml
get_it
```

Used for:
- Router injection

---

# ☁️ Firebase Integration

This project uses:

- Firebase Core
- Cloud Firestore

Firestore stores:

- video URLs
- usernames
- captions
- likes count

---

# 🎥 Video Playback

Video playback is handled using:

```yaml
video_player
```

Video caching is handled using:

```yaml
cached_video_player_plus
```

Features:

- Auto play
- Auto pause
- Looping
- Video caching
- Smooth reel scrolling

---

# ⚡ Reel Optimization

Implemented optimizations:

- Preload next videos
- Splash screen video warming
- Cached video playback
- Dispose unused controllers
- Prevent excessive memory usage
- Reduced playback lag

---

# 📦 Packages Used

```yaml
flutter_riverpod
firebase_core
cloud_firestore
video_player
cached_video_player_plus
auto_route
get_it
visibility_detector
```
---
# ▶️ Run Project

## Get Packages

```bash
flutter pub get
```

---

## Run Build Runner

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Run App

```bash
flutter run
```

---

# 🔥 Firestore Setup

Create collection:

```text
reels
```

---

# 📄 Firestore Document Structure

| Field | Type |
|---|---|
| videoUrl | string |
| username | string |
| caption | string |
| likes | int |

---

# 📸 Sample Firestore Data

```json
{
  "videoUrl": "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  "username": "flutter_dev",
  "caption": "Beautiful nature vibes 🌿",
  "likes": 2400
}
```

---

# 🎬 Sample Video URLs

```text
https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4

https://samplelib.com/lib/preview/mp4/sample-5s.mp4

https://samplelib.com/lib/preview/mp4/sample-10s.mp4

https://samplelib.com/lib/preview/mp4/sample-15s.mp4

https://samplelib.com/lib/preview/mp4/sample-20s.mp4
```

---

# ⚡ Reels Flow

```text
Splash Screen
    ↓
Fetch Firestore Data
    ↓
Preload First 3 Videos
    ↓
Navigate To Reels Page
    ↓
Auto Play Current Video
    ↓
Preload Upcoming Reels
```

---

# 🧪 Tested On

- Android Emulator
- Android Device
- iOS Simulator

---

# 📚 Concepts Used

- Clean Architecture
- Repository Pattern
- Riverpod Providers
- Firebase Firestore
- Video Streaming
- Video Caching
- Dependency Injection
- Type-safe Navigation
- Optimistic UI Updates
- Infinite Reel Scrolling
- Auto Play/Pause Logic

---

# 👨‍💻 Author

Developed using Flutter ❤️
