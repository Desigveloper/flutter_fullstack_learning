# 📦 E-Commerce Shared Package

Common models, types, and utilities like Product, User, Order used by both frontend and backend.

## 📂 Project Structure

```
shared/
├── pubspec.yaml
├── lib/
│   ├── models/
│   │   ├── user.dart
│   │   ├── product.dart
│   │   ├── order.dart
│   │   └── review.dart
│   ├── enums/
│   │   ├── order_status.dart
│   │   ├── payment_status.dart
│   │   └── role.dart
│   ├── utils/
│   │   ├── date_formatter.dart
│   │   ├── currency_formatter.dart
│   │   └── validators.dart
│   ├── api_constants.dart
│   └── app_constants.dart
└── README.md
```

## 🔧 Setup

1.  **Dependencies**
    ```bash
    flutter pub get
    ```

2.  **Usage Example**
    Import in frontend:
    ```dart
    import 'package:shared/models/product.dart';
    import 'package:shared/utils/validators.dart';
    ```
    Import in backend:
    ```dart
    import 'package:shared/models/order.dart';
    import 'package:shared/enums/order_status.dart';
    ```

## 🏗️ Models

### User Model
```dart
class User {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String role;
  final String? profileImageUrl;
}
```

### Product Model
```dart
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final List<String> images;
  final int stock;
  final double averageRating;
  final int reviewCount;
  final bool isActive;
}
```

### Order Model
```dart
class Order {
  final String id;
  final String userId;
  final List<OrderItem> items;
  final double totalAmount;
  final String shippingAddress;
  final String orderStatus;
  final String paymentStatus;
  final DateTime createdAt;
}

class OrderItem {
  final String productId;
  final String name;
  final int quantity;
  final double price;
}
```

### Review Model
```dart
class Review {
  final String id;
  final String productId;
  final String userId;
  final int rating;
  final String comment;
  final DateTime createdAt;
}
```

## 🔤 Enums

### OrderStatus
```dart
enum OrderStatus {
  pending,
  processing,
  shipped,
  delivered,
  cancelled;

  bool get isFinal => [delivered, cancelled].contains(this);
}
```

### PaymentStatus
```dart
enum PaymentStatus {
  pending,
  paid,
  failed,
  refunded;

  bool get isCompleted => this == paid;
}
```

### Role
```dart
enum Role {
  user,
  admin,
  editor;

  bool get isAdminOrEditor => this == admin || this == editor;
}
```

## 🛠️ Utilities

### DateFormatter
```dart
class DateFormatter {
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }
  
  static String formatTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }
}
```

### CurrencyFormatter
```dart
class CurrencyFormatter {
  static String format(double amount) {
    return NumberFormat.currency(symbol: '\$').format(amount);
  }
}
```

### Validators
```dart
class Validators {
  static String? validateEmail(String value) {
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
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
}
```

## 📄 License

This package is open source and available under the [MIT License](https://opensource.org/licenses/MIT).