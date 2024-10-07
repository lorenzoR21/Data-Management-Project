SELECT ar.airport, count(f1.id) AS origin, tb.destination
FROM  airports ar, flights f1,
(SELECT ar.airport as an, count(f2.id) AS destination FROM airports ar, flights f2 
WHERE ar."IATA_code" = f2.destination_airport group by ar.airport) AS tb
WHERE ar."IATA_code" = f1.origin_airport and ar.airport = tb.an
GROUP BY ar.airport, tb.destination
ORDER BY ar.airport;

