-- 1. Write a query to find all the players in the "Arizona" team.
SELECT * FROM [dbo].['Football Players Data$']
WHERE Team = 'Arizona'

-- 2. Write a query to find all the players who play as a "WR" (Wide Receiver).
SELECT * FROM [dbo].['Football Players Data$']
WHERE Pos = 'WR'

-- 3. Write a query to list all players taller than 6 feet 2 inches.
SELECT *
FROM [dbo].['Football Players Data$']
WHERE Inches > 74

-- 4. Write a query to find all players who attended the "Washington" college.
SELECT * FROM [dbo].['Football Players Data$']
WHERE College = 'Washington'

-- 5. Write a query to list players who are 25 years old or younger.
SELECT * FROM [dbo].['Football Players Data$']
WHERE Age <= 25 AND Age != 'N/A'

-- 6. Write a query to find all players with missing Age data.
SELECT * FROM [dbo].['Football Players Data$']
WHERE Age LIKE '%[^0-9]%'

-- 7. Write a query to find players who are rookies (Exp = 'R').
SELECT * FROM [dbo].['Football Players Data$']
WHERE Exp = 'R'

-- 8. Write a query to find the tallest player on the "New Orleans" team.
SELECT Name, Inches
FROM (
SELECT Name, Inches, Team, RANK() OVER(PARTITION BY Team ORDER BY Inches DESC) AS HeightRank
FROM [dbo].['Football Players Data$']
GROUP BY Name, Team, Inches
	) AS RankSubq
WHERE HeightRank = 1 AND Team = 'New Orleans'

-- 9. Write a query to find players weighing more than 250 pounds.
SELECT *
FROM [dbo].['Football Players Data$']
WHERE Wt > 250

-- 10. Write a query to calculate the average height of players at each position.
SELECT DISTINCT Pos, AVG(Inches) OVER(PARTITION BY Pos)
FROM [dbo].['Football Players Data$']
GROUP BY Pos, Inches

-- 11. Write a query to find the heaviest player for each position.
SELECT Name, Wt, Pos
FROM (
SELECT Name, Wt, Pos, RANK() OVER(PARTITION BY Pos ORDER BY Wt DESC) AS WeightRank
FROM [dbo].['Football Players Data$']
GROUP BY Name, Wt, Pos
	) WeightSubq
WHERE WeightRank = 1
ORDER BY Wt DESC

-- 12. Write a query to rank players by age within their team. If two players have the same age, rank them by their weight.
SELECT Name, Team, Age, RANK() OVER(PARTITION BY Team ORDER BY age DESC, wt DESC) AS Rank
FROM [dbo].['Football Players Data$']
WHERE Age NOT LIKE '%[^0-9]%'
GROUP BY Name, Team, Age, Wt

-- 13. Write a query to calculate the average height (in inches) for all players older than 25 years.
SELECT AVG(Inches)
FROM [dbo].['Football Players Data$']
WHERE Age NOT LIKE '%[^0-9]%' AND Age > '25'

-- 14. Write a query to find all players whose height is greater than the average height of their respective team.
SELECT Name, Team FROM
(SELECT Name, Inches, Team, AVG(Inches) OVER(PARTITION BY Team) AS TeamAvg
FROM [dbo].['Football Players Data$']
GROUP BY Name, Inches, Team) AvgSubq
WHERE Inches > TeamAvg

-- 15. Write a query to find all players who share the same last name.
WITH NameCount AS (SELECT LastName, COUNT(LastName) AS NameCounts FROM [dbo].['Football Players Data$'] GROUP BY LastName)

SELECT Name 
FROM [dbo].['Football Players Data$'] f
JOIN NameCount c
ON f.LastName = c.LastName
WHERE NameCounts > 1

-- 16. Write a query to find the players with the minimum height for each position.
SELECT Name, Pos
FROM (
SELECT Name, Pos, RANK() OVER(PARTITION BY Pos ORDER BY Inches ASC) AS HeightRank
FROM [dbo].['Football Players Data$']
GROUP BY Name, Pos, Inches
	) Hsubq
WHERE HeightRank = 1

-- 17. Write a query to get the number of players for each team grouped by their experience level.
SELECT Team, Exp, COUNT(Name) AS PlayerCount
FROM [dbo].['Football Players Data$']
GROUP BY Team, Exp
ORDER BY Team, COUNT(Name), Exp

-- 18. Write a query to find the tallest and shortest players from each college.
WITH 
Tallest AS (SELECT Name, College, RANK() OVER(PARTITION BY College ORDER BY Inches DESC) AS TallRank, 'Tallest' AS Category FROM [dbo].['Football Players Data$'] ), 
Shortest AS (SELECT Name, College, RANK() OVER(PARTITION BY College ORDER BY Inches ASC) AS ShortRank, 'Shortest' AS Category FROM [dbo].['Football Players Data$'])

SELECT Name, College, Category
FROM Tallest
WHERE TallRank = 1
UNION
SELECT Name, College, Category
FROM Shortest
WHERE ShortRank = 1
ORDER BY College, Category

-- 19. Write a query to find all players whose weight is above the average weight for their respective position.

SELECT Name, Pos FROM
(SELECT Name, Wt, Pos, AVG(Wt) OVER(PARTITION BY Pos) AS PosAvg
FROM [dbo].['Football Players Data$']
GROUP BY Name, Wt, Pos) AvgSubq
WHERE Wt > PosAvg

-- 20. Write a query to calculate the percentage of players in each position for every team.
SELECT Team, Pos,
COUNT(*) AS PosCount, 
CONCAT((COUNT(*)* 100 / SUM(COUNT(*)) OVER(PARTITION BY Pos)), '%') AS PercentagePos
FROM [dbo].['Football Players Data$']
GROUP BY Team, Pos
