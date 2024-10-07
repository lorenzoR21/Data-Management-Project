WITH cancflightcount AS (
	SELECT airlines.airline, COUNT(flights.cancelled) AS totcancelledflights
	FROM airlines JOIN flights ON airlines."IATA_code" = flights.airline
	WHERE flights.cancelled = 1
	GROUP BY airlines.airline
),
totalflightscount AS (
	SELECT airlines.airline, COUNT(*) AS totflights
	FROM airlines JOIN flights ON airlines."IATA_code" = flights.airline
	GROUP BY airlines.airline
)
SELECT tfc.airline, tfc.totflights, cfc.totcancelledflights, 
(cfc.totcancelledflights / 1.0)/ tfc.totflights AS ratioCancTotFlights
FROM totalflightscount AS tfc JOIN cancflightcount AS cfc ON tfc.airline = cfc.airline
ORDER BY ratioCancTotFlights DESC
LIMIT 10;

