import logging
import sys
import datetime
import pandas as pd


def main():
    """Takes in the survey response flat file and creates a SQL text file of insert statements.

    This command line script ingests the `Recreational Activity Survey (Responses)` flat file provided by Google Forms into a pandas dataframe, separates the fields given as comma seperated lists into their own dataframes, and creates insert statements from those dataframes. Direct loading of the dataframes into the RDBMS isn't supported because the CCI Torch server requires a SSH connection, which isn't natively supported by SQLAlchemy.
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
    df_Survey_Answers = pd.DataFrame({
        'Survey_Answer_ID': CSV_dataframe.index,
        'Time_of_Day': CSV_dataframe['What time of day do you prefer to participate in a recreational activity? '],  # The space in the field name is from the original CSV
        'Workout_Location': CSV_dataframe['Where do you prefer to participate in a recreational activity?'],
        'Number_of_People': CSV_dataframe['How many people would you like to work out with in a group activity?'],
        'Max_Price': CSV_dataframe['How much would you feel comfortable paying for an hour long group fitness activity?'],
        'Max_Distance': CSV_dataframe['How far are you willing to travel for a recreational activity?'],
    })
    logging.info(f"`Survey_Answers` dataframe:\n{df_Survey_Answers.head()}")

    #Subsection: Create Dataframe for Relation `Days_of_Week`
    day_of_week_list = CSV_dataframe['What days of the week are you available to participate in a recreational activity?'].tolist()
    day_of_week_2D_list = []
    for entry in day_of_week_list:
        day_of_week_2D_list.append(entry.split(", "))
    df_Days_of_Week = pd.DataFrame({
        'Survey_Answer_ID': CSV_dataframe.index,
        'Day_of_Week': day_of_week_2D_list,
    })
    df_Days_of_Week = df_Days_of_Week.explode('Day_of_Week', ignore_index=True)
    logging.info(f"`Days_of_Week` dataframe:\n{df_Days_of_Week.head()}")

    #Subsection: Create Dataframe for Relation `Activities`
    activities_list = CSV_dataframe['What type of activities are you interested in? '].tolist()  # The space in the field name is from the original CSV
    activities_2D_list = []
    for entry in activities_list:
        activities_2D_list.append(entry.split(", "))
    df_Activities = pd.DataFrame({
        'Survey_Answer_ID': CSV_dataframe.index,
        'Activity': activities_2D_list,
    })
    df_Activities = df_Activities.explode('Activity', ignore_index=True)
    logging.info(f"`Activities` dataframe:\n{df_Activities.head()}")


    #Section: Create Insert Statement File
    #Subsection: Create the File, Including the Datetime of the Most Recent Response in the File Name
    most_recent_response = pd.to_datetime(CSV_dataframe['Timestamp']).max().strftime("%Y-%m-%dT%H.%M")
    SQL_fileIO = open(f'Insert_Statements_{most_recent_response}.sql', 'w+')
    logging.info(f"File `Insert_Statements_{most_recent_response}.sql` opened.")

    #Subsection: Create Insert Statements for Relation `Survey_Answers`
    Survey_Answers_records = df_Survey_Answers.itertuples(index=False, name=None)
    SQL_fileIO.write("-- Insert Statements for Survey_Answers\n\n")
    for record in Survey_Answers_records:
        SQL_fileIO.write(f"INSERT INTO Survey_Answers VALUES {record};\n")
    logging.info(f"`Survey_Answers` insert statements in file.")

    #Subsection: Create Insert Statements for Relation `Days_of_Week`

    #Subsection: Create Insert Statements for Relation `Activities

    #Subsection: Close the File
    SQL_fileIO.close()
    logging.info(f"File `Insert_Statements_{most_recent_response}.sql` closed.")


if __name__ == '__main__':
    main()