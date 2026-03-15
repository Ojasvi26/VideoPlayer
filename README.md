# 📺 Video Player App (iOS)

A modern iOS application built with **SwiftUI**, **AVKit**, and **MVVM architecture** that allows users to discover and play high-quality videos using the **Pexels API**.

The app displays popular videos in a responsive grid layout and provides a seamless video playback experience with autoplay functionality.

---

# 🚀 Features

* 📱 **Responsive Video Grid**

  * Displays videos in a **3-column grid layout**
  * Shows **thumbnail, duration, and videographer name**

* ▶️ **Video Playback**

  * Built using **AVKit VideoPlayer**
  * Supports **Play, Pause, Seek, and Volume**

* 🔄 **Autoplay Next Video**

  * Automatically plays the next video after the current video ends

* 📑 **Next Up Video List**

  * Shows upcoming videos below the player

* 🌐 **Pexels API Integration**

  * Fetches high-quality open-source videos

* 🔁 **Infinite Scroll Pagination**

  * Automatically loads more videos when reaching the bottom

* ⏳ **Loading State**

  * Displays loading indicators while fetching data

* ⚠️ **Error Handling**

  * Handles API failures and decoding errors gracefully

---

# 🏗 Architecture

The project follows the **MVVM (Model–View–ViewModel)** architecture to maintain clean separation of concerns.

```
Pexels API
     ↓
API Service
     ↓
ViewModel
     ↓
SwiftUI Views
```

### Layers

**Models**

* Represents API response structures

**Services**

* Handles network requests and API communication

**ViewModels**

* Manages business logic and prepares data for views

**Views**

* SwiftUI user interface components

---

# 📂 Project Structure

```
VideoPlayerApp
│
├── Models
│   └── Video.swift
│
├── Services
│   └── PexelsAPIService.swift
│
├── ViewModels
│   └── VideoListViewModel.swift
│
├── Views
│   ├── VideoGridView.swift
│   ├── VideoCardView.swift
│   ├── VideoPlayerPage.swift
│   └── NextVideoListView.swift
│
└── VideoPlayerApp.swift
```

---

# 🔌 API Integration

This app uses the **Pexels Video API** to fetch popular videos.

API Endpoint:

```
https://api.pexels.com/videos/popular
```

### Example Request

```
https://api.pexels.com/videos/popular?page=1&per_page=15
```

### Required Header

```
Authorization: YOUR_PEXELS_API_KEY
```

You can get your API key here:

https://www.pexels.com/api/

---

# ⚙️ Installation

### 1️⃣ Clone the repository

```
git clone https://github.com/yourusername/video-player-app.git
```

### 2️⃣ Open the project

Open the project using **Xcode 15 or later**.

### 3️⃣ Add your Pexels API key

In `PexelsAPIService.swift`:

```swift
private let apiKey = "YOUR_API_KEY"
```

### 4️⃣ Run the project

Select a simulator and press:

```
Cmd + R
```

---

# 🧰 Technologies Used

* **Swift**
* **SwiftUI**
* **AVKit**
* **URLSession**
* **Swift Concurrency (async/await)**
* **MVVM Architecture**

---

# 📱 UI Screens

### Home Screen

* Displays videos in a **3-column grid**
* Shows thumbnails and metadata

### Video Player Screen

* Plays selected video
* Displays "Next Up" video list
* Automatically plays next video

---

# 📌 Future Improvements

* 🎬 HD video quality selection
* ⚡ Video preloading for smoother playback
* 🖼 Image caching
* 🔍 Search videos
* ❤️ Favorites / watch later
* 🌙 Dark mode improvements

---

# 👩‍💻 Author

**Ojasvi Hardas**

iOS Developer | Swift | SwiftUI

---

# 📜
