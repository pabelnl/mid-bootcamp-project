# This project aimed to develop models that effectively predict customer acceptance of credit card marketing offers. 
# Below is a breakdown of the steps employed:

## Data Preparation

1. **Data Import and Shape Verification:** Imported spreadsheet data for analysis. Checked the dimensions to get an initial feel for the size of the dataset.

2. **Identifying the Target Variable:** Based on the requirements, determined 'offer_accepted' as the target that the model must predict.

3. **Formatting and Exploratory Analysis:** Renamed columns with suitable formatting. Then, analyzed data types and identified null values in features.

4. **Converting to Categorical Features:** Variables like the number of bank accounts, credit cards, household size, etc., were identified as potential categorical features.

5. **Removing Unnecessary Features:** Dropped non-essential features (e.g., customer number).

6. **Handling Missing Values:** Employed a random sample imputer strategy to replace missing values.

7. **Outlier Treatment:** Created a function to identify and adjust outliers, focusing on continuous numerical features.

## Data Transformation and Feature Engineering

1. **Correlation Analysis:** Examined how variables relate to each other using a correlation heatmap. Removed a feature to address high colinearity.

2. **Chi-Squared Test:** Employed this test to assess relationships between categorical features and the target.

### Encoding:

- Categorical features underwent transformation by one-hot encoding

- Applied standard scaling to continuous numerical features.

- Data Splitting: Divided the data into training and testing sets to allow for model development and evaluation.

### Modeling and Evaluation

**Baseline Model:** Started with a Logistic Regression model to establish an initial reference for performance.

**Model Comparison:** Trained and evaluated additional models with Decision Trees and K-Nearest Neighbors algorithms.

**KNN Optimization:** Investigated model performance variations based on a range of 'K' values (neighbors) in KNN to fine-tune performance.
