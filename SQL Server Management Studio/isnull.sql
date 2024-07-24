select id,isnull(maths,0)+isnull (english,0)+isnull (physics,0)+isnull (chemistry,0)+isnull (computer,0) from dbo.marks;

SELECT id, (maths_new + english_new + physics_new + chemistry_new + computer_new) AS total_marks
FROM (
    SELECT id,
        ISNULL(maths, 0) AS maths_new,
        ISNULL(english, 0) AS english_new,
        ISNULL(physics, 0) AS physics_new,
        ISNULL(chemistry, 0) AS chemistry_new,
        ISNULL(computer, 0) AS computer_new
    FROM dbo.marks) AS a;

select id,nullif(marks,267) from
(select id,isnull(maths,0)+isnull(english,0)+isnull(physics,0)+isnull(chemistry,0)+isnull(computer,0) 
total_marks from dbo.marks) AS a;

select nullif(267,267);
select nullif(260,267);