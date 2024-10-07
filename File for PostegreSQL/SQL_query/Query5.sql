SELECT DISTINCT a1.airline
FROM flights AS f1
JOIN airports AS ap1 ON f1.origin_airport = ap1."IATA_code"
JOIN airports AS ap2 ON f1.destination_airport = ap2."IATA_code"
JOIN city AS c1 ON ap1.city_a = c1.id
JOIN city AS c2 ON ap2.city_a = c2.id
JOIN airlines AS a1 ON f1.airline = a1."IATA_code"
WHERE (c1.name = 'New York' AND c2.name = 'Los Angeles')
AND NOT EXISTS (
    SELECT 1
    FROM flights AS f2
    JOIN airports AS ap3 ON f2.origin_airport = ap3."IATA_code"
    JOIN airports AS ap4 ON f2.destination_airport = ap4."IATA_code"
    JOIN city AS c3 ON ap3.city_a = c3.id
    JOIN city AS c4 ON ap4.city_a = c4.id
    WHERE (c3.name = 'Atlanta' AND c4.name = 'Albany')
    AND f1.airline = f2.airline );

