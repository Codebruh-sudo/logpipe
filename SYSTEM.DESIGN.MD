🧠 System Design Overview
📐 Architecture Diagram
scss
Copy
Edit
┌─────────────┐      OTLP      ┌────────────────────┐       Push        ┌────────────┐
│ Log Sources │ ────────────→ │ OTEL Collector      │ ────────────────→ │ Loki       │
│ (Apps, API) │               │ (Receivers + Exporter)                      │ (Storage)  │
└─────────────┘               └────────────────────┘                      └────────────┘
                                                 │
                                                 ▼
                                         ┌────────────┐
                                         │ Grafana    │
                                         │ (Dashboard)│
                                         └────────────┘
⚙️ Components
OpenTelemetry Collector

Receives logs via OTLP (HTTP/gRPC)

Batches and exports to Loki

Loki

Log aggregation and indexing

Stores logs efficiently using label-based system

Grafana

Visualizes logs using Loki as data source

Dashboards include severity, timestamp, and custom filters

🔄 Data Flow
Logs are sent via OTLP to OpenTelemetry Collector.

OTEL processes and exports logs to Loki.

Grafana queries Loki and displays logs with filters.

Users view dashboards and set alerts if needed.

🔐 Security Notes (Optional Advanced Additions)
Consider using .env for secrets (Grafana admin, Loki creds)

Use reverse proxy or auth middleware in production

Add network segmentation (e.g., Docker internal-only)
