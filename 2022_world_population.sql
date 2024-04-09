--DATA EXPLORATION - WORLD POPULATION


--SELECT THE DATA WE'LL BE WORKING WITH, ORDERED BY COUNTRY
Select *
From world_population
order by 3


--CLEANING DUPLICATE ROWS WITH COMMON TABLE EXPRESSION (CTE)
With  world_populationCTE As
(
	Select  *, ROW_NUMBER() Over(Partition BY Rank order By Rank) as RowNumber
	from world_population
)

Delete from world_populationCTE
where RowNumber > 1

--CLEANED TABLE AFTER CTE
Select *
From world_population
order by 3
--WORLD POPULATION PERCENTAGE SUM - DOUBLE CHECKING ROW ACCURACY
Select SUM("World Population Percentage")
From world_population


--BY COUNTRY

--WHICH COUNTRY HAS THE LARGEST POPULATION AS OF 2022
Select "Country", "2022 Population"
From world_population
order by  2 desc
--WHICH COUNTRY HAS THE SMALLEST POPULATION AS OF 2022
Select "Country", "2022 Population"
From world_population
order by  2 asc

--WHICH COUNTRY HAS THE LARGEST WORLD POPULATION PERCENTAGE AS OF 2022
Select "Country", "World Population Percentage"
From world_population
order by  2 desc
--WHICH COUNTRY HAS THE SMALLEST WORLD POPULATION PERCENTAGE AS OF 2022
Select "Country", "World Population Percentage"
From world_population
order by  2 asc

--WHICH COUNTRY HAS THE LARGEST POPULATION GROWTH RATE
Select "Country", "Growth Rate"
From world_population
order by 2 desc
--WHICH COUNTRY HAS THE SMALLEST POPULATION GROWTH RATE
Select "Country", "Growth Rate"
From world_population
order by 2 asc

--RENAME "Density (per kmÂ²)" -> "Density"
--OBJECT EXPLORER(left column) > Databases > System Databases > master > tables > dbo.world_population > Columns > right click and rename

--WHICH COUNTRY IS THE MOST DENSE
Select "Country", "Density"
From world_population
order by 2 desc
--WHICH COUNTRY IS THE LEAST DENSE
Select "Country", "Density"
From world_population
order by 2 asc


--CONTINENT OVERVIEW

--WHICH CONTINENT HAS THE LARGEST/SMALLEST POPULATION
Select "Continent", "2022 Population", "World Population Percentage", "Growth Rate", "Density"
From world_population
order by  1, 2 desc
--COMBINE ROWS WITH THE SAME CONTINENT NAME AND ADD THE VALUES TOGETHER
Select "Continent", SUM("2022 Population") as "2022 Total Population", SUM("World Population Percentage") as "2022 World Population Percentage", AVG("Growth Rate") as "2022 Average Growth Rate", AVG("Density") as "2022 Average Density"
From world_population
Group By "Continent"
order by  2 desc
