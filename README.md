✅ README.md
markdown
Copy
Edit
# 📊 Log Collection & Visualization Pipeline

This project sets up a complete **log observability pipeline** using open-source tools:  
**Grafana**, **Loki**, and **OpenTelemetry Collector**, all orchestrated using Docker Compose. It includes a CI/CD pipeline via GitHub Actions for automated deployment.

---

## 📌 Features

- 🔄 **Log ingestion** via OpenTelemetry Collector (OTLP)
- 🧲 **Log aggregation & storage** using Loki
- 📈 **Log visualization** with Grafana dashboards
- 🧪 **Custom filters** like `observed_timestamp_rfc3339`, `instrumentation_scope`, `severity_text`
- 🚀 **Dockerized stack** ready for production
- 🔁 **CI/CD pipeline** using GitHub Actions

---

## 📐 Architecture Diagram

┌────────┐ OTLP ┌────────────────────┐ Push ┌────────────┐
│ Source │ ───────────→ │ OTEL Collector │ ─────────────→ │ Loki │
│ (Logs) │ │ (Receivers + Exporter) │ (Storage) │
└────────┘ └────────────────────┘ └────────────┘
│
│
▼
┌────────────┐
│ Grafana │
│ (Dashboard)│
└────────────┘

yaml
Copy
Edit

---

## 📁 Folder Structure

log-pipeline/
├── docker-compose.yml
├── otel-collector-config.yaml
├── loki/
│ └── config.yaml
├── grafana/
│ ├── dashboards/
│ │ └── logs-dashboard.json
│ └── provisioning/
│ ├── dashboards.yml
│ └── datasources.yml
├── .github/
│ └── workflows/
│ └── deploy.yml
├── README.md

yaml
Copy
Edit

---

## 🚀 Getting Started

### 1️⃣ Clone the Repo

```bash
git clone https://github.com/your-username/log-pipeline.git
cd log-pipeline
2️⃣ Start the Stack
bash
Copy
Edit
docker compose up -d
3️⃣ Access Grafana
URL: http://localhost:3000

Login: admin / admin

🛠️ Configuration Overview
✅ OpenTelemetry Collector
otel-collector-config.yaml:

Receives logs via HTTP/OTLP

Batches logs

Exports them to Loki

✅ Loki
Configured to store logs locally

Accessible on port 3100

✅ Grafana
Automatically loads:

logs-dashboard.json

Loki as a data source

📦 CI/CD (GitHub Actions)
File: .github/workflows/deploy.yml

Validates configuration

Can be extended to auto-push logs or deploy to staging environments

📬 Sending Logs (Example)
You can send logs using PowerShell, Python, or Curl.
Example (PowerShell):

powershell
Copy
Edit
Invoke-RestMethod -Uri "http://localhost:4318/v1/logs" `
  -Method POST `
  -Body (Get-Content './log.json' | Out-String) `
  -ContentType "application/json"
📊 Dashboard Filters
The Grafana dashboard includes filters for:

observed_timestamp_rfc3339

instrumentation_scope

severity_text

custom_key, service.name, and more

🔐 Security Notes
Default passwords should be changed for Grafana

Add .env to manage secrets for production

Use volume mounts carefully on Windows

📃 License
MIT License © 2025
Maintained by Codebruh-sudo

yaml
Copy
Edit

---

Let me know if you'd like me to:

- Add a sample log file
- Generate the actual `.yml` dashboard loader config
- Customize the CI/CD pipeline in `deploy.yml`
