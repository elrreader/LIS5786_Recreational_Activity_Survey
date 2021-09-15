import logging
import os
import sys
import pandas as pd


def main():
    """Takes in the survey response flat file and loads the data into a MySQL database.

    This command line script ingests the `Recreational Activity Survey (Responses)` flat file provided by Google Forms into a pandas dataframe, separates the fields given as comma seperated lists into their own dataframes, and loads all three dataframes into a MySQL database. 
    """
    logging.basicConfig(level=logging.INFO, format="[%(asctime)s] %(message)s")

    #Section: Create Dataframe from CSV File
    CSV_file_location = input("Please provide the absolute file path to the CSV with the survey response data. The path can be copied from the file explorer by selecting the file, then dragging and dropping it into this terminal window. ")
    if CSV_file_location[0] == '"' and CSV_file_location[-1] == '"':  # If the file path has spaces in it, it will be enclosed in quotes, making it an invalid file path; this removes the quotes if present
        CSV_file_location = CSV_file_location[1:-1]
    try:
        CSV_dataframe = pd.read_csv(CSV_file_location)
        logging.info(f"The CSV as a dataframe:\n{CSV_dataframe.head()}")
    except:
        logging.info("The file path provided is invalid. The program is exiting; use the up arrow to get the last terminal command if you wish to rerun this program.")
        sys.exit()


    #Section: Create Dataframe to Load into MySQL
    #Subsection: Create Dataframe for Relation `Survey_Answers`

    #Subsection: Create Dataframe for Relation `Days_of_Week`

    #Subsection: Create Dataframe for Relation `Activities`


    #Section: Load Records into MySQL
    #Subsection: Get MySQL Credentials

    #Subsection: Open Connection to MySQL Server

    #Subsection: Load Data into Relation `Survey_Answers`

    #Subsection: Load Data into Relation `Days_of_Week`

    #Subsection: Load Data into Relation `Activities

    #Subsection: Close Connection to MySQL Server


if __name__ == '__main__':
    main()