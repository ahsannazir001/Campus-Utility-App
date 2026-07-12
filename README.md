# Campus Utility Application

A modern, full-stack campus utility application designed to streamline student life. The project features a mobile frontend built with Flutter and a RESTful API backend built with Python Flask.

---

## 🚀 Key Features

* 📅 **Timetable Management**: A clean, color-coded dashboard providing students with real-time class schedules and details.
* 🛍️ **Campus Marketplace**: An in-app buy-and-sell marketplace where students can list used items, textbooks, and utilities.
* 🔍 **Lost & Found System**: A centralized campus noticeboard for reporting lost items and replying to threads.
* 🎟️ **Event Tracking**: Stay updated with upcoming university events, workshops, and extracurricular schedules.

---

## 🛠️ Technology Stack

### Frontend
* **Framework**: Flutter (Dart)
* **State Management**: Provider
* **Networking**: HTTP Client with REST API integration

### Backend
* **Framework**: Flask (Python)
* **Database**: SQLite with SQLAlchemy ORM
* **Authentication**: JSON Web Tokens (JWT) for secure endpoints
* **File Uploads**: Local storage handling for marketplace images

---

## 📁 Repository Structure

```text
├── backend/
│   ├── models.py        # SQLAlchemy Database Models (Schema)
│   ├── config.py        # Backend configuration
│   └── requirements.txt # Python dependencies
├── frontend/
│   ├── lib/
│   │   ├── models/      # Frontend Data Models
│   │   └── main.dart    # Application entry point
│   ├── pubspec.yaml     # Flutter dependencies
│   └── README.md
```

> [!NOTE]
> **Intellectual Property Protection:** To protect the core intellectual property of this application, some proprietary implementation folders (such as screen UI widgets, providers, API communication services, and the main Flask app runner) have been omitted from this public repository. The core folder structure and database schema models are retained to demonstrate software architecture and database design patterns.
