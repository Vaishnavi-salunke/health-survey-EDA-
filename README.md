# Health Survey Analysis (EDA)
1. Introduction
Mental health is one of the most important yet often overlooked aspects of human well
being. With the increasing awareness of psychological issues, it is crucial to understand
patterns and behaviors related to mental health across different demographic groups.
This mini project focuses on performing an Exploratory Data Analysis (EDA) on a
mental health survey dataset. The dataset consists of responses collected from individuals
about their mental health conditions, treatment status, work-life interference, and family
history.
The aim of this analysis is to uncover meaningful insights about how factors such as
age, gender, family history, and workplace environment influence the likelihood of seeking
treatment for mental health issues. By leveraging data visualization and statistical anal
ysis using the R programming language, this project aims to summarize and interpret
patterns that can help in promoting workplace mental health awareness.
2. Objectives
The main objectives of this project are as follows:
1. To perform data preprocessing and handle missing or inconsistent values.
2. To understand demographic characteristics such as age and gender distribution.
3. Toanalyze the relationship between treatment and key factors such as family history
and work interference.
4. To visualize patterns using appropriate statistical graphics.
5. To summarize key findings and propose insights based on the data
   3. Dataset Description
The dataset used in this mini-project is titled survey.csv, which contains responses
from individuals participating in a mental health survey. It includes demographic and
behavioral attributes related to mental health treatment and work-life balance. The
primary purpose of this dataset is to explore how various factors such as age, gender,
family history, and work interference affect the likelihood of seeking treatment.
Key Attributes:
• Age– Represents the age of each respondent (numeric).
• Gender– Describes the gender identity of the respondent (categorical; e.g., Male,
Female, Other).
• Treatment– Indicates whether the respondent is currently receiving treatment for
a mental health condition (Yes/No).
• Family History– Specifies if there is a family history of mental illness (Yes/No).
• Work Interfere– Shows how often work interferes with the respondent’s mental
health (e.g., Often, Rarely, Never).
The dataset contains both numerical and categorical variables, making it suitable for
exploratory data analysis and visualization. It was imported into R using the read.csv()
function and subsequently cleaned by removing missing values and standardizing cate
gorical entries for accurate visualization and analysis.
4. Methodology
The project was implemented using the R programming language to perform Exploratory
Data Analysis (EDA) on the survey.csv dataset. The entire process was divided into sys
tematic steps to ensure clean, reliable, and insightful analysis. Each step of the method
ology is explained below:
4.1 Step 1: Loading Required Libraries
Before starting the analysis, essential R libraries such as tidyverse, ggplot2, dplyr,
corrplot, and DataExplorer were installed and loaded. These libraries were used for
data cleaning, visualization, correlation analysis, and generating automated EDA reports.
4.2 Step 2: Importing the Dataset
The dataset was imported into R using the read.csv() function. After importing, func
tions such as str(), summary(), and names() were used to check the data structure,
column names, and overall summary statistics.
4.3 Step 3: Data Cleaning
The dataset was examined for missing values using colSums(is.na(data)). All incom
plete rows were removed using the na.omit() function to ensure data consistency. The
Gender column was standardized by converting all text to lowercase and grouping varia
tions into three consistent categories: Male, Female, and Other.
4.4 Step 4: Univariate Analysis
This step focused on analyzing single variables individually:
• Age Distribution: A histogram was created using ggplot() to visualize the
distribution of respondent ages.
• Gender Distribution: A bar plot displayed the count of male, female, and other
respondents.
These visualizations helped understand the demographic spread of the dataset.
4.5 Step 5: Bivariate Analysis
Relationships between two variables were analyzed to identify potential associations:
• Age vs Treatment: Checked how treatment-seeking behavior varied across age
groups
• Family History vs Treatment: Compared treatment rates among those with
and without a family history of mental illness.
• Work Interference vs Treatment: Analyzed how work-life interference affected
treatment-seeking behavior.
4.6 Step 6: Correlation Analysis
Numeric columns in the dataset were analyzed using the corrplot() function to identify
relationships between variables. However, since only one numeric column (Age) existed,
the correlation plot displayed minimal relationships.
4.7 Step 7: Automated EDA Report
An automated HTML report was generated using the create
report() function from
the DataExplorer package. This provided a comprehensive overview of missing values,
data distribution, and key summary plots.
4.8 Step 8: Deriving Insights
Finally, visual outputs and statistical findings were interpreted to derive insights related
to mental health treatment trends. This included identifying the most affected age group,
influence of family history, and work interference patterns.
5. Results (Statistical Findings, Visualizations)
This section presents the statistical findings and visual interpretations derived from the
Exploratory Data Analysis (EDA) of the mental health survey dataset. The results have
been obtained after cleaning and analyzing the data using R. Each visualization provides
insights into how various demographic and personal factors influence treatment-seeking
behavior for mental health issues.
5.1 Summary Statistics
The dataset was first analyzed numerically using the summary() function to understand
the spread and nature of data values. It revealed that most respondents were young
professionals aged between 20 and 40 years, while a small number of outliers were observed
at the higher age range.
5.2 Age Distribution
Ahistogram of the Age column was plotted to understand the distribution of respondents
by age. Most participants were in the age group of 25–35 years, indicating that mental
health concerns are commonly reported among working-age individuals.
5.3 Gender Distribution
A bar plot was generated to show the proportion of male, female, and other respondents
after cleaning inconsistent text entries in the Gender column. It was observed that the
majority of responses were from males, followed by females, with very few identifying
as other genders. This imbalance is typical of datasets collected from technology or
corporate environments.
5.4 Age vs Treatment
Ahistogram grouped by the treatment variable showed that respondents in the age range
of 25–35 years are more likely to seek treatment compared to younger or older participants.
This suggests higher mental health awareness among early-career professionals.
5.5 Family History vs Treatment
A stacked bar chart was plotted to analyze the effect of family mental health history on
treatment-seeking behavior. Results indicate that respondents with a family history of
mental illness are significantly more likely to seek treatment than those without such a
background.
5.6 Work Interference vs Treatment
Another grouped bar chart compared work interference levels (Never, Rarely, Sometimes,
Often) with treatment status. Respondents who reported frequent interference between
work and mental health were found to have higher treatment rates, emphasizing the
importance of a supportive work environment
5.7 Correlation Analysis
The correlation matrix was generated using the corrplot() function to analyze numeric
relationships. As the dataset contained only one numeric attribute (Age), the correlation
plot did not reveal strong associations, confirming that most features were categorical.
5.8 Automated EDA Report
Anautomatedreport was generated using the create
report() function from the DataExplorer
package. This report summarized missing values, data types, distributions, and variable
importance through structured visualizations. It provided a quick overview and helped
confirm the accuracy of manual EDA steps.
5.9 Overall Observations
• The dataset mainly consists of respondents aged 25–35 years.
• Gender imbalance is observed, with a higher proportion of male respondents.
• Family history and work interference are major influencing factors for seeking treat
ment.
• Automated and manual analyses produce consistent findings, validating data qual
ity.
6. Results and Discussion
This section presents the visual and statistical findings from the analysis
6.1 Age Distribution
   6.1 Age Distribution
   <img width="656" height="574" alt="image" src="https://github.com/user-attachments/assets/c157c1c6-1f5e-4943-877f-5bc2f470adda" />
   Most respondents fall between the age range of 25 to 35 years, indicating that the majority
of survey participants are working professionals
6.2 Gender Distribution
   <img width="714" height="400" alt="image" src="https://github.com/user-attachments/assets/c5aa9b4d-adff-42bb-8f1a-c8d527dce64e" />
After cleaning inconsistent gender labels, it was observed that male respondents form the
majority of the dataset, followed by females, with very few participants identifying as
other genders
6.3 Age vs Treatment
   <img width="724" height="585" alt="image" src="https://github.com/user-attachments/assets/b4a7834c-e995-49cb-8294-fa278f00b4bd" />
The graph indicates that individuals between 25–35 years show a relatively higher ten
dency to seek treatment compared to other age groups
   6.4 Family History vs Treatment

   



