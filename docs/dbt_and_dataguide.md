# 📘 dbt & Databricks — Guía de Ejecución e Interpretación del Proyecto

## 1. Objetivo del documento

Este documento explica **cómo ejecutar** y **cómo interpretar** el proyecto `retail-medallion-data-pipeline`, con foco en el uso combinado de **Databricks** y **dbt** bajo una **arquitectura Medallion (Bronze / Silver / Gold)**.

Está pensado para:

* Personas que clonan el repositorio y quieren correrlo
* Entrevistadores técnicos
* Data Engineers / Analytics Engineers que quieran entender el modelo

No explica el paso a paso de construcción (eso vive en `docs/Guia_Construccion de proyecto`).

---

## 2. Arquitectura general del proyecto

El pipeline sigue una arquitectura **Medallion**, separando responsabilidades:

### 🟫 Bronze (ingestión cruda)

* Datos tal como llegan de la fuente
* Transformaciones mínimas o inexistentes
* Se manejan principalmente en **Databricks**

### 🪙 Silver (datos limpios y normalizados)

* Tipos corregidos
* Duplicados tratados
* Reglas de calidad básicas
* Estas tablas se crean en **Databricks** y se exponen como *sources* para dbt

### 🥇 Gold (datos analíticos)

* Modelos listos para negocio
* Dimensiones y tablas de hechos
* Tests de calidad y relaciones
* Construidos y documentados con **dbt**

---

## 3. ¿Qué ver y hacer en Databricks?

Databricks se utiliza como **motor de procesamiento y almacenamiento**.

### En Databricks se debe:

* Ejecutar notebooks de ingestión (Bronze)
* Crear y mantener las tablas **Silver**
* Consultar datos con SQL para validaciones rápidas

Ejemplo de consulta:

```sql
SELECT *
FROM retail_medallion_pipeline_schema.silver_orders
LIMIT 10;
```

Databricks **no contiene la lógica analítica final**: esa vive en dbt.

---

## 4. ¿Qué ver y hacer en dbt?

dbt se usa para:

* Modelar la capa **Gold**
* Definir dependencias entre modelos
* Ejecutar tests de calidad
* Generar documentación y lineage

### 4.1 Estructura del proyecto dbt

```text
models/
├── staging/
│   ├── stg_customers.sql
│   ├── stg_orders.sql
│   └── stg_products.sql
└── marts/
    ├── dimensions/
    │   ├── dim_customers.sql
    │   └── dim_products.sql
    └── facts/
        └── fact_orders.sql
```

---

## 5. Explicación de los modelos

### 🔹 Staging models (`stg_*`)

**Objetivo:** adaptar las tablas Silver al estándar dbt.

* Renombre de columnas
* Tipos consistentes
* Nombres claros

No agregan lógica de negocio.

---

### 🔹 Dimensiones (`dim_*`)

#### `dim_customers`

Representa a los clientes.

* 1 fila por cliente
* Usada para análisis por país, cliente, cohortes

#### `dim_products`

Representa los productos.

* 1 fila por producto
* Permite análisis por categoría y precio

---

### 🔹 Tabla de hechos (`fact_orders`)

Modelo central del análisis.

Contiene:

* Métricas (quantity, total_amount)
* Claves hacia dimensiones

Permite responder preguntas como:

* Ventas por cliente
* Ventas por producto
* Volumen y revenue

---

## 6. Tests de calidad en dbt

dbt permite definir tests declarativos.

### Tipos usados en este proyecto:

#### ✔ `not_null`

Asegura que un campo obligatorio no tenga nulos.

#### ✔ `unique`

Asegura unicidad (ej: claves primarias).

#### ✔ `relationships`

Verifica **integridad referencial**.

Ejemplo:

> Cada `customer_id` en `fact_orders` debe existir en `dim_customers`.

Si falla:

* Hay datos huérfanos
* El modelo no es confiable

---

## 7. Cómo ejecutar el proyecto dbt

Desde:

```text
dbt/retail_medallion_gold/
```

### Ejecutar modelos

```bash
py -m dbt.cli.main run
```

### Ejecutar tests

```bash
py -m dbt.cli.main test
```

---

## 8. Documentación dbt (muy importante)

dbt genera documentación navegable.

### Generar docs

```bash
py -m dbt.cli.main docs generate
```

### Servir docs localmente

```bash
py -m dbt.cli.main docs serve
```

Abrir en el navegador:

```
http://localhost:8080
```

---

## 9. Cómo interpretar dbt Docs

### Secciones clave:

#### 📌 Lineage

* Ver dependencias entre modelos
* Entender el flujo Silver → Staging → Gold

#### 📌 Models

* Descripción de cada tabla
* Columnas y tests asociados

#### 📌 Tests

* Estado de calidad de los datos

Esta documentación es **clave para analytics y negocio**.

---

## 10. Resumen conceptual

| Herramienta | Rol                               |
| ----------- | --------------------------------- |
| Databricks  | Procesamiento y almacenamiento    |
| dbt         | Modelado, calidad y documentación |
| Silver      | Datos limpios                     |
| Gold        | Datos analíticos                  |

Este enfoque separa responsabilidades y escala correctamente.

---

## 11. Próximos pasos posibles

* Incremental models
* Snapshots
* Exposures
* Orquestación (Jobs / Airflow)

---

📌 *Este proyecto demuestra un pipeline moderno de Data Engineering con foco en calidad y mantenibilidad.*
