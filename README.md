# App Performance Lakehouse Project

This repository implements a **Lakehouse-based analytics pipeline** for evaluating
mobile app performance, including:

- User acquisition quality
- Funnel & retention
- Revenue & LTV (D0 / D30 / D60 / D90)
- Fraud & low-quality traffic filtering

The project follows a **Raw → Standardize → Transform → Data Mart** design.

---

## Architecture Overview
![Architecture Overview](./docs/overview_architecture.png)

---

## Repository Structure

| Folder | Purpose |
|------|--------|
| `data/` | Sample raw CSV inputs |
| `sql/standardize/` | Clean, cast, normalize raw data |
| `sql/transform/dim/` | Dimension tables |
| `sql/transform/fact/` | Fact tables & metrics |
| `diagrams/` | Architecture diagrams |

---

## Data Flow Summary

1. **Raw data** loaded as-is (CSV simulation)
2. **Standardize layer**
   - Identity normalization
   - Timestamp normalization
   - Revenue casting
   - Fraud flag standardization
3. **Transform layer**
   - Dimensional modeling
   - LTV & cohort metrics
4. **Data Mart**
   - Analytics-ready fact tables

---

## Key Metrics Supported

- Installs
- Payers & payer rate
- LTV0 / LTV30 / LTV60 / LTV90
- Retention-ready cohorts
- Campaign & channel performance