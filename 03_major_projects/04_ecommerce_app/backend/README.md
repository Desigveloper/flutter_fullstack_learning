# 🛍️ E-Commerce Backend

Backend server for the e-commerce application with robust APIs, database setup, and comprehensive features.

## 📂 Project Structure

```
backend/
├── pubspec.yaml
├── bin/
│   └── server.dart
├── lib/
│   ├── server.dart
│   ├── database/
│   │   ├── database.dart
│   │   └── schema.sql
│   ├── models/
│   │   ├── user.dart
│   │   ├── product.dart
│   │   ├── order.dart
│   │   └── review.dart
│   ├── services/
│   │   ├── auth_service.dart
│   │   ├── product_service.dart
│   │   ├── order_service.dart
│   │   └── review_service.dart
│   ├── routes/
│   │   ├── auth_routes.dart
│   │   ├── product_routes.dart
│   │   ├── order_routes.dart
│   │   └── review_routes.dart
│   └── middleware/
│       └── auth_middleware.dart
└── README.md
```

## ⚙️ Setup

1.  **Install dependencies**
    ```bash
    dart pub get
    ```

2.  **Database Setup**
    Run the schema script to create tables:
    ```bash
    dart bin/setup_database.dart
    ```

3.  **Environment**
    Create `.env` file with database credentials:
    ```env
    DATABASE_URL=postgres://user:password@localhost:5432/ecommerce
    ```

## 🚀 Running the Server

```bash
dart run bin/server.dart
```

**API Documentation**  
You can find detailed API documentation in the [backend-api-docs](backend-api-docs) folder.

## 🏗️ API Endpoints

### Authentication

- `POST /api/v1/auth/register` - Register new user
- `POST /api/v1/auth/login` - Login user
- `POST /api/v1/auth/refresh` - Refresh token

### Products

- `GET /api/v1/products` - List all products (with filters)
- `GET /api/v1/products/:id` - Get product details
- `POST /api/v1/products` - Create product (admin)
- `PUT /api/v1/products/:id` - Update product (admin)
- `DELETE /api/v1/products/:id` - Delete product (admin)

### Orders

- `POST /api/v1/orders` - Create order
- `GET /api/v1/orders` - List user's orders
- `GET /api/v1/orders/:id` - Get order details
- `PUT /api/v1/orders/:id/status` - Update order status (admin)

### Reviews

- `GET /api/v1/products/:id/reviews` - Get product reviews
- `POST /api/v1/reviews` - Add review
- `PUT /api/v1/reviews/:id` - Update review
- `DELETE /api/v1/reviews/:id` - Delete review

## 🛠️ Key Features

### Database

- **PostgreSQL** database with proper schema
- **SQL Join** queries for efficient data retrieval
- **Migrations** for schema updates

### Models

- `User`: id, name, email, password, role
- `Product`: id, name, description, price, category, images
- `Order`: id, userId, items, total, status, createdAt
- `Review`: id, userId, productId, rating, comment

### Services

- **Business Logic**: All business logic encapsulated in services
- **Data Validation**: Comprehensive validation for all inputs
- **Error Handling**: Proper error handling with meaningful messages

### Security

- **JWT Authentication**: Token-based authentication
- **Password Hashing**: Bcrypt for secure password storage
- **Role-Based Access**: Admin and user roles
- **Middleware**: Request validation and authentication middleware

### Middleware

- **Authentication Middleware**: Verifies JWT tokens
- **Role Middleware**: Checks user roles
- **Request Validation**: Validates request bodies

## 📦 Usage Examples

### Create Product
```dart
import 'package:backend/models/product.dart';
import 'package:backend/services/product_service.dart';

final productService = ProductService();

final product = await productService.createProduct(
  name: 'Wireless Headphones',
  description: 'High-quality wireless headphones',
  price: 99.99,
  category: 'Electronics',
  images: ['https://example.com/img1.jpg'],
);
```

### Create Order
```dart
import 'package:backend/models/order.dart';
import 'package:backend/services/order_service.dart';

final orderService = OrderService();

final order = await orderService.createOrder(
  userId: 'user-123',
  items: [
    {'productId': 'prod-123', 'quantity': 2},
    {'productId': 'prod-456', 'quantity': 1},
  ],
  paymentMethod: 'credit_card',
);
```

### Add Review
```dart
import 'package:backend/models/review.dart';
import 'package:backend/services/review_service.dart';

final reviewService = ReviewService();

final review = await reviewService.createReview(
  userId: 'user-123',
  productId: 'prod-123',
  rating: 5,
  comment: 'Excellent product!',
);
```

## 📝 API Documentation

See detailed API documentation in the [backend-api-docs](backend-api-docs) folder for complete endpoint information, request/response examples, and error codes.

## 📁 Useful Commands

```bash
# Get all packages
dart pub get

# Run the server
dart run bin/server.dart

# Test the database setup
dart bin/setup_database.dart

# Format code
dart format .
```

## 📄 License

This project is open source and available under the [MIT License](https://opensource.org/licenses/MIT).