WITH CTE_School AS
(SELECT sat.sname, sat.dname, sat.NumTstTakr testers, sat.AvgScrRead, sat.AvgScrMath, sat.AvgScrWrit
FROM PortfolioProject.dbo.SATScores sat
WHERE sat.rtype = 'S'), 

CTE_District AS
(SELECT sat.dname, sat.enroll12, sat.AvgScrRead, sat.AvgScrMath, sat.AvgScrWrit
FROM PortfolioProject.dbo.SATScores sat
WHERE sat.rtype = 'D')

-- Section score averages of school and corresponding district averages

SELECT school.sname, school.dname, school.testers, school.AvgScrMath, 
school.AvgScrRead, school.AvgScrWrit, district.AvgScrMath DistrictMathAverage,
district.AvgScrRead DistrictReadingAverage, district.AvgScrWrit DistrictWritingAverage
FROM CTE_School school
JOIN CTE_District district
ON district.dname = school.dname
WHERE testers >= 15
ORDER BY dname

