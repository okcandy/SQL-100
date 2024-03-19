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

/*rank of gold medal*/
WITH tbl4 AS 
	(SELECT Name, COUNT(1) AS Total_Gold_Medals
	FROM .athlete_events$
	WHERE Medal = 'Gold'
	GROUP BY Name),
tbl5 AS
	(SELECT *, DENSE_RANK() OVER(ORDER BY Total_Gold_Medals DESC) AS Rank
	FROM tbl4)
SELECT *
FROM tbl5
WHERE Rank <= 5
ORDER BY Rank;

/*total medal per country*/
SELECT Regions.region AS Country, Medal, COUNT(1) AS Total_Medals
FROM .athlete_events$ History
JOIN .noc_regions$ Regions ON Regions.NOC = History.NOC
WHERE Medal <> 'NA'
GROUP BY Regions.region, Medal;

