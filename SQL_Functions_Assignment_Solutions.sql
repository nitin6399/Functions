
-- SQL Functions Assignment Solutions
-- Student_Performance Table Based Answers

-- Question 1: Ranking students based on score (highest first)
SELECT
    student_id,
    name,
    score,
    RANK() OVER (ORDER BY score DESC) AS score_rank
FROM Student_Performance;

-- Question 2: Student score and previous student's score
SELECT
    name,
    score,
    LAG(score) OVER (ORDER BY score DESC) AS previous_score
FROM Student_Performance;

-- Question 3: Uppercase names and month name from join_date
SELECT
    UPPER(name) AS student_name,
    MONTHNAME(join_date) AS join_month
FROM Student_Performance;

-- Question 4: Student name and next student's attendance
SELECT
    name,
    attendance,
    LEAD(attendance) OVER (ORDER BY attendance) AS next_attendance
FROM Student_Performance;

-- Question 5: Assign students into 4 performance groups
SELECT
    name,
    score,
    NTILE(4) OVER (ORDER BY score DESC) AS performance_group
FROM Student_Performance;

-- Question 6: Row number per course based on attendance
SELECT
    course,
    name,
    attendance,
    ROW_NUMBER() OVER (
        PARTITION BY course
        ORDER BY attendance DESC
    ) AS row_num
FROM Student_Performance;

-- Question 7: Days enrolled (Assume current date = '2025-01-01')
SELECT
    name,
    join_date,
    DATEDIFF('2025-01-01', join_date) AS days_enrolled
FROM Student_Performance;

-- Question 8: Format join_date as Month Year
SELECT
    name,
    DATE_FORMAT(join_date, '%M %Y') AS formatted_join_date
FROM Student_Performance;

-- Question 9: Replace Mumbai with MUM
SELECT
    name,
    CASE
        WHEN city = 'Mumbai' THEN 'MUM'
        ELSE city
    END AS city_display
FROM Student_Performance;

-- Question 10: Highest score per course using FIRST_VALUE
SELECT
    course,
    name,
    score,
    FIRST_VALUE(score) OVER (
        PARTITION BY course
        ORDER BY score DESC
    ) AS highest_score_in_course
FROM Student_Performance;
