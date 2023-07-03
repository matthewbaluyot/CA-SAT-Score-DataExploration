WITH CTE_School AS
(SELECT sat.sname, sat.dname, sat.NumTstTakr testers, sat.AvgScrRead, sat.AvgScrMath, sat.AvgScrWrit
FROM PortfolioProject.dbo.SATScores sat
WHERE sat.rtype = 'S'), 

CTE_District AS
(SELECT sat.dname, sat.enroll12, sat.AvgScrRead, sat.AvgScrMath, sat.AvgScrWrit
FROM PortfolioProject.dbo.SATScores sat
WHERE sat.rtype = 'D')

-- Total score averages of school and corresponding district average
SELECT school.sname, school.dname, school.testers, (school.AvgScrMath + 
school.AvgScrRead + school.AvgScrWrit) TotalScoreAvg, (district.AvgScrMath +
district.AvgScrRead +  district.AvgScrWrit) DistrictScoreAvg,
(school.AvgScrMath + school.AvgScrRead + school.AvgScrWrit) -
(district.AvgScrMath + district.AvgScrRead +  district.AvgScrWrit) ScoreDiff
FROM CTE_School school
JOIN CTE_District district
ON district.dname = school.dname
WHERE testers >= 15
ORDER BY ScoreDiff





