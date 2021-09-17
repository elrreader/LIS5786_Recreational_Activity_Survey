-- CROSSTABS --
-- Crosstab of `Time_of_Day` and `Max_Distance`: Does when students want to work out impact how far from campus they want to travel?
SELECT
    Time_of_Day,
    Max_Distance,
    COUNT(*) AS Participants_Selecting
FROM Survey_Answers
GROUP BY
    Time_of_Day,
    Max_Distance
ORDER BY Participants_Selecting DESC;

-- Crosstab of `Time_of_Day` and `Workout_Location`: Is there a relationship between when and where people want to work out?
SELECT
    Time_of_Day,
    Workout_Location,
    COUNT(*) AS Participants_Selecting
FROM Survey_Answers
GROUP BY
    Time_of_Day,
    Workout_Location
ORDER BY Participants_Selecting DESC;

-- Crosstab of `Number_of_People` and `Max_Price`: Are people who want smaller classes willing to pay more?
SELECT
    Number_of_People,
    Max_Price,
    COUNT(*) AS Participants_Selecting
FROM Survey_Answers
GROUP BY
    Number_of_People,
    Max_Price
ORDER BY Participants_Selecting DESC;

-- Crosstab of `Workout_Location` and `Max_Distance`: Does the desired workout location set how far people are willing to travel?
SELECT
    Workout_Location,
    Max_Distance,
    COUNT(*) AS Participants_Selecting
FROM Survey_Answers
GROUP BY
    Workout_Location,
    Max_Distance
ORDER BY Participants_Selecting DESC;

-- Crosstab of `Number_of_People` and `Workout_Location`: Is working out further from campus seen as a way to meet people?
SELECT
    Number_of_People,
    Workout_Location,
    COUNT(*) AS Participants_Selecting
FROM Survey_Answers
GROUP BY
    Number_of_People,
    Workout_Location
ORDER BY Participants_Selecting DESC;


-- PERCENT SELECTED --
-- Percent selecting given `Workout_Location` selecting each `Activity`: How strong is the relationship between preferred workout location and activity?
SELECT
    Survey_Answers.Workout_Location,
    Activities.Activity,
    Subquery.Number_of_Respondents_Selecting_Option AS Number_Selecting_Location,
    COUNT(Survey_Answers.Workout_Location) AS Number_Selecting_Location_and_Activity,
    (COUNT(Survey_Answers.Workout_Location) / Subquery.Number_of_Respondents_Selecting_Option) * 100 AS Percent_Selecting_Location_Who_Chose_Activity
FROM
    Survey_Answers,
    Activities,
    (
        SELECT
            Workout_Location AS Subquery_Option,
            COUNT(*) AS Number_of_Respondents_Selecting_Option
        FROM Survey_Answers
        GROUP BY Workout_Location
    ) AS Subquery
WHERE
    Survey_Answers.Survey_Answer_ID = Activities.Survey_Answer_ID AND
    Subquery.Subquery_Option = Survey_Answers.Workout_Location
GROUP BY
    Survey_Answers.Workout_Location,
    Activities.Activity
ORDER BY Percent_Selecting_Location_Who_Chose_Activity DESC;

-- Percent selecting given `Max_Distance` selecting each `Day_of_Week`: Does what day of the week students want to work out impact how far from campus they want to travel?
SELECT
    Survey_Answers.Max_Distance,
    Days_of_Week.Day_of_Week,
    Subquery.Number_of_Respondents_Selecting_Option AS Number_Selecting_Distance,
    COUNT(Survey_Answers.Max_Distance) AS Number_Selecting_Distance_and_Day,
    (COUNT(Survey_Answers.Max_Distance) / Subquery.Number_of_Respondents_Selecting_Option) * 100 AS Percent_Selecting_Distance_Who_Chose_Day
FROM
    Survey_Answers,
    Days_of_Week,
    (
        SELECT
            Max_Distance AS Subquery_Option,
            COUNT(*) AS Number_of_Respondents_Selecting_Option
        FROM Survey_Answers
        GROUP BY Max_Distance
    ) AS Subquery
WHERE
    Survey_Answers.Survey_Answer_ID = Days_of_Week.Survey_Answer_ID AND
    Subquery.Subquery_Option = Survey_Answers.Max_Distance
GROUP BY
    Survey_Answers.Max_Distance,
    Days_of_Week.Day_of_Week
ORDER BY Percent_Selecting_Distance_Who_Chose_Day DESC;

-- Percent selecting given `Time_of_Day` selecting each `Day_of_Week`: Is the preferred workout time consistant across all days of the week?
SELECT
    Survey_Answers.Max_Distance,
    Days_of_Week.Day_of_Week,
    Subquery.Number_of_Respondents_Selecting_Option AS Number_Selecting_Distance,
    COUNT(Survey_Answers.Max_Distance) AS Number_Selecting_Distance_and_Day,
    (COUNT(Survey_Answers.Max_Distance) / Subquery.Number_of_Respondents_Selecting_Option) * 100 AS Percent_Selecting_Distance_Who_Chose_Day
FROM
    Survey_Answers,
    Days_of_Week,
    (
        SELECT
            Max_Distance AS Subquery_Option,
            COUNT(*) AS Number_of_Respondents_Selecting_Option
        FROM Survey_Answers
        GROUP BY Max_Distance
    ) AS Subquery
WHERE
    Survey_Answers.Survey_Answer_ID = Days_of_Week.Survey_Answer_ID AND
    Subquery.Subquery_Option = Survey_Answers.Max_Distance
GROUP BY
    Survey_Answers.Max_Distance,
    Days_of_Week.Day_of_Week
ORDER BY Percent_Selecting_Distance_Who_Chose_Day DESC;

-- Precent selecting given `Number_of_People` selecting each `Activity`: What relationship is there between group sports and preferences for larger groups?
SELECT
    Survey_Answers.Number_of_People,
    Activities.Activity,
    Subquery.Number_of_Respondents_Selecting_Option AS Number_Selecting_Size,
    COUNT(Survey_Answers.Number_of_People) AS Number_Selecting_Size_and_Activity,
    (COUNT(Survey_Answers.Number_of_People) / Subquery.Number_of_Respondents_Selecting_Option) * 100 AS Percent_Selecting_Size_Who_Chose_Activity
FROM
    Survey_Answers,
    Activities,
    (
        SELECT
            Number_of_People AS Subquery_Option,
            COUNT(*) AS Number_of_Respondents_Selecting_Option
        FROM Survey_Answers
        GROUP BY Number_of_People
    ) AS Subquery
WHERE
    Survey_Answers.Survey_Answer_ID = Activities.Survey_Answer_ID AND
    Subquery.Subquery_Option = Survey_Answers.Number_of_People
GROUP BY
    Survey_Answers.Number_of_People,
    Activities.Activity
ORDER BY Percent_Selecting_Size_Who_Chose_Activity DESC;