# 🌟 Alpha Generation

**Alpha Generation** is a Flutter-based mobile application for online trading of various items. The app uses **GetX** for efficient and responsive state management.

---


## 🛠️ Tech Stack
- 🐦 **Flutter**: Version 3.24.3
- 🎯 **Dart**: Version 3.5.3
- ⚡ **GetX**: Version 4.6.6

---

## 📁 Folder Structure

The project is organized into the following folder structure for better modularity and maintainability:



lib/
├── 📡 api/               # API integrations and network requests
│   ├── api_client.dart
│   └── endpoints.dart
├── 🎛️ controller/        # GetX controllers for state management
│   ├── product_controller.dart
│   ├── user_controller.dart
├── 📦 model/             # Data models representing application objects
│   ├── auth_model/
│   ├── product_model/
│   ├── profile_model/
│   └── category_model.dart
├── 🔧 services/          # Business logic and reusable service classes
│   ├── local_storage_service.dart
│   ├── locator.dart
├── 🧰 utils/             # Utility functions, constants, and helpers
│   ├── constants.dart
│   ├── date_time_utils.dart
├── 🖼️ views/             # Application screens/pages
│   ├── auth_view/
│   ├── home/
│   ├── product/
│   ├── settings/
│   └── splash_screen.dart
├── 🧩 widgets/           # Custom reusable widgets for the UI
│   ├── custom_textfield.dart
│   ├── custom_button.dart
│   ├── app_dialogs.dart
│   ├── listview.dart
│   ├── enquire_dialog.dart
│   └── bottom_navigation.dart
├── 📄 pubspec.yaml       # Dependency configurations
└── 🚀 main.dart          # Application entry point

--- 
## 🚀 Getting Started

Follow these instructions to set up and run the app locally.

### ✅ Prerequisites

Ensure the following tools are installed on your system: - **Flutter SDK**: Install the latest version from the [Flutter website](https://flutter.dev/docs/get-started/install). - **Git**: Install Git for version control. - **Code Editor**: Use an editor like **VS Code** or **Android Studio** for development.
### 🛠️ Installation Steps
1. **Clone the repository**: ```bash git clone https://github.com/your-username/alpha-generation.git cd alpha-generation

