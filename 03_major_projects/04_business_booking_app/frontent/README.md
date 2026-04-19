# 💰 Business Booking App

A complete Flutter frontend for the business appointment booking application.

## 📂 Project Structure

```
frontend/
├── pubspec.yaml
├── lib/
│   ├── main.dart
│   ├── config/
│   │   ├── api.dart
│   │   └── theme.dart
│   ├── routes/
│   │   ├── app_router.dart
│   │   └── routes.dart
│   ├── screens/
│   │   ├── auth/
│   │   │   ├── login_screen.dart
│   │   │   └── register_screen.dart
│   │   ├── business/
│   │   │   ├── businesses_list_screen.dart
│   │   │   ├── business_detail_screen.dart
│   │   │   └── create_business_screen.dart
│   │   ├── appointment/
│   │   │   ├── appointment_booking_screen.dart
│   │   │   ├── appointments_list_screen.dart
│   │   │   └── appointment_detail_screen.dart
│   │   ├── review/
│   │   │   └── review_screen.dart
│   │   └── shared/
│   │       ├── home_screen.dart
│   │       ├── profile_screen.dart
│   │       └── appointment_card.dart
│   ├── providers/
│   │   ├── auth_provider.dart
│   │   ├── business_provider.dart
│   │   ├── appointment_provider.dart
│   │   └── review_provider.dart
│   ├── models/
│   │   ├── user.dart
│   │   ├── business.dart
│   │   ├── appointment.dart
│   │   └── review.dart
│   ├── services/
│   │   ├── api_service.dart
│   │   ├── auth_service.dart
│   │   └── notification_service.dart
│   └── widgets/
│       ├── custom_button.dart
│       ├── custom_text_field.dart
│       └── loading_indicator.dart
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
    API_BASE_URL=http://localhost:8080
    ```

## 📱 Features

### Authentication

- User registration
- User login
- Secure token storage
- Protected routes

### Businesses

- Browse all businesses
- View business details
- Create and manage businesses
- Search and filter

### Appointments

- Book appointments
- View upcoming appointments
- View past appointments
- Cancel appointments
- Reschedule appointments

### Reviews

- Add reviews for appointments
- View business reviews
- Edit and delete reviews

### Notifications

- Push notifications for reminders
- In-app notifications
- Email notifications (integration with backend)

## 📱Screens

### Auth Screens

- `LoginScreen`: Email/password login, "Forgot password" link, Google sign-in (optional)
- `RegisterScreen`: Name, email, password, phone number

### Business Screens

- `BusinessesListScreen`: Grid/list of businesses with search, filters
- `BusinessDetailScreen`: Business info, services, availability calendar, reviews
- `CreateBusinessScreen`: Form to register a new business

### Appointment Screens

- `AppointmentsListScreen`: Tab view for "Upcoming" and "Past" appointments
- `AppointmentBookingScreen`: Select service, date, time slot
- `AppointmentDetailScreen`: All details, cancel/reschedule options

### Review Screens

- `ReviewScreen`: Rate and write review after appointment

### Shared Screens

- `HomeScreen`: Dashboard with featured businesses, quick actions
- `ProfileScreen`: User info, manage businesses, view all appointments

## 🔄 State Management

- **Riverpod** for state management
- Providers for auth, businesses, appointments, reviews
- Auto-disposal of resources

## 🎨 Theme

- Modern material design
- Custom color scheme (blue/teal primary)
- Dark mode support
- Responsive layouts

## 🔗 API Integration

- REST API calls to backend
- JSON serialization/deserialization
- Error handling and retry logic
- Loading states for all operations

## 📨 Notifications

- Firebase Cloud Messaging integration
- Background notification handling
- Notification tap navigation
- Local notification reminders

## 🔐 Security

- Token-based authentication
- Secure storage of tokens (flutter_secure_storage)
- HTTPS communication (when deployed)
- Input validation

## 🛠️ Development

### Common Patterns

- **Loading/Error/Empty states**: All screens handle these gracefully
- **Form validation**: Real-time validation for all inputs
- **Navigation**: Clean navigation with route generation
- **Error handling**: User-friendly error messages

### Key Widgets

- `CustomButton`: Reusable button with loading state
- `CustomTextField`: Form field with validation and error display
- `AppointmentCard`: Card widget for displaying appointments
- `LoadingIndicator`: Custom loading spinner

## 📁 Useful Commands

```bash
# Generate routes
flutter pub run build_runner build --delete-conflicting-outputs

# Format code
flutter format .

# Run tests
flutter test

# Build APK
flutter build apk --release 