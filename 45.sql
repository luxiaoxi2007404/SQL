41、查询各个课程及相应的选修人数；
SELECT TABLE1.cno
FROM
(
SELECT sc.cno ,cname AS 课程名称,COUNT(sno) AS 选修人数
FROM sc,course
WHERE sc.cno = course.cno
GROUP BY sc.cno
) as TABLE1

42、查询不同课程成绩相同的学生的学号、课程号、学生成绩；
SELECT sc.sno AS 学号,sc.cno AS 课程号,sc.score AS 学生成绩
FROM sc,sc AS sc1
WHERE sc.score = sc1.score
  AND  sc.sno != sc1.sno
  AND  sc.cno != sc1.cno

43、查询每门课程成绩最好的前两名的学生ID；
SELECT sc1.cno,.sc1.sno,sc1.score
FROM sc AS sc1
WHERE (SELECT COUNT(cno)
       FROM sc
       WHERE cno = sc1.cno
        AND sc1.score < score) <= 1
ORDER BY sc1.cno ASC, sc1.score DESC;

44、统计每门课程的学生选修人数(至少有2人选修的课程才统计)。要求输出课程号和选修人数，
SELECT cno,COUNT(sno)
FROM sc
GROUP BY cno
HAVING COUNT(cno) >= 2
ORDER BY COUNT(cno) DESC, cno ASC;

45、检索至少选修了5门课程的学生学号；
SELECT sno
FROM sc
GROUP BY sno
HAVING COUNT(cno) >= 5