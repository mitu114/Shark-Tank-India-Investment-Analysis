# Yearly Revenue of top 10 startups

select `Startup Name`,`Yearly Revenue`
from shark_tank_india
order by `Yearly Revenue` desc
limit 10;


# Industry Analysis

SELECT
    Industry,
    COUNT(`Startup Name`) AS total_pitches,
    SUM(`Accepted Offer`) AS successful_deals,
    (SUM(`Accepted Offer`) / COUNT(`Startup Name`)) * 100 AS deal_success_rate_percent,
    SUM(CASE WHEN `Accepted Offer` = 1 THEN `Total Deal Amount` ELSE 0 END) AS total_funding_received,
    AVG(CASE WHEN `Accepted Offer` = 1 THEN `Total Deal Amount` ELSE NULL END) AS average_funding_successful_deals
FROM
    shark_tank_india 
GROUP BY
    Industry
ORDER BY
    total_funding_received DESC;
    

# Founder profile Analysis

SELECT
    -- Create a new category for gender
    CASE
        WHEN `Female Presenters` > 0 AND `Male Presenters` = 0 THEN 'All-Female'
        WHEN `Male Presenters` > 0 AND `Female Presenters` = 0 THEN 'All-Male'
        WHEN `Male Presenters` > 0 AND `Female Presenters` > 0 THEN 'Mixed Team'
        ELSE 'Other'
    END AS gender_team_type,
    COUNT(`Startup Name`) AS total_pitches,
    SUM(`Accepted Offer`) AS successful_deals,
    (SUM(`Accepted Offer`) / COUNT(`Startup Name`)) * 100 AS deal_success_rate_percent
FROM
    shark_tank_india
GROUP BY
    gender_team_type
ORDER BY
    deal_success_rate_percent DESC;
    
# Founder Profile: Age & Location Analysis (for Dashboard)
# By Age

SELECT
    `Pitchers Average Age` AS age_group,
    COUNT(`Startup Name`) AS total_pitches,
    SUM(`Accepted Offer`) AS successful_deals,
    (SUM(`Accepted Offer`) / COUNT(`Startup Name`)) * 100 AS deal_success_rate_percent
FROM
    shark_tank_india
WHERE
    `Pitchers Average Age` IS NOT NULL AND `Pitchers Average Age` != 'na'
GROUP BY
    `Pitchers Average Age`
ORDER BY
    deal_success_rate_percent DESC;
    

# By Location(top 10 states)

SELECT
    `Pitchers State` AS state,
    COUNT(`Startup Name`) AS total_pitches,
    SUM(`Accepted Offer`) AS successful_deals,
    (SUM(`Accepted Offer`) / COUNT(`Startup Name`)) * 100 AS deal_success_rate_percent
FROM
    shark_tank_india
WHERE
    `Pitchers State` IS NOT NULL AND `Pitchers State` != 'na'
GROUP BY
    `Pitchers State`
ORDER BY
    total_pitches DESC
LIMIT 10;


# Industry wise Investor Analysis

SELECT 'Namita' AS Shark, Industry, SUM(`Namita Investment Amount`) AS total_investment, COUNT(*) AS number_of_deals
FROM shark_tank_india
WHERE `Namita Investment Amount` > 0 AND `Accepted Offer` = 1
GROUP BY Industry

UNION ALL

SELECT 'Vineeta' AS Shark, Industry, SUM(`Vineeta Investment Amount`) AS total_investment, COUNT(*) AS number_of_deals
FROM shark_tank_india
WHERE `Vineeta Investment Amount` > 0 AND `Accepted Offer` = 1
GROUP BY Industry

UNION ALL

SELECT 'Anupam' AS Shark, Industry, SUM(`Anupam Investment Amount`) AS total_investment, COUNT(*) AS number_of_deals
FROM shark_tank_india
WHERE `Anupam Investment Amount` > 0 AND `Accepted Offer` = 1
GROUP BY Industry

UNION ALL

SELECT 'Aman' AS Shark, Industry, SUM(`Aman Investment Amount`) AS total_investment, COUNT(*) AS number_of_deals
FROM shark_tank_india
WHERE `Aman Investment Amount` > 0 AND `Accepted Offer` = 1
GROUP BY Industry

UNION ALL

SELECT 'Peyush' AS Shark, Industry, SUM(`Peyush Investment Amount`) AS total_investment, COUNT(*) AS number_of_deals
FROM shark_tank_india
WHERE `Peyush Investment Amount` > 0 AND `Accepted Offer` = 1
GROUP BY Industry

UNION ALL

SELECT 'Ritesh' AS Shark, Industry, SUM(`Ritesh Investment Amount`) AS total_investment, COUNT(*) AS number_of_deals
FROM shark_tank_india
WHERE `Ritesh Investment Amount` > 0 AND `Accepted Offer` = 1
GROUP BY Industry

UNION ALL

SELECT 'Amit' AS Shark, Industry, SUM(`Amit Investment Amount`) AS total_investment, COUNT(*) AS number_of_deals
FROM shark_tank_india
WHERE `Amit Investment Amount` > 0 AND `Accepted Offer` = 1
GROUP BY Industry

ORDER BY
    Shark, total_investment DESC;