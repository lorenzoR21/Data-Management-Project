SELECT
    a1.airport,
    a2.airport,
    COUNT(DISTINCT f.airline) AS NumAirlines,
	STRING_AGG(DISTINCT f.airline::text, ', ') AS Airlines
FROM flights AS f, airports a1, airports a2
WHERE f.origin_airport = a1."IATA_code" AND f.destination_airport = a2."IATA_code"
GROUP BY a1.airport, a2.airport;

