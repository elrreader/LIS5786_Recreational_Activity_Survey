-- Exclude schema creation statement when using FSU CCI Torch Server
CREATE SCHEMA `Recreational_Activity_Survey`;


CREATE TABLE Survey_Answers (
    Survey_Answer_ID INT NOT NULL PRIMARY KEY,
    Time_of_Day VARCHAR(9) NOT NULL,
    Workout_Location VARCHAR(8) NOT NULL,
    Number_of_People VARCHAR(12) NOT NULL,
    Max_Price VARCHAR(38) NOT NULL,
    Max_Distance VARCHAR(33) NOT NULL
);

CREATE TABLE Days_of_Week (
    Day_of_Week_ID INT NOT NULL PRIMARY KEY,
    Survey_Answer_ID INT NOT NULL,
    Day_of_Week VARCHAR(9) NOT NULL,
    INDEX Day_of_Week_FK (Survey_Answer_ID),
    CONSTRAINT Day_of_Week_to_Survey_Answer
        FOREIGN KEY Day_of_Week_FK (Survey_Answer_ID)
        REFERENCES Survey_Answers(Survey_Answer_ID)
);

CREATE TABLE Activities (
    Activity_ID INT NOT NULL PRIMARY KEY,
    Survey_Answer_ID INT NOT NULL,
    Activity VARCHAR(17) NOT NULL,
    INDEX Activity_FK (Survey_Answer_ID),
    CONSTRAINT Activity_to_Survey_Answer
        FOREIGN KEY Activity_FK (Survey_Answer_ID)
        REFERENCES Survey_Answers(Survey_Answer_ID)
);