SELECT al.airline, COUNT(*) AS flightCount
FROM flights AS f, airports AS ap, city AS ci, airlines AS al
WHERE ap."city_a" = ci.id AND ap."IATA_code" = f."origin_airport" AND f.airline = al."IATA_code"
AND ci.name = 'New York'
GROUP BY al.airline
ORDER BY flightCount DESC
LIMIT 1;

