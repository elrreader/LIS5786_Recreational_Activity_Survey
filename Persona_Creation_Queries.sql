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

-- Percent selecting given `Max_Distance` selecting each `Day_of_Week`: Does what day of the week students want to work out impact how far from campus they want to travel?

-- Percent selecting given `Time_of_Day` selecting each `Day_of_Week`: Is the preferred workout time consistant across all days of the week?

-- Precent selecting given `Number_of_People` selecting each `Activity`: What relationship is there between group sports and preferences for larger groups?