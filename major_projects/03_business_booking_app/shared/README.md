# 💰 Business Booking App - Shared

Common models, types, and utilities used by both frontend and backend.

## 📂 Project Structure

```
shared/
├── pubspec.yaml
├── lib/
│   ├── models/
│   │   ├── user.dart
│   │   ├── business.dart
│   │   ├── appointment.dart
│   │   ├── review.dart
│   │   └── booking_status.dart
│   ├── enums/
│   │   └── booking_status.dart
│   ├── utils/
│   │   ├── date_formatter.dart
│   │   ├── currency_formatter.dart
│   │   └── validators.dart
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
  final String role;
  final String? profileImageUrl;
}
```

### Business Model
```dart
class Business {
  final String id;
  final String ownerId;
  final String name;
  final String description;
  final String category;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String phone;
  final String email;
  final String website;
  final String logoUrl;
  final List<String> images;
  final double averageRating;
  final int reviewCount;
  final bool isVerified;
  final bool isActive;
}
```

### Appointment Model
```dart
class Appointment {
  final String id;
  final String businessId;
  final String userId;
  final DateTime startTime;
  final DateTime endTime;
  final String status;
  final double price;
  final String paymentStatus;
}
```

### Review Model
```dart
class Review {
  final String id;
  final String appointmentId;
  final String userId;
  final int rating;
  final String comment;
  final DateTime createdAt;
}
```

## 🔤 Enums

### BookingStatus
```dart
enum BookingStatus {
  pending,
  confirmed,
  cancelled,
  completed,
  rescheduled;

  bool get isFinal => [completed, cancelled].contains(this);
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

## 📦 Usage

### Frontend Usage
```dart
import 'package:shared/models/user.dart';
import 'package:shared/utils/validators.dart';
import 'package:shared/api_constants.dart';

// Usage example
final user = User(
  id: '1',
  name: 'John Doe',
  email: [EMAIL_ADDRESS]',
  phone: '+1234567890',
  role: 'user',
  profileImageUrl: null,
);

print(Validators.validateEmail(user.email));
print(ApiConstants.baseUrl);
```

### Backend Usage
```dart
import 'package:shared/models/appointment.dart';
import 'package:shared/enums/booking_status.dart';
import 'package:shared/utils/date_formatter.dart';

// Usage example
final appointment = Appointment(
  id: '1',
  businessId: 'b1',
  userId: 'u1',
  startTime: DateTime.now().add(const Duration(days: 1)),
  endTime: DateTime.now().add(const Duration(hours: 1)),
  status: BookingStatus.confirmed,
  price: 50.0,
  paymentStatus: 'paid',
);

print(DateFormatter.formatDateTime(appointment.startTime));
print(appointment.status.name);
```

## 📄 License

This package is open source and available under the [MIT License](https://opensource.org/licenses/MIT).