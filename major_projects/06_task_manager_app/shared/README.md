# 📌 Common - Task Manager App

Shared models, enums, and utilities used across the Task Manager application.

## 📂 Project Structure

```
s
shared/
├── pubspec.yaml
├── lib/
│   ├── models/
│   │   ├── user.dart
│   │   ├── task.dart
│   │   ├── project.dart
│   │   ├── category.dart
│   │   └── comment.dart
│   ├── enums/
│   │   ├── task_status.dart
│   │   ├── priority.dart
│   │   ├── task_type.dart
│   │   └── sort_order.dart
│   └── utils/
│       ├── date_formatter.dart
│       ├── validation_helpers.dart
│       ├── priority_colors.dart
│       └── task_helpers.dart
└── README.md
```

## 🧩 Models

### User Model
```dart
class User {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String profileImageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
}
```

### Task Model
```dart
class Task {
  final int id;
  final String title;
  final String description;
  final TaskStatus status;
  final Priority priority;
  final TaskType type;
  final int projectId;
  final int assignedUserId;
  final DateTime dueDate;
  final DateTime createdAt;
  final DateTime updatedAt;
}
```

### Project Model
```dart
class Project {
  final int id;
  final String name;
  final String description;
  final int ownerId;
  final int memberCount;
  final DateTime createdAt;
}
```

### Category Model
```dart
class Category {
  final int id;
  final String name;
  final String description;
  final int colorValue;
  final int taskCount;
  final DateTime createdAt;
}
```

### Comment Model
```dart
class Comment {
  final int id;
  final int taskId;
  final int userId;
  final String text;
  final DateTime createdAt;
}
```

## 📋 Enums

### Task Status
```dart
enum TaskStatus {
  pending,
  inProgress,
  completed,
  onHold,
}
```

### Priority
```dart
enum Priority {
  low,
  medium,
  high,
  urgent,
}
```

### Task Type
```dart
enum TaskType {
  personal,
  work,
  shopping,
  other,
}
```

### Sort Order
```dart
enum SortOrder {
  asc,
  desc,
}
```

## 🛠️ Utilities

### Date Formatter
```dart
class DateFormatter {
  static String format(DateTime date, {String format = 'MMM dd, yyyy'}) => 
      DateFormat(format).format(date);
  
  static String timeAgo(DateTime date) => 
      timeago.format(date);
}
```

### Validation Helpers
```dart
class ValidationHelpers {
  static String? validateEmail(String value) => 
      !value.contains('@') ? 'Invalid email' : null;
  
  static String? validatePassword(String value) => 
      value.length < 6 ? 'Password must be at least 6 characters' : null;
}
```

### Priority Colors
```dart
class PriorityColors {
  static MaterialColor getColor(Priority priority) {
    switch(priority) {
      case Priority.low: return Colors.green;
      case Priority.medium: return Colors.orange;
      case Priority.high: return Colors.deepOrange;
      case Priority.urgent: return Colors.red;
    }
  }
}
```

## 🧩 Usage Examples

### Create a Task
```dart
final task = Task(
  id: 1,
  title: 'Implement authentication',
  description: 'Add secure login and registration',
  status: TaskStatus.inProgress,
  priority: Priority.high,
  type: TaskType.work,
  projectId: 1,
  assignedUserId: 1,
  dueDate: DateTime.now().add(const Duration(days: 7)),
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);
```

### Format Due Date
```dart
final formattedDate = DateFormatter.format(task.dueDate);
// Output: "Apr 18, 2026"

final timeAgo = DateFormatter.timeAgo(task.createdAt);
// Output: "2 hours ago"
```

### Validate Email
```dart
final error = ValidationHelpers.validateEmail('invalid-email');
if (error != null) {
  print(error); // Output: "Invalid email"
}
```

## 📦 Dependencies

- `intl`: For date formatting
- `timeago`: For relative time formatting