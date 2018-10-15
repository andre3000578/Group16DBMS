/*
GOAL:
The compensation of authors should be increased as follows. Taking ‘aid’ as input from user, if that author
has the highest number of problems, he should get 20% raise in his compensation; If it is the 2nd highest,
he should get 15% raise in his compensation; if it is the 3rd highest, he should get 10% raise in his
compensation; otherwise, the default 5% raise should be applied.
*/

--TODO: TEST TO SEE IF IT WORKS
GO
CREATE PROCEDURE author_comp
    @aid INT --The id of the author
AS
    BEGIN

        UPDATE Author
        SET compensation = CASE
            WHEN @aid = (SELECT TOP 1 aid FROM (SELECT aid, COUNT(pid) AS num_prob FROM Problem GROUP BY aid) AS p ORDER BY p.num_prob DESC) --Checks if the author has highest number of problems
                THEN compensation * 1.2 --20% raise
            WHEN @aid = (SELECT TOP 1 aid FROM (SELECT TOP 2 aid, COUNT(pid) AS num_prob FROM Problem GROUP BY aid ORDER BY num_prob ASC) AS p ORDER BY p.num_prob DESC) --Checks if author has the 2nd highest number of problems
                THEN compensation * 1.15 --15% raise
            WHEN @aid = (SELECT TOP 1 aid FROM (SELECT TOP 3 aid, COUNT(pid) AS num_prob FROM Problem GROUP BY aid ORDER BY num_prob ASC) AS p ORDER BY p.num_prob DESC) --Checks if author has the 3rd highest number of problems
                THEN compensation * 1.1 --10% raise
            ELSE --If the author is not in the top 3 for number of problems
                compensation * 1.05 --5% raise
            END
        WHERE aid = @aid;

    END
GO