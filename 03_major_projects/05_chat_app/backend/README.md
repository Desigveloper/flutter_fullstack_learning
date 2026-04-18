# 💬 Chat App - Dart Backend

Powerful Dart backend for the chat application with REST APIs, WebSocket support, and PostgreSQL database.

## 📂 Project Structure

```
backend/
├── pubspec.yaml
├── bin/
│   ├── server.dart
│   ├── controllers/
│   │   ├── auth_controller.dart
│   │   ├── user_controller.dart
│   │   ├── conversation_controller.dart
│   │   ├── message_controller.dart
│   │   ├── search_controller.dart
│   │   └── notification_controller.dart
│   ├── services/
│   │   ├── auth_service.dart
│   │   ├── user_service.dart
│   │   ├── conversation_service.dart
│   │   ├── message_service.dart
│   │   ├── search_service.dart
│   │   └── notification_service.dart
│   ├── repositories/
│   │   ├── auth_repository.dart
│   │   ├── user_repository.dart
│   │   ├── conversation_repository.dart
│   │   ├── message_repository.dart
│   │   ├── search_repository.dart
│   │   └── notification_repository.dart
│   ├── models/
│   │   ├── user.dart
│   │   ├── conversation.dart
│   │   ├── message.dart
│   │   ├── notification.dart
│   │   └── typing_indicator.dart
│   ├── middleware/
│   │   ├── auth_middleware.dart
│   │   ├── error_middleware.dart
│   │   └── logging_middleware.dart
│   ├── config/
│   │   ├── database_config.dart
│   │   ├── app_config.dart
│   │   └── cors_config.dart
│   └── utils/
│       ├── password_hasher.dart
│       ├── jwt_utils.dart
│       └── response_builder.dart
├── migrations/
│   ├── 001_create_users_table.sql
│   ├── 002_create_conversations_table.sql
│   ├── 003_create_messages_table.sql
│   ├── 004_add_indexes.sql
│   └── 005_create_notifications_table.sql
├── .env
├── pubspec.yaml
└── README.md
```

## 🔧 Setup

1.  **Create `.env` file:**
    ```bash
    cp .env.example .env
    ```

2.  **Install Dependencies**
    ```bash
    dart pub get
    ```

3.  **Configure Database**
    Update `.env` with your PostgreSQL credentials:
    ```env
    DB_HOST=localhost
    DB_PORT=5432
    DB_NAME=chat_app
    DB_USER=your_user
    DB_PASSWORD=your_password
    ```

4.  **Run Migrations**
    ```bash
    dart bin/scripts/run_migrations.dart
    ```

5.  **Start the Server**
    ```bash
    dart bin/server.dart
    ```
    The server will start on `http://localhost:8080`.

## 🔌 REST API Endpoints

### Authentication

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/v1/auth/register` | Register a new user |
| POST | `/api/v1/auth/login` | User login |
| POST | `/api/v1/auth/logout` | Logout user |
| POST | `/api/v1/auth/refresh` | Refresh access token |

### Users

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/users/me` | Get current user |
| PUT | `/api/v1/users/me` | Update profile |
| GET | `/api/v1/users/:id` | Get user by ID |
| GET | `/api/v1/users` | Search users |

### Conversations

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/conversations` | Get all conversations |
| POST | `/api/v1/conversations` | Create conversation |
| GET | `/api/v1/conversations/:id` | Get conversation |

### Messages

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/conversations/:id/messages` | Get messages |
| POST | `/api/v1/conversations/:id/messages` | Send message |
| PUT | `/api/v1/messages/:id/read` | Mark message as read |

### Search

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/search` | Search users and conversations |

### Notifications

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/notifications` | Get notifications |
| PUT | `/api/v1/notifications/:id/read` | Mark notification as read |

## 🌐 WebSocket Support

The server supports real-time WebSocket connections for:

-   Real-time message delivery
-   Typing indicators
-   Presence status updates
-   Read receipts

### WebSocket Endpoints

| Endpoint | Description |
|----------|-------------|
| `/ws/chat` | Main chat WebSocket | 

### WebSocket Events

**Client → Server:**

-   `join_room`: Join chat room
-   `leave_room`: Leave chat room
-   `send_message`: Send message
-   `typing`: Send typing indicator
-   `presence_update`: Update presence status

**Server → Client:**

-   `user_joined`: User joined room
-   `user_left`: User left room
-   `message_received`: New message
-   `message_sent`: Message sent confirmation
-   `message_read`: Message read receipt
-   `typing`: Typing indicator from other users
-   `presence_update`: User presence update

## 🏗️ Architecture

The backend follows a layered architecture:

```
Backend (Dart)
├── Controllers (HTTP endpoints)
├── Services (Business logic)
├── Repositories (Data access)
├── Models (Data structures)
├── Middleware (Auth, logging, error handling)
├── Config (Configuration)
└── Utils (Helpers)
```

## 🗄️ Database Schema

### Users Table
```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    profile_image_url TEXT,
    status VARCHAR(20) DEFAULT 'online',
    last_seen TIMESTAMP,
    created_at TIMESTAMP DEFAULT NOW()
);
```

### Conversations Table
```sql
CREATE TABLE conversations (
    id SERIAL PRIMARY KEY,
    type VARCHAR(20) NOT NULL, -- 'direct' or 'group'
    participant_ids INTEGER[] NOT NULL,
    last_message_id INTEGER,
    last_message_at TIMESTAMP,
    unread_count INTEGER DEFAULT 0,
    is_group BOOLEAN DEFAULT FALSE,
    group_name VARCHAR(100),
    group_avatar_url TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);
```

### Messages Table
```sql
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    conversation_id INTEGER NOT NULL,
    sender_id INTEGER NOT NULL,
    text TEXT,
    type VARCHAR(20) DEFAULT 'text', -- 'text', 'image', 'video', etc.
    delivery_status VARCHAR(20) DEFAULT 'sent',
    sent_at TIMESTAMP DEFAULT NOW(),
    read_at TIMESTAMP
);
```

## 📦 Dependencies

### Core Packages
- `shelf`: HTTP server framework
- `shelf_router`: Routing
- `shelf_cors_headers`: CORS handling
- `dart_frog_jwt`: JWT authentication
