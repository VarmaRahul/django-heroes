# 🦸 Django Heroes

A Django-based web application for managing and showcasing superheroes. This project demonstrates Django fundamentals alongside practical **DevOps, CI/CD, containerization and DevSecOps automation**.

The repository is also a hands-on learning project for implementing an end-to-end secure software delivery pipeline using GitHub Actions.

## 🚀 Features

- Django application with models, views, URLs and templates
- Hero management using Django ORM
- SQLite database for local development
- Django administrative interface
- Automated unit testing and code coverage
- Docker containerization with a non-root application user
- Automated CI/CD pipeline using GitHub Actions
- Integrated security scanning and container image verification

## 🛠️ Tech Stack

| Category | Technologies |
|---|---|
| Backend | Python, Django |
| Database | SQLite |
| Frontend | HTML, CSS, Django Templates |
| Containerization | Docker |
| CI/CD | GitHub Actions |
| Code Quality | SonarQube |
| SAST | CodeQL, Semgrep |
| Secret Scanning | Gitleaks |
| Dependency Scanning | pip-audit |
| Container Security | Trivy |
| Dockerfile Linting | Hadolint |
| Configuration Scanning | Checkov |
| SBOM | Syft / Anchore SBOM Action |
| Image Signing | Cosign |
| DAST | OWASP ZAP |
| Testing | Django TestCase, Coverage.py |

## 📁 Project Structure

```text
django-heroes/
│
├── .github/
│   └── workflows/
│       └── devsecops-pipeline.yml
│
├── myproject/
│   ├── manage.py
│   ├── db.sqlite3
│   │
│   ├── myproject/
│   │   ├── settings.py
│   │   ├── urls.py
│   │   ├── asgi.py
│   │   └── wsgi.py
│   │
│   └── avengers/
│       ├── migrations/
│       ├── templates/
│       ├── static/
│       ├── models.py
│       ├── views.py
│       ├── urls.py
│       └── tests.py
│
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
└── README.md
```

## 💻 Local Setup

### 1. Clone the repository

```bash
git clone https://github.com/VarmaRahul/django-heroes.git

cd django-heroes
```

### 2. Create a virtual environment

```bash
python -m venv .venv
```

### 3. Activate the virtual environment

**Windows – Git Bash:**

```bash
source .venv/Scripts/activate
```

**Windows – PowerShell:**

```powershell
.venv\Scripts\Activate.ps1
```

### 4. Install dependencies

```bash
python -m pip install --upgrade pip

pip install -r requirements.txt
```

### 5. Apply database migrations

```bash
python myproject/manage.py migrate
```

### 6. Run the development server

```bash
python myproject/manage.py runserver
```

### 7. Access the application

Open the following URL:

http://127.0.0.1:8000/

## 🐳 Docker

The application is containerized using a custom Dockerfile.

The Docker configuration includes:

- Lightweight Python Alpine base image
- Non-root application user
- Dependency installation using `requirements.txt`
- Container health check
- Configured application entry point

### Build the Docker image

```bash
docker build -t django-heroes:latest .
```

### Run the container

```bash
docker run -d \
  --name django-heroes \
  -p 8000:8000 \
  django-heroes:latest
```

Access the application at:

http://localhost:8000/

## 🧪 Testing and Code Coverage

The project includes automated Django unit tests for models and application views.

### Run unit tests

```bash
python myproject/manage.py test avengers
```

### Run tests with coverage

```bash
coverage run --source='myproject/avengers' myproject/manage.py test avengers

coverage report -m
```

### Generate HTML coverage report

```bash
coverage html
```

The HTML report is generated inside the `htmlcov/` directory.

## 🔐 DevSecOps CI/CD Pipeline

The project uses GitHub Actions to automate application validation, security checks, container builds and delivery.

### Pipeline stages

| Stage | Tools / Implementation |
|---|---|
| Dockerfile Linting | Hadolint |
| Infrastructure & Configuration Scanning | Checkov |
| Secret Detection | Gitleaks |
| Dependency Vulnerability Scanning | pip-audit |
| Static Application Security Testing | CodeQL, Semgrep |
| Code Quality Analysis | SonarQube |
| Unit Testing | Django TestCase |
| Code Coverage | Coverage.py |
| Source SBOM Generation | Syft |
| Container Build | Docker Buildx |
| Image SBOM Generation | Syft |
| Container Vulnerability Scanning | Trivy |
| Container Image Signing | Cosign |
| Signature Verification | Cosign |
| Smoke Testing | Docker |
| Dynamic Application Security Testing | OWASP ZAP |

### Pipeline triggers

- **Pull Requests targeting `main`:** Execute validation, testing and security scanning before code is merged.
- **Pushes to `main`:** Execute validation, build and publish the container image, followed by smoke testing and DAST.
- **Scheduled execution:** Run automated pipeline checks.
- **Manual execution:** Trigger the workflow through GitHub Actions.

### Security and build outputs

The pipeline generates and manages:

- CycloneDX source SBOM
- CycloneDX container image SBOM
- Trivy vulnerability scan report
- Django code coverage report
- OWASP ZAP DAST reports
- Signed container images using Cosign

Selected downloadable artifacts use short retention periods to avoid unnecessary artifact storage.

## ⚙️ Django Admin

Create a superuser to access the Django administration interface:

```bash
python myproject/manage.py createsuperuser
```

Access the admin panel:

http://127.0.0.1:8000/admin/

## 🎯 Project Objectives

This project is intended to demonstrate practical implementation of:

- Django application development
- Python application testing
- Docker image optimization and container security
- GitHub Actions workflow automation
- CI/CD pipeline design
- DevSecOps integration
- Software Bill of Materials (SBOM)
- Container vulnerability management
- Container image signing and verification
- Automated application security testing

## 👨‍💻 Author

**Rahul Varma**

Senior DevOps & Cloud Platform Engineer

GitHub: [VarmaRahul](https://github.com/VarmaRahul)