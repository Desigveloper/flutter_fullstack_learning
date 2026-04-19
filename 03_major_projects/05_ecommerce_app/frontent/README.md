# 🛍️ E-Commerce Frontend

Complete Flutter frontend for the e-commerce application with modern UI, state management, and comprehensive features.

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
│   │   ├── product/
│   │   │   ├── products_list_screen.dart
│   │   │   ├── product_detail_screen.dart
│   │   │   └── search_results_screen.dart
│   │   ├── cart/
│   │   │   ├── cart_screen.dart
│   │   │   └── checkout_screen.dart
│   │   ├── order/
│   │   │   ├── orders_list_screen.dart
│   │   │   └── order_detail_screen.dart
│   │   ├── review/
│   │   │   └── review_screen.dart
│   │   └── shared/
│   │       ├── home_screen.dart
│   │       ├── profile_screen.dart
│   │       └── product_card.dart
│   ├── providers/
│   │   ├── auth_provider.dart
│   │   ├── product_provider.dart
│   │   ├── cart_provider.dart
│   │   ├── order_provider.dart
│   │   └── review_provider.dart
│   ├── models/
│   │   ├── user.dart
│   │   ├── product.dart
│   │   ├── order.dart
│   │   └── review.dart
│   ├── services/
│   │   ├── api_service.dart
│   │   ├── auth_service.dart
│   │   └── notification_service.dart
│   └── widgets/
│       ├── custom_button.dart
│       ├── custom_text_field.dart
│       ├── product_card.dart
│       ├── loading_indicator.dart
│       ├── error_message.dart
│       └── pagination.dart
└── README.md
```

## ⚙️ Setup

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

### Products

- Browse all products
- Product detail view
- Search and filter products
- Product categories
- Image carousel

### Cart

- Add products to cart
- Update quantities
- Remove products
- View cart total
- Checkout process

### Orders

- View order history
- Order details
- Track order status
- Reorder products

### Reviews

- Add product reviews
- View product reviews
- Edit and delete reviews

### Notifications

- Push notifications
- In-app notifications
- Order status updates
- Promotional notifications

## 🎨 Theme

- Modern material design
- Custom color scheme (blue/teal primary)
- Dark mode support
- High-quality typography
- Responsive layouts

## 🔄 State Management

- **Riverpod** for state management
- Providers for auth, products, cart, orders, reviews
- Auto-disposal of resources
- Clean separation of concerns

## 🔐 Security

- Token-based authentication
- Secure storage of tokens (flutter_secure_storage)
- HTTPS communication (when deployed)
- Input validation

## 📱 Screens

### Auth Screens

- `LoginScreen`: Email/password login, Google sign-in support
- `RegisterScreen`: User registration form

### Product Screens

- `ProductsListScreen`: Grid/list view with categories, filters, search
- `ProductDetailScreen`: Product images, description, reviews, add to cart
- `SearchResultsScreen`: Display search results with pagination

### Cart Screens

- `CartScreen`: View and manage cart items
- `CheckoutScreen`: Shipping info, payment method, order summary

### Order Screens

- `OrdersListScreen`: Tab view for "Pending", "Completed", "Cancelled"
- `OrderDetailScreen`: Complete order details with status tracking

### Review Screens

- `ReviewScreen`: Rate and write review after purchase

### Shared Screens

- `HomeScreen`: Dashboard with featured products, categories
- `ProfileScreen`: User info, manage addresses, view orders

## 🛠️ Key Features

### Product Display
```dart
// Product card with clean UI
ProductCard(
  product: product,
  onTap: () {
    Navigator.pushNamed(
      context,
      Routes.productDetail,
      arguments: product.id,
    );
  },
)
```

### Add to Cart
```dart
onAddToCart: () {
  context.read(cartProvider.notifier).addToCart(product, 1);
}
```

### Checkout Process
```dart
// Clean checkout flow
CheckoutScreen(
  onOrderPlaced: (order) {
    context.read(orderProvider.notifier).addOrder(order);
    context.read(cartProvider.notifier).clearCart();
    Navigator.pushReplacementNamed(
      context,
      Routes.orderSuccess,
      arguments: order,
    );
  },
)
```

### Search Functionality
```dart
// Live search with debouncing
onSearchChanged: (query) {
  context.read(productProvider.notifier).searchProducts(query);
}
```

## 📦 Usage Examples

### Create Product
```dart
import 'package:frontend/models/product.dart';
import 'package:frontend/providers/product_provider.dart';

final productProvider = Provider((ref) => ProductProvider());

// Create product
await ref.read(productProvider).createProduct(
  name: 'Wireless Headphones',
  description: 'High-quality wireless headphones',
  price: 99.99,
  category: 'Electronics',
  images: ['https://example.com/img1.jpg'],
);
```

### Add Review
```dart
import 'package:frontend/models/review.dart';
import 'package:frontend/providers/review_provider.dart';

final reviewProvider = Provider((ref) => ReviewProvider());

// Add review
await ref.read(reviewProvider).addReview(
  appointmentId: 'appt-123',
  productId: 'prod-123',
  rating: 5,
  comment: 'Excellent product!',
);
```

### Search Products
```dart
import 'package:frontend/providers/product_provider.dart';

final productProvider = Provider((ref) => ProductProvider());

// Search products with debouncing
await ref.read(productProvider).searchProducts('headphones');
```

## 📄 License

This project is open source and available under the [MIT License](https://opensource.org/licenses/MIT).