# 📂 Data-Driven Exploration of Computer Science Fields & Career Paths

### 🚀 Choosing the Right Path in Tech using SQL

**Author:** Amr Khaled  
**Institution:** National Telecommunication Institute (NTI) 

---

## 📖 Project Overview
The world of Computer Science is expanding faster than ever. With new technologies and roles emerging constantly, one key question arises: **"How do we choose the right path?"** 

This project aims to answer that question by analyzing a dataset of **5,000 CS career tracks**. By transforming raw data into a narrative, this analysis helps learners, job seekers, and professionals make smarter, data-backed decisions about their future in tech.

### 🎯 Objectives
The goal of this project is to:
* **Understand the Landscape:** Analyze job demand and growth rates.
* **Analyze Financials:** Compare salaries across fields, ages, and experience levels.
* **Develop Strategy:** Identify high-ROI paths, remote-friendly roles, and gender wage gaps.

---

## 📊 The Dataset
The analysis is based on a rich dataset reflecting real-world decision factors, including:
* **Financials:** Salary levels (USD).
* **Market Data:** Job demand scores, Growth rates, and Country-specific demand.
* **Requirements:** Tools, Programming Languages, and Learning time.
* **Demographics:** Gender, Age groups, and Experience levels.

**Database Name:** `Nti_Training_SQL`  
**Table Name:** `CS_Fields_Tracks`

---

## 📝 The Data Story (Analysis Breakdown)
Instead of random queries, this project is structured as a **20-Question Data Story** divided into three phases:

### Phase I: The Landscape (Market Overview)  
* **Focus:** What is happening in the CS market right now? 
* **Key Queries:** Analyzed highest job demand, country-specific trends, and growth rates .
* **SQL Skills:** `GROUP BY`, `ORDER BY`, `COUNT`, `AVG`.

### Phase II: The Payoff (Financial Insights) 
* **Focus:** Which paths offer the best financial return? 
* **Key Queries:** Identified highest/lowest salaries, age-based earnings, and salary vs. difficulty levels.
* **SQL Skills:** `CASE` statements (for Age Groups), `TOP` (Ranking), Aggregation.

### Phase III: The Strategy (Actionable Takeaways)
* **Focus:** What should I do next?
* **Key Queries:** Calculated ROI (Salary per month of learning), analyzed the gender wage gap, and identified top remote-friendly tracks.
* **SQL Skills:** `CTE` (Common Table Expressions), Self-Joins, Multi-criteria filtering.

---

## 💡 Key Insights
Based on the data analysis, here are the top findings:
1.  **High Demand:** Fields like **AI, Cybersecurity, and Data** show the highest demand scores.
2.  **Salary Trends:** Advanced fields with longer learning curves yield significantly higher pay.
3.  **ROI (Return on Investment):** The best tracks are those that offer high salaries relative to shorter learning times.
4.  **Remote Work:** Highly remote-friendly tracks often offer competitive salaries, debunking the myth that remote pays less.
5.  **Gender Gap:** While differences exist, they vary significantly depending on the specific field.

---

## 💻 How to Run This Project

### 1. Clone the Repository
```bash
git clone [https://github.com/AmrKhaled545/CS-Career-Path-SQL-Analysis.git]
```

### 2. Clone the Repository
```bash
CREATE DATABASE Nti_Training_SQL; 
USE Nti_Training_SQL;
```
### 3. Import Data
Import the raw CSV/Excel dataset into a table named `CS_Fields_Tracks`.

### 4. Run the Analysis
Open `SQLQuery2.sql` and execute the queries section by section to follow the narrative.

---

## 🤝 Acknowledgments
* **Instructor:** Dina Mohsen – For guidance, support, and motivation throughout the journey.
* **Program:** National Telecommunication Institute (NTI) training.

---

## 📬 Contact
**Amr Khaled** Feel free to reach out if you have any questions or want to discuss data analysis!






