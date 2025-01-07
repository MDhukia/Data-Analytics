# End-to-End Walmart Data Analysis Using SQL + Python Project

## Project Overview
This project provides an end-to-end data analysis solution to extract critical business insights from Walmart sales data. Python is utilized for data processing and analysis, SQL for advanced querying, and structured problem-solving techniques to address key business questions.

---

## Project Steps

### 1. Set Up the Environment
   - **Tools Used**: Visual Studio Code, Python, MySQL.
   - **Goal**: Create a structured workspace within VS Code and organize project folders for smooth development and data handling.

### 2. Configure Kaggle API
   - **API Setup**: Obtain your Kaggle API token from [Kaggle](https://www.kaggle.com/) by navigating to your profile settings and downloading the JSON file.
   - **Configure Kaggle**:
      - Place the downloaded `kaggle.json` file in your local `.kaggle` folder.
      - Use the command `kaggle datasets download -d <dataset-path>` to download datasets directly into your project.

### 3. Download Walmart Sales Data
   - Use the Kaggle API to download the Walmart sales dataset.

### 4. Install Required Libraries and Load Data
   - Install necessary Python libraries: `pandas`, `numpy`, `sqlalchemy`, `mysql-connector-python`.
   - Load the data into a Pandas DataFrame for initial analysis and transformations.

### 5. Explore the Data
   - **Goal**: Conduct initial data exploration to understand data distribution, check column names and types, and identify potential issues.
   - **Analysis**: Use functions like `.info()`, `.describe()`, and `.head()` for a quick overview of the data structure and statistics.

### 6. Data Cleaning
   - **Remove Duplicates**: Identify and remove duplicate entries to avoid skewed results.
   - **Handle Missing Values**: Drop or fill rows/columns with missing values depending on significance.
   - **Fix Data Types**: Ensure consistent data types (e.g., dates as `datetime`, prices as `float`).
   - **Currency Formatting**: Use `.replace()` to handle and format currency values for analysis.
   - **Validation**: Verify the cleaned data to ensure no inconsistencies remain.

### 7. Feature Engineering
   - **Create New Columns**: Calculate the `Total Amount` for each transaction by multiplying `unit_price` by `quantity`. Add this as a new column.
   - **Enhance Dataset**: Adding calculated fields will streamline SQL analysis and aggregation tasks.

### 8. Load Data into MySQL
   - **Set Up Connections**: Connect to MySQL using `sqlalchemy` and load the cleaned data into the database.
   - **Table Creation**: Use Python SQLAlchemy to automate table creation and data insertion.
   - **Verification**: Run initial SQL queries to confirm that the data is loaded accurately.

### 9. SQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Write and execute SQL queries to address key business questions:
     - Revenue trends across branches and categories.
     - Identifying best-selling product categories.
     - Sales performance by time, city, and payment method.
     - Analyzing peak sales periods and customer buying patterns.
     - Profit margin analysis by branch and category.

---

## Results
### Key Insights
1. **Revenue Trends**: The revenue trends highlighted seasonal spikes during holiday periods, with branch-specific variations.
2. **Top Categories**: Electronics and Groceries were the highest-performing categories across most branches.
3. **Customer Preferences**: Cash remained the most preferred payment method, followed by credit card transactions.
4. **Peak Hours**: Evening shifts consistently saw the highest transaction volumes.
5. **Profit Analysis**: Branches with high revenue didn’t necessarily correspond to higher profit margins, highlighting the need for optimized pricing.

---





