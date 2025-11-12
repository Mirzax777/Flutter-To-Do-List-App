# To Do List App - Flutter

A simple and elegant To Do List application built with Flutter that helps you manage your daily tasks efficiently.

## ✨ Features

- ✅ Add new tasks
- ✅ Check off completed tasks
- ✅ Delete tasks
- ✅ Visual distinction between completed and pending tasks
- ✅ Clean and modern UI
- ✅ Responsive design

## 🛠️ Tech Stack

- **Flutter** - UI Framework
- **Dart** - Programming Language
- **Material Design** - Design System

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed
- Dart SDK installed
- IDE (Android Studio, VS Code, or similar)

### Installation & Run

1. **Clone or download the project**
2. **Add the required asset**:
   - Place `checked.png` in your project's assets folder
   - Update `pubspec.yaml` to include the asset:
   ```yaml
   assets:
     - checked.png
   ```

3. **Run the application**:
```bash
flutter pub get
flutter run
```

## 📱 How to Use

### Adding Tasks
1. Type your task in the text field
2. Press the "Tambah" (Add) button

### Managing Tasks
- **Complete a task**: Tap the circular checkbox on the left
- **Delete a task**: Tap the delete icon (trash) on the right

### Visual Indicators
- **Pending tasks**: White background, normal text
- **Completed tasks**: Light green background, strikethrough gray text
- **Checkbox**: Green border for completed, gray for pending

## 🏗️ Project Structure

### Main Components
```dart
MyApp (StatefulWidget)
└── _MyAppState (State)
    ├── daftarTugas (List<String>) - Task list
    ├── statusTugas (List<bool>) - Completion status
    └── controllerTugas (TextEditingController) - Input controller
```

### Key Functions
```dart
void _tambahTugas()     // Add new task
void _hapusTugas(int index)    // Delete task
void _toggleTugas(int index)   // Toggle task status
```

### UI Layout
```
AppBar
├── Icon (checked.png)
└── Title

Body
├── Input Row (TextField + Add Button)
└── Task List (ListView.builder)
    └── ListTile
        ├── Leading: Circular Checkbox
        ├── Title: Task text
        └── Trailing: Delete button
```

## 🎨 Customization

### Colors
- Primary color: `Colors.blueAccent`
- Completed task: `Colors.green[50]` (background), `Colors.green[500]` (checkmark)
- Delete button: `Colors.red[400]`

### Styling
- Border radius: `BorderRadius.circular(12)`
- Card shadows and elevations
- Custom checkbox with circular border

## 📸 App Preview

```
[Input Section]
  ↓
[Task List]
  ↓
[○] Task 1          [🗑️]
[✓] Task 2          [🗑️]
[○] Task 3          [🗑️]
```

## 💡 Learning Outcomes

This project demonstrates:
- Flutter StatefulWidget and state management
- ListView.builder for dynamic lists
- TextEditingController for form handling
- Conditional UI styling
- Gesture detection and callbacks
- Material Design components

## 🔄 State Management

The app uses Flutter's built-in `setState` for state management, making it perfect for learning Flutter fundamentals.

---

**Happy coding!** 🚀
