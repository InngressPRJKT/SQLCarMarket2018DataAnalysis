-- Query for Top 10 Units sold in 2018
SELECT
  DISTINCT(a.Automaker) AS Automaker,
  a.Genmodel AS Model,
  b.Year AS 'Year',
  c.2018 AS 'No. of Units Sold in 2018'
FROM general_cars_data a
LEFT JOIN price_table b on a.Genmodel_ID=b.Genmodel_ID
LEFT JOIN sales_table c on b.Genmodel_ID=c.Genmodel_ID
WHERE
  b.Year = 2018
ORDER BY c.2018 DESC
LIMIT 10;

-- Query for Brands with Most Sold in 2018
SELECT
	DISTINCT(a.Automaker) AS Automaker,
    SUM(c.2018) AS 'Total Sold in 2018'
FROM general_cars_data a
LEFT JOIN price_table b on a.Genmodel_ID=b.Genmodel_ID
LEFT JOIN sales_table c on b.Genmodel_ID=c.Genmodel_ID
WHERE
  b.Year = 2018
GROUP BY a.Automaker
ORDER BY SUM(c.2018) DESC
LIMIT 10;
 
-- Query for Market Share of Brands in 2018 for Pie Chart
SELECT
	DISTINCT(a.Automaker) AS Automaker,
    SUM(c.2018) AS 'Total Sold in 2018'
FROM general_cars_data a
LEFT JOIN price_table b on a.Genmodel_ID=b.Genmodel_ID
LEFT JOIN sales_table c on b.Genmodel_ID=c.Genmodel_ID
WHERE
  b.Year = 2018
GROUP BY a.Automaker
ORDER BY SUM(c.2018) DESC;

-- Query for Average Car Prices Per Brand
SELECT
	DISTINCT(a.Automaker) AS 'Automaker',
    FORMAT(AVG(DISTINCT(b.Entry_price)), 2) AS 'Average Price of Cars'
FROM general_cars_data a
LEFT JOIN price_table b on a.Genmodel_ID=b.Genmodel_ID
WHERE
	b.Year = 2018
GROUP BY a.Automaker
ORDER BY AVG(b.Entry_price) DESC;


-- Query for Car Models and Prices per Brand in 2018
SELECT
	DISTINCT(a.Automaker) AS 'Automaker',
    a.Genmodel AS 'Model',
    FORMAT(b.Entry_price, 2) AS 'Average Price of Cars'
FROM general_cars_data a
LEFT JOIN price_table b on a.Genmodel_ID=b.Genmodel_ID
WHERE
	b.Year = 2018;
    
-- Query for Car Models and Number Sold
SELECT
  DISTINCT(a.Automaker) AS Automaker,
  a.Genmodel AS Model,
  c.2018 AS 'No. of Units Sold in 2018'
FROM general_cars_data a
LEFT JOIN price_table b on a.Genmodel_ID=b.Genmodel_ID
LEFT JOIN sales_table c on b.Genmodel_ID=c.Genmodel_ID
WHERE
  b.Year = 2018 AND c.2018 IS NOT NULL
ORDER BY c.2018 DESC
    