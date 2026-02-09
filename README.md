# Retail Medallion Data Pipeline

## 📌 Descripción general

Este proyecto implementa un pipeline de ingeniería de datos end-to-end utilizando una arquitectura **Medallion (Bronze, Silver, Gold)** sobre un dominio Retail, combinando **Databricks** y **dbt**.

El objetivo es simular un escenario real de ingeniería de datos donde los datos:
- se ingieren en crudo,
- se transforman y validan,
- y finalmente se modelan para análisis y toma de decisiones.

## 🎯 Objetivos del proyecto

- Ingestar datos crudos de ventas desde archivos CSV
- Limpiar y estandarizar la información en Databricks
- Construir modelos analíticos con dbt
- Aplicar tests de calidad de datos
- Generar tablas listas para análisis y visualización (BI / dashboards)

## 🧱 Arquitectura del pipeline

La solución se estructura en tres capas claramente definidas:

### 🥉 Bronze — Ingestión cruda (Databricks)
- Carga de archivos CSV sin transformación significativa  
- Preservación de los datos originales  
- Almacenamiento en formato Delta

### 🥈 Silver — Transformación y limpieza (Databricks)
- Normalización de tipos de datos  
- Eliminación de duplicados  
- Validaciones básicas de integridad  

### 🥇 Gold — Modelado analítico (dbt)
- Construcción de modelos analíticos
- Tablas de dimensiones (`dim_*`)
- Tablas de hechos (`fact_*`)
- Tests de calidad (not_null, unique, relationships)
- Documentación automática y lineage

## 🛠️ Tecnologías utilizadas

- **Databricks** (Spark, SQL)
- **PySpark**
- **Delta Lake**
- **dbt**
- **GitHub**

## 📊 Dataset

El proyecto utiliza datos simulados del dominio Retail:
- Órdenes de venta (`orders`)
- Clientes (`customers`)
- Productos (`products`)

## 📂 Estructura del repositorio

retail-medallion-data-pipeline/
├── data/ # Datos de entrada (CSV)
├── databricks/ # Notebooks y lógica Silver
├── dbt/ # Proyecto dbt (capa Gold)
├── docs/ # Documentación del proyecto
└── README.md


## 📚 Documentación

La documentación detallada del proyecto se encuentra en la carpeta `docs/`:

- **Guía de construcción del proyecto**  
- **Guía de uso e interpretación de dbt y Databricks**

📄 Ver: `docs/dbt_and_dataguide.md`

## 🚀 Cómo ejecutar el proyecto (alto nivel)

1. Ejecutar la ingesta y transformaciones Bronze/Silver en Databricks  
2. Ejecutar los modelos dbt (Gold):
   ```bash
   dbt run
   dbt test
Generar y visualizar documentación dbt:

dbt docs generate
dbt docs serve