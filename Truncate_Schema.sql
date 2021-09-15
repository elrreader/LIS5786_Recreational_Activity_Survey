-- Remove Foreign Key Constraints

ALTER TABLE Days_of_Week DROP FOREIGN KEY Day_of_Week_to_Survey_Answer;
ALTER TABLE Activities DROP FOREIGN KEY Activity_to_Survey_Answer;


-- Truncate All Relations

TRUNCATE Survey_Answers;
TRUNCATE Days_of_Week;
TRUNCATE Activities;


-- Recreate Foreign Key Constraints

ALTER TABLE Days_of_Week ADD CONSTRAINT Day_of_Week_to_Survey_Answer
    FOREIGN KEY (Survey_Answer_ID)
    REFERENCES Survey_Answers(Survey_Answer_ID);

ALTER TABLE Activities ADD CONSTRAINT Activity_to_Survey_Answer
    FOREIGN KEY (Survey_Answer_ID)
    REFERENCES Survey_Answers(Survey_Answer_ID);