-- EXPLORATORY DATA ANALYSIS

SELECT *
FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

SELECT company, SUM(percentage_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT SUBSTRING(`date` ,1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date` ,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
;


-- Total kumulatif diberhentikan dari tahun 2020-2023
WITH Rolling_Total AS
(
SELECT SUBSTRING(`date` ,1,4) AS `Years`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date` ,1,4) IS NOT NULL
GROUP BY `Years`
ORDER BY 1 ASC
)
SELECT `Years`, SUM(total_off) OVER(ORDER BY `Years`) AS rolling_total
FROM Rolling_Total
;



SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC
;


-- Top 5 company laid_off berdasarkan tahun 2020-2023
WITH Company_year (company, years, total_laid_off)AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_Year_Rank AS
(SELECT *,
DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5
;

-- Top 5 country laid_off berdasarkan tahun 2020-2023
WITH Country_year (country, years, total_laid_off)AS
(
SELECT country, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country, YEAR(`date`)
), Country_Year_Rank AS
(SELECT *,
DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Country_year
WHERE years IS NOT NULL
)
SELECT *
FROM Country_Year_Rank
WHERE Ranking <= 5
;

#Bagaimana distribusi PHK berdasarkan industri?
-- Tujuan: Melihat sektor atau industri mana yang paling terdampak dengan menggunakan atribut industry dan total_laid_off.

SELECT * 
FROM layoffs_staging2
;

WITH Industry_Impact AS
(
SELECT industry, SUM(total_laid_off) AS Total_Laid_Off
from layoffs_staging2
GROUP BY industry
), Ranked_Industry AS
(Select industry, Total_Laid_Off,
ROW_NUMBER() OVER (ORDER BY Total_Laid_Off DESC) AS Ranking
FROM Industry_Impact
)
SELECT industry, Total_Laid_Off, Ranking
FROM Ranked_Industry
WHERE Ranking <=5
ORDER BY Total_Laid_Off DESC
;

SELECT industry, SUM(total_laid_off)
from layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC
;

#Apakah ada hubungan antara besarnya dana yang dikumpulkan (fund_raised_million) dan persentase PHK (percentage_laid_off)? 
# Tidak ada hubungan yang signifikan

SELECT funds_raised_millions, percentage_laid_off
FROM layoffs_staging2
WHERE funds_raised_millions AND percentage_laid_off IS NOT NULL
ORDER BY 1 DESC
;
