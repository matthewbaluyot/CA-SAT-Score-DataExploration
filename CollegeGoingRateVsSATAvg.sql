WITH CTE_School AS
(SELECT sat.sname, sat.dname, sat.NumTstTakr testers, sat.AvgScrRead, sat.AvgScrMath, sat.AvgScrWrit
FROM PortfolioProject.dbo.SATScores sat
WHERE sat.rtype = 'S'),

CTE_GradRate AS
(SELECT
CASE
	WHEN CompleterType = 'AGY' THEN 'Yes'
	ELSE 'No'
END AS CSURequirementsMet,
gradstat.ReportingCategory,
gradstat.SchoolName, gradstat.DistrictName District, gradstat.CountyName County,
gradstat.[High School Completers], gradstat.[Enrolled In College - Total (12 Months)], 
gradstat.[College Going Rate - Total (12 Months)]
FROM PortfolioProject.dbo.PostSecondaryEnrollmentCA gradstat
WHERE AlternativeSchoolAccountabilityStatus = 'All' AND AggregateLevel = 'S' 
AND NOT [High School Completers] = '*' AND ReportingCategory = 'TA' AND CharterSchool = 'All')

SELECT * FROM CTE_GradRate ORDER BY SchoolName

