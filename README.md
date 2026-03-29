# 🦸 Django Heroes

A simple and fun Django-based web application to manage and showcase superheroes. This project demonstrates core Django concepts such as models, views, templates, and CRUD operations.

---

## 🚀 Features

- Create, read, update, and delete heroes
- Store hero attributes (name, powers, description, etc.)
- Admin panel for easy management
- Clean and simple UI
- Django ORM integration

---

## 🛠️ Tech Stack

- **Backend:** Django (Python)
- **Database:** SQLite (default)
- **Frontend:** HTML, CSS (Django Templates)

---

## 📦 Installation

Follow these steps to run the project locally:

### 1. Clone the repository
```bash
git clone https://github.com/VarmaRahul/django-heroes.git
cd django-heroes
```

### 2. Create a virtual environment
```bash
python -m venv venv
```

### 3. Activate the virtual environment
```bash
venv\Scripts\activate
```

### 4. Install dependencies
```bash
pip install -r requirements.txt
```

### 5. Apply migrations
```bash
python manage.py migrate
```

### 6. Run the development server
```bash
python manage.py runserver
```

### 7. Open in browser
```bash
http://127.0.0.1:8000/
```

## 📁 Project Structure
```bash
django-heroes/
│
├── heroes/          # Main app
├── templates/       # HTML templates
├── db.sqlite3       # Default database
├── manage.py
└── requirements.txt
```

### ⚙️ Usage
- Visit the homepage to view heroes
- Add new heroes via forms or admin panel
- Edit or delete existing heroes

**Access admin panel at:**
```bash
/admin
```

### 🔐 Admin Setup
**Create a superuser to access Django admin:**
```bash
python manage.py createsuperuser
```
