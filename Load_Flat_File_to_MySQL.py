
def main():
    """Takes in the survey response flat file and loads the data into a MySQL database.

    This command line script ingests the `Recreational Activity Survey (Responses)` flat file provided by Google Forms into a pandas dataframe, separates the fields given as comma seperated lists into their own dataframes, and loads all three dataframes into a MySQL database. 
    """
    #Section: Create Dataframe from CSV File


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