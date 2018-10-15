USE [cs-dsa-4513-sql-db]
GO

CREATE PROCEDURE ProblemProcedure (
 @pid int ,
 @pname varchar(255),
 @max_score int ,
 @aid int)
AS
BEGIN
INSERT INTO Problem (pid, pname, max_score, aid)
VALUES
(@pid, @pname, @max_score, @aid)

UPDATE Problem
SET
    max_score = AVG(max_score) * SUM(max_score)
    WHERE
    aid IN (SELECT author.aid from Problem, Scored, Author where Problem.pid = Scored.pid and Problem.aid = Author.aid group by Author.aid)

END
GO

CREATE PROCEDURE DisplayProblemAuthor
AS
BEGIN
SELECT * FROM Problem;
Select * FROM Author;
END
GO