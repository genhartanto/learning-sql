# SQL Fundamentals: Learning Journey

A hands-on exploration of SQL concepts using PostgreSQL, documenting my progression from basic queries to advanced analytical techniques.

## 🎯 Learning Objectives

- Master SQL fundamentals for data analysis and manipulation
- Understand relational database design and normalization
- Build practical querying skills for real-world data science workflows
- Complement Python/pandas skills with database-level data processing

## 🛠️ Tech Stack

- **Database:** PostgreSQL 16
- **GUI Tool:** pgAdmin 4
- **Sample Data:** DVD Rental Database (Northwind-style retail dataset)

## 📚 Learning Path

### Phase 1: SELECT Basics ✅
- Core SELECT statements, filtering, and sorting
- Understanding DISTINCT and LIMIT
- File: [`queries/01_basics/select_basics.sql`](queries/01_basics/select_basics.sql)

### Phase 2: Aggregations (In Progress)
- GROUP BY, COUNT, SUM, AVG, MIN, MAX
- HAVING clause for filtered aggregations

### Phase 3: JOINs (Upcoming)
- INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN
- Multi-table analysis and relationship mapping

### Phase 4: Subqueries & CTEs (Upcoming)
- Common Table Expressions (WITH clauses)
- Nested queries and query optimization

### Phase 5: Window Functions (Upcoming)
- ROW_NUMBER, RANK, LAG, LEAD
- Analytical functions with PARTITION BY

## 🗂️ Project Structure
```
sql-fundamentals/
├── queries/           # SQL scripts organized by topic
│   ├── 01_basics/
│   ├── 02_aggregations/
│   └── 03_joins/
├── data/              # Data files (.gitignored)
└── resources/         # Reference materials and documentation
```

## 🚀 Setup Instructions

1. **Install PostgreSQL**
```bash
   # macOS
   brew install postgresql
   
   # Windows: Download from postgresql.org
```

2. **Download Sample Database**
   - Get the [DVD Rental database]([https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/](https://neon.com/postgresqltutorial/dvdrental.zip))
   - Extract `dvdrental.tar`

3. **Restore Database**
```bash
   # In pgAdmin: Right-click Databases → Create → Database (name: dvdrental)
   # Right-click dvdrental → Restore → Select dvdrental.tar
```

4. **Run Queries**
   - Open pgAdmin Query Tool
   - Load scripts from `queries/` folder
   - Execute and experiment!

## 📊 Key Learnings

- **SQL vs Pandas:** Understanding when to use SQL for large-scale data preprocessing vs pandas for in-memory analysis
- **Query Optimization:** Learning to think about data retrieval efficiency
- **Relational Thinking:** Transitioning from flat CSV mindset to normalized table structures

## 🔗 Resources

- [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
- [Mode SQL Tutorial](https://mode.com/sql-tutorial/)
- [SQLZoo Interactive Exercises](https://sqlzoo.net/)

## 📝 Notes

This repository documents my journey learning SQL as part of my data science skill development, alongside Python ETL and data analysis workflows.

---

**Status:** Actively learning | Last updated: February 2026
