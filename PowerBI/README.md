# **HR Analytics Dashboard**

## **Overview**  
This repository contains the Power BI dashboard designed for HR analytics. The dashboard includes key performance indicators (KPIs), charts, and interactive features to analyze employee data such as attrition, active employees, average age, and departmental attrition.

## **Features**  

### **1. KPIs**  
- **Overall Employees**: Displays the total number of employees.  
- **Attrition**: Shows the total number of employees who left the company.  
- **Attrition Rate**: Calculates the percentage of attrition.  
- **Active Employees**: Displays the total number of currently active employees.  
- **Average Age**: Provides the average age of employees.  

### **2. Charts**  
- **Pie Chart**: Department-wise attrition analysis.  
- **Frequency Chart**: Number of employees by age group and gender.  
- **Heat Map**: Job satisfaction rating across job roles.  
- **Bar Chart**: Education field-wise attrition.  
- **Donut Charts**: Attrition rate by gender and age group.  

### **3. Interactivity**  
- Dynamic slicers for education levels.  
- Filters and highlights for cross-chart interactions.  

## **Setup Instructions**  

### **1. Prerequisites**  
- Power BI Desktop installed.  
- Dataset used: HR Data (Ensure it is correctly formatted).  

### **2. Steps to Recreate**  
Follow the steps below to design the dashboard:  

#### **Step 1: Create KPIs**  
1. Use the **Card** visualization to display metrics like Overall Employees, Attrition, and Attrition Rate.  
2. Write DAX formulas for calculated measures such as Attrition Rate and Active Employees.  
3. Format the visuals with appropriate titles, borders, and backgrounds.  

#### **Step 2: Design Charts**  
- Use various chart types like pie, bar, column, matrix, and donut to represent data.  
- Customize visuals by adjusting titles, backgrounds, colors, and data labels.  
- Sort data logically (e.g., by age groups).  

#### **Step 3: Add Interactivity**  
1. Include slicers for education and apply formatting.  
2. Enable **Edit Interactions** to make visuals dynamic and responsive.  

## **Repository Contents**  
- `HR_Analytics.pbix`: The Power BI file containing the designed dashboard.  
- `data/`: Folder containing the HR dataset (CSV/Excel format).  
- `README.md`: This documentation file.  
- `images/`: Screenshots of the dashboard (for visualization).  

## **Formulas Used**  
 
```DAX
Attrition Rate = SUM('HR Data'[Attrition Count]) / SUM('HR Data'[Employee Count])
Active Employees = SUM('HR Data'[Employee Count]) + SUM('HR Data'[Attrition Count])

## Screenshots

### Dashboard Overview
![Dashboard Overview](https://github.com/MDhukia/Data-Analytics/blob/main/images/dashboard_overview.png)

### Example KPI
![Dashboard Overview](https://github.com/MDhukia/Data-Analytics/blob/main/images/dashboard_overview.png)

