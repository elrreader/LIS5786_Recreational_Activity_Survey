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