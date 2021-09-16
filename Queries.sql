-- The number of respondents who picked each of the options from the single-selection field `Workout_Location`
SELECT
    Survey_Answers.Workout_Location,
    COUNT(*) AS Number_of_Responses
FROM Survey_Answers
GROUP BY Workout_Location;


-- The number of times each option in the multiple-selection field `Activity` was selected
SELECT
    Activity,
    COUNT(Activity)
FROM Activities
GROUP BY Activity;


-- The number of respondents who picked the saim pair of options from the single-selection fields `Workout_Location` and `Time_of_Day`
SELECT
    Workout_Location,
    Time_of_Day,
    COUNT(*) AS Participants_Selecting
FROM Survey_Answers
GROUP BY
    Workout_Location,
    Time_of_Day;


-- The number of respondents selecting each option in the multiple-selection field `Activity`
SELECT
    COUNT(Survey_Answers.Survey_Answer_ID) AS Participants_Selecting,
    Activities.Activity
FROM
    Survey_Answers,
    Activities
WHERE Survey_Answers.Survey_Answer_ID = Activities.Survey_Answer_ID
GROUP BY Activities.Activity;


-- The total number of responses to the multiple-selection field `Activity` selected by the respondents who picked each of the options from the single-selection field `Workout_Location`
SELECT
	Survey_Answers.Workout_Location,
    COUNT(Activities.Activity) AS Number_of_Activities_Selected
FROM Survey_Answers
	JOIN Activities ON Survey_Answers.Survey_Answer_ID = Activities.Survey_Answer_ID
GROUP BY Survey_Answers.Workout_Location;


-- The number of respondents who selected each option from the single-selection field `Workout_Location` who selected the given response to the multiple-selection field `Activity`
SELECT
	Survey_Answers.Workout_Location,
    Activities.Activity,
    COUNT(Activities.Activity) AS Participants_Selecting
FROM Survey_Answers
	JOIN Activities ON Survey_Answers.Survey_Answer_ID = Activities.Survey_Answer_ID
GROUP BY
    Survey_Answers.Workout_Location,
    Activities.Activity;

SELECT
    Survey_Answers.Workout_Location,
    Activities.Activity,
    COUNT(Survey_Answers.Workout_Location) AS Participants_Selecting
FROM
    Survey_Answers,
    Activities
WHERE Survey_Answers.Survey_Answer_ID = Activities.Survey_Answer_ID
GROUP BY
    Survey_Answers.Workout_Location,
    Activities.Activity;


-- A record for each respondent with the choice they made in the single-selection field `Workout_Location` and the total number of respondents who made that selection
SELECT
    Survey_Answers.Workout_Location,
    Subquery.Total_Participants_Selecting_Location
FROM
    Survey_Answers,
    (
        SELECT
            Workout_Location AS Subquery_Location,
            COUNT(*) AS Total_Participants_Selecting_Location
        FROM Survey_Answers
        GROUP BY Subquery_Location
    ) AS Subquery
WHERE Survey_Answers.Workout_Location = Subquery.Subquery_Location;


-- The percentage of the number of respondents who made a given selection in the single-selection field `Workout_Location` who selected a certain value in the multiple-selection field `Activity`
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
    Activities.Activity;