# 💬 Chat App - Shared Models & Utilities

Common models, types, and utilities used by both frontend and backend of the chat application.

## 📂 Project Structure

```
shared/
├── pubspec.yaml
├── lib/
│   ├── models/
│   │   ├── user.dart
│   │   ├── conversation.dart
│   │   ├── message.dart
│   │   ├── notification.dart
│   │   └── typing_indicator.dart
│   ├── enums/
│   │   ├── message_type.dart
│   │   └── delivery_status.dart
│   ├── utils/
│   │   ├── date_formatter.dart
│   │   ├── validators.dart
│   │   └── notification_helper.dart
│   └── api_constants.dart
└── README.md
```

## 🔧 Setup

1.  **Dependencies**
    ```bash
    flutter pub get
    ```

## 🏗️ Models

### User Model
```dart
class User {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? profileImageUrl;
  final String status;
  final DateTime lastSeen;
  final DateTime createdAt;
}
```

### Conversation Model
```dart
class Conversation {
  final String id;
  final String type;
  final List<String> participantIds;
  final String? lastMessageId;
  final DateTime lastMessageAt;
  final int unreadCount;
  final bool isGroup;
  final String? groupName;
  final String? groupAvatarUrl;
}
```

### Message Model
```dart
class Message {
  final String id;
  final String conversationId;
  final String senderId;
  final String text;
  final String type;
  final String deliveryStatus;
  final DateTime sentAt;
  final DateTime? readAt;
}
```

### Typing Indicator Model
```dart
class TypingIndicator {
  final String conversationId;
  final String userId;
  final String userName;
  final String userAvatarUrl;
  final bool isTyping;
  final DateTime timestamp;
}
```

## 🔤 Enums

### MessageType
```dart
enum MessageType {
  text,
  image,
  video,
  file,
  location,
  audio,
  system;
  
  bool get isMedia => [image, video, file, location, audio].contains(this);
}
```

### DeliveryStatus
```dart
enum DeliveryStatus {
  sent,
  delivered,
  read;
  
  bool get isFinal => [delivered, read].contains(this);
}
```

## 🛠️ Utilities

### DateFormatter
```dart
class DateFormatter {
  static String formatTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }
  
  static String formatDate(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }
  
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy hh:mm a').format(dateTime);
  }
  
  static String formatRelative(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inMinutes < 1) return 'Just now';
    if (difference.inHours < 1) return '${difference.inMinutes}m ago';
    if (difference.inDays < 1) return '${difference.inHours}h ago';
    if (difference.inDays < 7) return '${difference.inDays}d ago';
    return formatDate(dateTime);
  }
}
```

### Validators
```dart
class Validators {
  static String? validateEmail(String value) {
    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }
  
  static String? validatePassword(String value) {
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
  
  static String? validatePhone(String value) {
    final phoneRegex = RegExp(r'^[\d\-\s\(\)\+]+$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }
}
```

### NotificationHelper
```dart
class NotificationHelper {
  static String getNotificationTitle(String type, String senderName) {
    switch (type) {
      case 'message':
        return senderName;
      case 'group_invite':
        return 'New group invitation';
      case 'group_message':
        return 'New message in group';
      case 'system':
        return 'System notification';
      default:
        return 'Notification';
    }
  }
  
  static String getNotificationBody(String type, Message message, String? groupName) {
    switch (type) {
      case 'message':
        if (message.text.isNotEmpty) return message.text;
        return 'Sent a message';
      case 'group_invite':
        return 'You have been invited to join a group';
      case 'group_message':
        if (message.text.isNotEmpty) return message.text;
        return 'New message in $groupName';
      case 'system':
        return message.text;
      default:
        return 'You have a new message';
    }
  }
}
```

## 🔗 API Constants

```dart
class ApiConstants {
  static const String baseUrl = 'http://localhost:8080';
  static const String apiKey = 'your_api_key';
  
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'X-Api-Key': apiKey,
  };
  
  static const Duration timeout = Duration(seconds: 10);
}
```

## 🔄 Versioning

```dart
class ApiConstants {
  static const String apiVersion = 'v1';
  static const String baseUrl = 'http://localhost:8080/api/$apiVersion';
  
  static const String usersEndpoint = '/users';
  static const String conversationsEndpoint = '/conversations';
  static const String messagesEndpoint = '/messages';
  static const String notificationsEndpoint = '/notifications';
  static const String searchEndpoint = '/search';
}
```

## 📦 Usage

### Frontend Usage
```dart
import 'package:shared/models/message.dart';
import 'package:shared/utils/date_formatter.dart';
import 'package:shared/api_constants.dart';

// Usage example
final message = Message(
  id: '1',
  conversationId: 'c1',
  senderId: 'u1',
  text: 'Hello, how are you?',
  type: MessageType.text,
  deliveryStatus: DeliveryStatus.sent,
  sentAt: DateTime.now().subtract(const Duration(minutes: 5)),
);

print(DateFormatter.formatTime(message.sentAt));
print(ApiConstants.baseUrl);
```

### Backend Usage
```dart
import 'package:shared/models/conversation.dart';
import 'package:shared/enums/message_type.dart';
import 'package:shared/utils/notification_helper.dart';

// Usage example
final conversation = Conversation(
  id: '1',
  type: 'direct',
  participantIds: ['u1', 'u2'],
  lastMessageId: 'm1',
  lastMessageAt: DateTime.now().subtract(const Duration(hours: 1)),
  unreadCount: 2,
  isGroup: false,
);

print(conversation.participantIds);
```

## 📋 Development
