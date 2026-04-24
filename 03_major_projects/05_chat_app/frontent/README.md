# 💬 Chat App - Flutter UI

Rich Flutter UI for the chat application with clean architecture, state management, and modern design.

## 📂 Project Structure

```
frontend/
├── pubspec.yaml
├── lib/
│   ├── main.dart
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_constants.dart
│   │   │   ├── colors.dart
│   │   │   ├── strings.dart
│   │   │   └── icons.dart
│   │   ├── theme/
│   │   │   ├── app_theme.dart
│   │   │   └── app_text_theme.dart
│   │   ├── navigation/
│   │   │   ├── app_router.dart
│   │   │   └── app_routes.dart
│   │   └── api/
│   │       ├── api_client.dart
│   │       └── api_service.dart
│   ├── data/
│   │   ├── repositories/
│   │   │   ├── auth_repository.dart
│   │   │   ├── user_repository.dart
│   │   │   ├── conversation_repository.dart
│   │   │   ├── message_repository.dart
│   │   │   ├── search_repository.dart
│   │   │   └── notification_repository.dart
│   │   └── models/
│   │       └── auth_response.dart
│   ├── domain/
│   │   ├── usecases/
│   │   │   ├── auth/
│   │   │   │   ├── login_usecase.dart
│   │   │   │   ├── register_usecase.dart
│   │   │   │   ├── logout_usecase.dart
│   │   │   │   └── forgot_password_usecase.dart
│   │   │   ├── conversation/
│   │   │   │   ├── get_conversations_usecase.dart
│   │   │   │   ├── get_messages_usecase.dart
│   │   │   │   ├── send_message_usecase.dart
│   │   │   │   ├── create_conversation_usecase.dart
│   │   │   │   ├── search_contacts_usecase.dart
│   │   │   │   └── mark_messages_read_usecase.dart
│   │   │   └── user/
│   │   │       ├── get_current_user_usecase.dart
│   │   │       ├── update_profile_usecase.dart
│   │   │       └── update_status_usecase.dart
│   │   └── interfaces/
│   │       ├── auth_repository_interface.dart
│   │       └── conversation_repository_interface.dart
│   ├── presentation/
│   │   ├── providers/
│   │   │   ├── auth_provider.dart
│   │   │   ├── user_provider.dart
│   │   │   ├── conversation_provider.dart
│   │   │   ├── message_provider.dart
│   │   │   ├── search_provider.dart
│   │   │   ├── notification_provider.dart
│   │   │   └── typing_provider.dart
│   │   ├── screens/
│   │   │   ├── auth/
│   │   │   │   ├── splash_screen.dart
│   │   │   │   ├── login_screen.dart
│   │   │   │   ├── register_screen.dart
│   │   │   │   └── forgot_password_screen.dart
│   │   │   ├── main/
│   │   │   │   ├── home_screen.dart
│   │   │   │   ├── settings_screen.dart
│   │   │   │   ├── profile_screen.dart
│   │   │   │   └── notifications_screen.dart
│   │   │   ├── conversation/
│   │   │   │   ├── conversation_list_screen.dart
│   │   │   │   ├── chat_screen.dart
│   │   │   │   └── group_chat_screen.dart
│   │   │   └── search/
│   │   │       └── search_screen.dart
│   │   └── widgets/
│   │       ├── common/
│   │       │   ├── custom_button.dart
│   │       │   ├── custom_text_field.dart
│   │       │   ├── app_drawer.dart
│   │       │   ├── loading_indicator.dart
│   │       │   └── error_message.dart
│   │       ├── conversation/
│   │       │   ├── conversation_list_tile.dart
│   │       │   ├── chat_header.dart
│   │       │   ├── message_bubble.dart
│   │       │   ├── message_input_field.dart
│   │       │   └── typing_indicator.dart
│   │       ├── profile/
│   │       │   ├── profile_avatar.dart
│   │       │   └── status_indicator.dart
│   │       └── notification/
│   │           └── notification_item.dart
│   └── shared/
│       ├── models/
│       │   ├── user.dart
│       │   ├── conversation.dart
│       │   └── message.dart
│       ├── enums/
│       │   ├── message_type.dart
│       │   └── delivery_status.dart
│       └── utils/
│           └── date_formatter.dart
└── README.md
```

## 🔧 Setup

1.  **Install Dependencies**
    ```bash
    flutter pub get
    ```

2.  **Configure API Base URL**
    ```dart
    // In core/api/api_client.dart
    static const String _baseUrl = 'http://localhost:8080'; // Change to your backend URL
    ```

3.  **Run the App**
    ```bash
    flutter run
    ```

## 🏗️ Architecture

The app follows a clean architecture pattern with 4 layers:

```
Frontend (Flutter UI)
├── Presentation (Widgets, Screens, Providers)
├── Domain (Business Logic, Use Cases)
├── Data (Repositories, API Clients)
└── Shared (Models, Enums, Utilities)
```

## 🔌 State Management

We use `flutter_riverpod` for state management:

### Key Providers
```dart
// Auth
final authProvider = StateNotifierProvider<AuthProvider, AuthState>(...);
final isAuthenticatedProvider = Provider<bool>(...);

// Conversation
final conversationsProvider = FutureProvider<List<Conversation>>(...);
final chatProvider = StateNotifierProvider<ChatProvider, ChatState>(...);

// Typing Indicator
final typingProvider = StateNotifierProvider<TypingProvider, TypingState>(...);
```

## 🎨 Design System

### Color Palette
```dart
const Color primaryColor = Color(0xFF007AFF);
const Color secondaryColor = Color(0xFF5856D6);
const Color accentColor = Color(0xFFFF9500);
const Color successColor = Color(0xFF34C759);
const Color warningColor = Color(0xFFFFCC00);
const Color errorColor = Color(0xFFFF3B30);

const Color backgroundColor = Color(0xFFF2F2F7);
const Color cardColor = Color(0xFFFFFFFF);
const Color textColor = Color(0xFF1C1C1E);
const Color subTextColor = Color(0xFF6D6D72);
```

### Typography
```dart
class AppTextTheme {
  static const TextStyle largeTitle = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.41,
  );
  
  static const TextStyle title1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.36,
  );
  
  static const TextStyle headline = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.24,
  );
  
  static const TextStyle body = TextStyle(
    fontSize: 17,
    letterSpacing: -0.24,
  );
  
  static const TextStyle sub