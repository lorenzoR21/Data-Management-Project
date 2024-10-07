WITH delayflightcount AS (
	SELECT al.airline, COUNT(*) AS tot_departude_delay_flights
	FROM flights f, airlines al
	WHERE f.airline = al."IATA_code" AND f.departure_delay > 0
	GROUP BY al.airline
),
delayRflightscount AS (
	SELECT al.airline, COUNT(*) AS tot_departude_delay_flights_that_arrive_intime
	FROM flights f, airlines al
	WHERE f.airline = al."IATA_code" AND f.departure_delay > 0 AND f.arrival_time = f.scheduled_arrival
	GROUP BY al.airline
)
SELECT dfc.airline, dfc.tot_departude_delay_flights, dRfc.tot_departude_delay_flights_that_arrive_intime
FROM delayflightcount AS dfc JOIN delayRflightscount AS dRfc ON dfc.airline = dRfc.airline
ORDER BY dfc.tot_departude_delay_flights DESC;

