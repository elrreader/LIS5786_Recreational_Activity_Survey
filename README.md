# Recreational Activity Survey: Flat File to Relational Database
Group five in LIS 5786 in Fall 2021 created a Google Forms survey to collect user data. All seven questions use fixed values, but two of them allow more than one choice to be selected, making detailed analysis of the results in a flat file difficult. In-depth analysis requires constructing a relational database schema and transforming the flat file exported from Google Forms into SQL insert statements.

## 1. Creating the MySQL Schema
This step only needs to be done once.
1. Run "Schema_Creation.sql" in the MySQL client

## 2. Transforming the Flat File into Insert Statements
1. Generate a view of the Google Forms responses in Google Sheets
2. Download the Google Sheet as a CSV
3. In the command line, navigate to the file where this repository is located
4. Enter `python Load_Flat_File_to_MySQL.py` at the command line (users with Python 2 and 3 will need to use `python3`)

## 3. Load the Data into MySQL
1. Run "Truncate_Schema.sql" in the MySQL client to remove all of the old data (because the Google Forms responses are re-downloaded each time, keeping the data would lead to duplication)
