SELECT ci.name, COUNT(*) AS totcancelled
FROM flights AS f, airports AS ap, city AS ci
WHERE f."origin_airport" = ap."IATA_code" AND ap."city_a" = ci.id AND f.cancelled = 1
GROUP BY ci.name
ORDER BY totcancelled DESC
LIMIT 10;


