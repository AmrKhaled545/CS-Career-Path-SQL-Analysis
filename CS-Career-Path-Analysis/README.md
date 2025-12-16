# 📂 Data-Driven Exploration of Computer Science Fields & Career Paths

### 🚀 Choosing the Right Path in Tech using SQL

**Author:** Amr Khaled  
[cite_start]**Institution:** National Telecommunication Institute (NTI) [cite: 77, 80]

---

## 📖 Project Overview
The world of Computer Science is expanding faster than ever. [cite_start]With new technologies and roles emerging constantly, one key question arises: **"How do we choose the right path?"** [cite: 3, 4]

This project aims to answer that question by analyzing a dataset of **5,000 CS career tracks**. [cite_start]By transforming raw data into a narrative, this analysis helps learners, job seekers, and professionals make smarter, data-backed decisions about their future in tech[cite: 5, 6].

### 🎯 Objectives
[cite_start]The goal of this project is to[cite: 20]:
* [cite_start]**Understand the Landscape:** Analyze job demand and growth rates[cite: 30, 31].
* [cite_start]**Analyze Financials:** Compare salaries across fields, ages, and experience levels[cite: 38].
* [cite_start]**Develop Strategy:** Identify high-ROI paths, remote-friendly roles, and gender wage gaps[cite: 48, 51].

---

## 📊 The Dataset
[cite_start]The analysis is based on a rich dataset reflecting real-world decision factors, including[cite: 5, 8]:
* [cite_start]**Financials:** Salary levels (USD)[cite: 9].
* [cite_start]**Market Data:** Job demand scores, Growth rates, and Country-specific demand[cite: 10, 11].
* [cite_start]**Requirements:** Tools, Programming Languages, and Learning time[cite: 12, 13].
* [cite_start]**Demographics:** Gender, Age groups, and Experience levels[cite: 14, 17].

**Database Name:** `Nti_Training_SQL`  
**Table Name:** `CS_Fields_Tracks`

---

## 📝 The Data Story (Analysis Breakdown)
[cite_start]Instead of random queries, this project is structured as a **20-Question Data Story** divided into three phases[cite: 27, 28]:

### [cite_start]Phase I: The Landscape (Market Overview) [cite: 29]
* [cite_start]**Focus:** What is happening in the CS market right now? [cite: 36]
* [cite_start]**Key Queries:** Analyzed highest job demand, country-specific trends, and growth rates[cite: 31, 33].
* **SQL Skills:** `GROUP BY`, `ORDER BY`, `COUNT`, `AVG`.

### [cite_start]Phase II: The Payoff (Financial Insights) [cite: 37]
* [cite_start]**Focus:** Which paths offer the best financial return? [cite: 46]
* [cite_start]**Key Queries:** Identified highest/lowest salaries, age-based earnings, and salary vs. difficulty levels[cite: 40, 42].
* **SQL Skills:** `CASE` statements (for Age Groups), `TOP` (Ranking), Aggregation.

### [cite_start]Phase III: The Strategy (Actionable Takeaways) [cite: 47]
* [cite_start]**Focus:** What should I do next? [cite: 57]
* [cite_start]**Key Queries:** Calculated ROI (Salary per month of learning), analyzed the gender wage gap, and identified top remote-friendly tracks[cite: 50, 51, 52].
* **SQL Skills:** `CTE` (Common Table Expressions), Self-Joins, Multi-criteria filtering.

---

## 💡 Key Insights
[cite_start]Based on the data analysis, here are the top findings[cite: 58, 59]:
1.  [cite_start]**High Demand:** Fields like **AI, Cybersecurity, and Data** show the highest demand scores[cite: 60].
2.  [cite_start]**Salary Trends:** Advanced fields with longer learning curves yield significantly higher pay[cite: 61].
3.  [cite_start]**ROI (Return on Investment):** The best tracks are those that offer high salaries relative to shorter learning times[cite: 66].
4.  [cite_start]**Remote Work:** Highly remote-friendly tracks often offer competitive salaries, debunking the myth that remote pays less[cite: 65].
5.  [cite_start]**Gender Gap:** While differences exist, they vary significantly depending on the specific field[cite: 64].

---

## 💻 How to Run This Project

### 1. Clone the Repository
```bash
git clone [https://github.com/AmrKhaled545/CS-Career-Path-SQL-Analysis.git](https://github.com/AmrKhaled545/CS-Career-Path-SQL-Analysis.git)

