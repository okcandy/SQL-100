/*total olympic games*/
/* for each sport, how many games were played*/
/*n6*/
WITH tbl1 AS
	(SELECT COUNT (DISTINCT Games) AS Total_Summer_Games
	FROM .athlete_events$
	WHERE Season = 'Summer'),
tbl2 AS 
	(SELECT DISTINCT Sport, Games
	FROM .athlete_events$
	WHERE Season = 'Summer'
	GROUP BY Sport, Games),
tbl3 AS 
	(SELECT Sport, COUNT(Games) AS No_of_Games 
	FROM tbl2 
	GROUP BY Sport)

SELECT * 
FROM tbl3
JOIN tbl1 ON tbl1.Total_Summer_Games = tbl3.No_of_Games;







