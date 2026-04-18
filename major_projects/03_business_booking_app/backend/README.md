# 💰 Business Booking App

A complete backend system for a business appointment booking application.

## 📂 Project Structure

```
backend/
├── pubspec.yaml
├── lib/
│   ├── main.dart
│   ├── config/
│   │   ├── database.dart
│   │   └── server.dart
│   ├── routes/
│   │   ├── auth_routes.dart
│   │   ├── business_routes.dart
│   │   ├── appointment_routes.dart
│   │   ├── user_routes.dart
│   │   └── middleware.dart
│   ├── models/
│   │   ├── user.dart
│   │   ├── business.dart
│   │   ├── appointment.dart
│   │   └── review.dart
│   ├── controllers/
│   │   ├── auth_controller.dart
│   │   ├── business_controller.dart
│   │   ├── appointment_controller.dart
│   │   └── review_controller.dart
│   └── services/
│       └── email_service.dart
└── README.md
```

## 🚀 Setup

1.  **Dependencies**
    ```bash
    flutter pub get
    ```

2.  **Environment**
    Create `.env` file in the root directory:
    ```env
    DATABASE_URL=postgresql://your_user:your_password@localhost:5432/booking_db
    PORT=8080
    JWT_SECRET=your_secret_key
    ```

## 🧪 Database

- **PostgreSQL** with [Riverpod-SQL](https://pub.dev/packages/riverpod_sql)
- Models: `User`, `Business`, `Appointment`, `Review`

## 🔐 Authentication

- JWT-based authentication
- Middleware protection for protected routes

## endpoints

### Auth

- POST `/auth/register` - Register new user
- POST `/auth/login` - Login user
- POST `/auth/refresh` - Refresh token

### Users

- GET `/users/me` - Get current user
- GET `/users/me/appointments` - Get user's appointments
- PUT `/users/me` - Update user

### Businesses

- GET `/businesses` - List all businesses
- GET `/businesses/:id` - Get business by ID
- GET `/businesses/:id/appointments` - Get business appointments
- GET `/businesses/:id/reviews` - Get business reviews
- POST `/businesses` - Create new business (admin)
- PUT `/businesses/:id` - Update business (owner)
- DELETE `/businesses/:id` - Delete business (owner)

### Appointments

- GET `/appointments/:id` - Get appointment by ID
- POST `/appointments` - Book new appointment
- PATCH `/appointments/:id/status` - Update appointment status
- DELETE `/appointments/:id` - Cancel appointment

### Reviews

- POST `/reviews` - Add review for appointment
- PUT `/reviews/:id` - Update review
- DELETE `/reviews/:id` - Delete review

## 📨 Email Notifications

- Email service for appointment reminders
- Configuration in `lib/config/server.dart`