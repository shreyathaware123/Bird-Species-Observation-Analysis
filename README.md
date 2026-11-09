# Bird Species Observation Analysis

An end-to-end data analytics project that studies bird species in forest and grassland habitats. The project cleans the raw observation data, merges the two habitats, explores the merged data, and turns the findings into clear insights for conservation and planning.

**Domain:** Environmental Studies, Biodiversity Conservation, Ecology

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Problem Statement](#problem-statement)
3. [Business Use Cases](#business-use-cases)
4. [Dataset](#dataset)
5. [Tools and Skills Used](#tools-and-skills-used)
6. [Project Workflow](#project-workflow)
7. [Analysis Done](#analysis-done)
8. [Key Insights](#key-insights)
9. [Project Structure](#project-structure)
10. [How to Run](#how-to-run)
11. [Author](#author)

---

## Project Overview

Birds are a good sign of how healthy an ecosystem is. In this project, I look at bird sightings from forest and grassland sites in national parks and see how habitat type, weather and other conditions affect which birds are seen and how many.

The goal is to turn raw field observations into clear findings that help with conservation, land management and eco-tourism.

## Problem Statement

Analyze the spread and variety of bird species in two ecosystems, **forests** and **grasslands**. Find out how things like vegetation, temperature, humidity and terrain affect bird populations and behavior. Find habitat patterns and see how each habitat affects bird diversity.

## Business Use Cases

- **Wildlife Conservation:** Protect important bird habitats and improve biodiversity.
- **Land Management:** Plan land use and habitat restoration based on what each species prefers.
- **Eco-Tourism:** Find bird-rich areas for bird-watching tourism.
- **Sustainable Agriculture:** Support farming methods that cause less harm to birds.
- **Policy Support:** Give data to environmental agencies to build conservation policies.
- **Biodiversity Monitoring:** Track the health of bird populations over time.

## Dataset

The data has two files, one for each habitat:

| File | What it holds |
|------|---------------|
| `Bird_Monitoring_Data_FOREST.csv` | Raw bird observations from forest sites |
| `Bird_Monitoring_Data_GRASSLAND.csv` | Raw bird observations from grassland sites |

The data comes from many national park units (for example Antietam, Catoctin Mountain, Rock Creek, Prince William Forest Park and others), identified by the `Admin_Unit_Code` column.

**Main columns:**

- **Location:** `Admin_Unit_Code`, `Sub_Unit_Code`, `Site_Name`, `Plot_Name`, `Location_Type`
- **Time:** `Year`, `Date`, `Start_Time`, `End_Time`, `Visit`, `Interval_Length`
- **Observer and method:** `Observer`, `ID_Method`, `Distance`, `Flyover_Observed`
- **Species:** `Common_Name`, `Scientific_Name`, `Sex`, `AcceptedTSN`, `NPSTaxonCode`, `AOU_Code`
- **Conservation:** `PIF_Watchlist_Status`, `Regional_Stewardship_Status`
- **Weather and conditions:** `Temperature`, `Humidity`, `Sky`, `Wind`, `Disturbance`
- **Count:** `Initial_Three_Min_Cnt`

## Tools and Skills Used

- **Python** (Pandas, NumPy, Matplotlib, Seaborn) in Jupyter Notebook
- **Skills:** Data Cleaning, Preprocessing, Exploratory Data Analysis, Data Visualization, Species Analysis, Spatial and Temporal Analysis

## Project Workflow

**Cleaning → Merge → EDA → Insights**

### 1. Data Cleaning and Preprocessing
Notebook: `1_Data_Cleaning_And_Preprocessing.ipynb`
- Clean the forest data and the grassland data separately
- Handle missing values and duplicate rows
- Fix data types (dates, times, true/false columns)
- Keep the columns needed for analysis
- Save the cleaned files: `Clean_forest_data.csv` and `clean_grassland.csv`

### 2. Merge
- Combine the cleaned forest and grassland data into one comparable dataset
- Save it as `Merge_on_Forest&Grassland.csv`

### 3. Exploratory Data Analysis (EDA)
Notebook: `2. EDA_on_Merge.ipynb`
- Run the analysis on the merged dataset (see the next section)

### 4. Insights
- Write simple, useful findings for conservation and planning

## Analysis Done

**Temporal Analysis**
- Seasonal and yearly trends in bird sightings
- Best time of day for bird activity (using `Start_Time` and `End_Time`)

**Spatial Analysis**
- Biodiversity hotspots by `Location_Type`
- Plot-level comparison using `Plot_Name`

**Species Analysis**
- Number of unique species (`Scientific_Name`) in each habitat
- Common activity types (`ID_Method`, `Interval_Length`)
- Male to female ratio by species

**Environmental Conditions**
- Effect of temperature, humidity, sky and wind on sightings
- Effect of disturbance on sightings

**Distance and Behavior**
- Which species are seen closer or farther away
- How often birds are seen flying over (`Flyover_Observed`)

**Observer Trends**
- Check if some observers report more birds or more species
- How repeat visits change species counts

**Conservation Insights**
- Trends in `PIF_Watchlist_Status` and `Regional_Stewardship_Status`
- Patterns using `AOU_Code`

## Key Insights

*Fill this section with your final findings from the EDA notebook. Example questions:*

- Which habitat (forest or grassland) has more species?
- Which months and times have the most bird activity?
- Which parks are biodiversity hotspots?
- Which watchlist species need the most attention?
- How do temperature, humidity and wind change sightings?

## Project Structure

```
Bird Species Observation Analysis/
│
├── Bird_Monitoring_Data_FOREST.csv          # raw forest data
├── Bird_Monitoring_Data_GRASSLAND.csv       # raw grassland data
│
├── 1_Data_Cleaning_And_Preprocessing.ipynb  # cleaning notebook
│
├── Clean_forest_data.csv                    # cleaned forest data
├── clean_grassland.csv                      # cleaned grassland data
├── Merge_on_Forest&Grassland.csv            # merged final dataset
│
├── 2. EDA_on_Merge.ipynb                    # EDA on merged data
│
└── README.md
```

## How to Run

1. **Download or clone the project folder**

2. **Install the required libraries**
   ```bash
   pip install pandas numpy matplotlib seaborn jupyter
   ```

3. **Run the cleaning notebook**
   Open `1_Data_Cleaning_And_Preprocessing.ipynb` and run all cells. It reads the raw forest and grassland CSV files and creates the cleaned files and the merged file.

4. **Run the EDA notebook**
   Open `2. EDA_on_Merge.ipynb` and run all cells to see the analysis and charts.

## Author

**Your Name**
- LinkedIn: <https://www.linkedin.com/in/shreya-thaware/>
- Portfolio: <https://shreyathaware123.github.io/my-portfolio-website/>
