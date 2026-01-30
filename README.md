# Retail Medallion Data Pipeline

## 📌 Descripción general

Este proyecto implementa un pipeline de ingeniería de datos utilizando una arquitectura Medallion (Bronze, Silver, Gold) sobre un dominio Retail.

El objetivo es construir un flujo end-to-end que permita:
- Ingestar datos crudos de ventas
- Limpiar y estandarizar la información
- Modelar datos analíticos mediante dbt
- Generar tablas listas para análisis y visualización

## 🧱 Arquitectura del pipeline

La solución se estructura en tres capas:

### 🥉 Bronze — Ingestión cruda
Carga de archivos CSV sin transformación significativa, preservando los datos originales en formato Delta.

### 🥈 Silver — Transformación y limpieza
Normalización de tipos de datos, eliminación de duplicados y validaciones básicas.

### 🥇 Gold — Modelado analítico (dbt)
Construcción de modelos analíticos:
- Tablas de hechos (fact)
- Tablas de dimensiones (dim)

## 🛠️ Tecnologías utilizadas

- Databricks
- PySpark
- Delta Lake
- dbt
- GitHub

## 📊 Dataset

El proyecto utiliza datos simulados del dominio Retail:
- Órdenes de venta (`orders`)
- Clientes (`customers`)
- Productos (`products`)

## 📂 Estructura del repositorio

retail-medallion-data-pipeline/
├── databricks/
├── dbt/
├── data/
├── docs/
└── README.md