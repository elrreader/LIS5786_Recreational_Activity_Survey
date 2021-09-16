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