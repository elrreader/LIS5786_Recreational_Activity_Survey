-- Exclude schema creation statement when using FSU CCI Torch Server
CREATE SCHEMA `Recreational_Activity_Survey`;


CREATE TABLE Survey_Answers (
    Survey_Answer_ID INT NOT NULL PRIMARY KEY,
    -- Data fields here
);

CREATE TABLE Days_of_Week (
    Day_of_Week_ID INT NOT NULL PRIMARY KEY,
    Survey_Answer_ID INT NOT NULL,
    -- Data fields here
    INDEX Day_of_Week_FK (Survey_Answer_ID),
    CONSTRAINT Day_of_Week_to_Survey_Answer
        FOREIGN KEY Day_of_Week_FK (Survey_Answer_ID)
        REFERENCES Survey_Answers(Survey_Answer_ID)
);

CREATE TABLE Activities (
    Activity_ID INT NOT NULL PRIMARY KEY,
    Survey_Answer_ID INT NOT NULL,
    -- Data fields here
    INDEX Activity_FK (Survey_Answer_ID),
    CONSTRAINT Activity_to_Survey_Answer
        FOREIGN KEY Activity_FK (Survey_Answer_ID)
        REFERENCES Survey_Answers(Survey_Answer_ID)
);