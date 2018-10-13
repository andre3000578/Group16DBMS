/*
Group 16
David Nettey, Ayobami Ajayi, Sandeep Ramesh, Carlos Martinez Cuellar

We are choosing to create an index on the table "Problem" with "aid" as the search key.
A couple of the queries in Group Project 2 Problem 2 performs searches on this table. Typically having the "aid" as a search key.
However, the primary search key of the main data file is the primary key, "pid". So an index would have to be made on "aid" to
speed such queries up. The index would be secondary since it is being done on an attribute that is not the primary search key of the table.
*/
CREATE INDEX idx_aid
ON Problem(aid);

/*
We chose to rerun the following queries due to the fact that the "aid" attribute is being used as a search key in each query or subquery.
*/

/* 5*/
select pname from Problem, Author
where Problem.aid = Author.aid and aname = 'Rachel Moran' and max_score =
(select max(max_score) from Problem, Author where Author.aid = Problem.aid 
and aname = 'Rachel Moran');

/* 7*/
select cname, sum(compensation) as total from Contest_Problems, Author, Problem
where Author.aid = Problem.aid and Problem.pid = Contest_Problems.pid group by cname;

/* 9*/
UPDATE Author
SET
    compensation = compensation * 1.1
    WHERE
        aid IN (SELECT author.aid from Problem, Scored, Author where Problem.pid = Scored.pid and Problem.aid = Author.aid group by Author.aid
        having avg (score) between max(score) * .5 and max(score) * .75)

        select *
        from Author;