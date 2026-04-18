# 🎯 Task Manager App - Backend

Complete Dart backend for the task management application with REST APIs, PostgreSQL database, and JWT authentication.

## 📂 Project Structure

```
backend/
├── pubspec.yaml
├── lib/
│   ├── controllers/
│   │   ├── auth_controller.dart
│   │   ├── task_controller.dart
│   │   ├── project_controller.dart
│   │   ├── category_controller.dart
│   │   ├── comment_controller.dart
│   │   └── notification_controller.dart
│   ├── services/
│   │   ├── auth_service.dart
│   │   ├── task_service.dart
│   │   ├── project_service.dart
│   │   ├── category_service.dart
│   │   ├── notification_service.dart
│   │   └── comment_service.dart
│   ├── repositories/
│   │   ├── auth_repository.dart
│   │   ├── task_repository.dart
│   │   ├── project_repository.dart
│   │   ├── category_repository.dart
│   │   └── database_helper.dart
│   ├── models/
│   │   ├── user.dart
│   │   ├── task.dart
│   │   ├── project.dart
│   │   ├── category.dart
│   │   └── comment.dart
│   ├── middleware/
│   │   ├── auth_middleware.dart
│   │   ├── error_middleware.dart
│   │   └── logging_middleware.dart
│   ├── config/
│   │   ├── database_config.dart
│   │   └── app_config.dart
│   └── routes/
│       ├── auth_routes.dart
│       ├── task_routes.dart
│       ├── project_routes.dart
│       ├── category_routes.dart
│       ├── comment_routes.dart
│       └── notification_routes.dart
├── migrations/
│   ├── 001_create_users_table.sql
│   ├── 002_create_tasks_table.sql
│   ├── 003_create_projects_table.sql
│   ├── 004_create_categories_table.sql
│   ├── 005_create_comments_table.sql
│   └── 006_create_notifications_table.sql
├── .env
└── README.md
```

## 🚀 Getting Started

### Prerequisites
- Dart SDK 2.17.0 or higher
- PostgreSQL 10.0 or higher

### Installation

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd task_manager/backend
    ```

2.  **Install dependencies:**
    ```bash
    dart pub get
    ```

3.  **Create `.env` file:**
    ```bash
    cp .env.example .env
    ```

4.  **Configure database:**
    Update `.env` with your PostgreSQL credentials:
    ```env
    DB_HOST=localhost
    DB_PORT=5432
    DB_NAME=task_manager_db
    DB_USER=your_user
    DB_PASSWORD=your_password
    ```

5.  **Run migrations:**
    ```bash
    dart bin/scripts/run_migrations.dart
    ```

6.  **Start the server:**
    ```bash
    dart bin/server.dart
    ```

The server will start on `http://localhost:8080`.

## 🔌 API Endpoints

### Authentication

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/auth/register` | Register new user |
| POST | `/api/auth/login` | User login |
| POST | `/api/auth/refresh` | Refresh access token |

### Tasks

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/tasks` | Get all tasks |
| GET | `/api/tasks/:id` | Get task by ID |
| POST | `/api/tasks` | Create new task |
| PUT | `/api/tasks/:id` | Update task |
| DELETE | `/api/tasks/:id` | Delete task |
| PUT | `/api/tasks/:id/complete` | Mark task as complete |

### Projects

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/projects` | Get all projects |
| GET | `/api/projects/:id` | Get project by ID |
| POST | `/api/projects` | Create new project |
| PUT | `/api/projects/:id` | Update project |
| DELETE | `/api/projects/:id` | Delete project |
| GET | `/api/projects/:id/tasks` | Get tasks in project |
| GET | `/api/projects/:id/members` | Get project members |

### Categories

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/categories` | Get all categories |
| GET | `/api/categories/:id` | Get category by ID |
| POST | `/api/categories` | Create new category |
| PUT | `/api/categories/:id` | Update category |
| DELETE | `/api/categories/:id` | Delete category |
| GET | `/api/categories/:id/tasks` | Get tasks in category |

### Comments

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/tasks/:id/comments` | Get comments for task |
| POST | `/api/tasks/:id/comments` | Add comment to task |
| DELETE | `/api/comments/:id` | Delete comment |

### Notifications

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/notifications` | Get notifications |
| PUT | `/api/notifications/:id/read` | Mark notification as read |
| PUT | `/api/notifications/read-all` | Mark all as read |

## 🗄️ Database Schema

### Users Table
```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
```

### Tasks Table
```sql
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'pending',
    priority VARCHAR(50) DEFAULT 'medium',
    due_date TIMESTAMP,
    assigned_to INTEGER REFERENCES users(id) ON DELETE SET NULL,
    project_id INTEGER REFERENCES projects(id) ON DELETE SET NULL,
    category_id INTEGER REFERENCES categories(id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);
```

### Projects Table
```sql
CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);
```

### Categories Table
```sql
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(7) DEFAULT '#2196F3',
    created_at TIMESTAMP DEFAULT NOW()
);
```

### Comments Table
```sql
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    task_id INTEGER REFERENCES tasks(id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
```

### Notifications Table
```sql
CREATE TABLE notifications (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    type VARCHAR(50) NOT NULL,
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT NOW()
);
```

## 🔧 Development

### Scripts