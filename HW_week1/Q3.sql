SELECT
	SUM(CASE WHEN trip_distance <=1 THEN 1 ELSE 0 END) AS up_to_1_mile,
	SUM(CASE WHEN trip_distance > 1 AND trip_distance <= 3 THEN 1 ELSE 0 END) AS between_1_and_3_miles,
    SUM(CASE WHEN trip_distance > 3 AND trip_distance <= 7 THEN 1 ELSE 0 END) AS between_3_and_7_miles,
    SUM(CASE WHEN trip_distance > 7 AND trip_distance <= 10 THEN 1 ELSE 0 END) AS between_7_and_10_miles,
    SUM(CASE WHEN trip_distance > 10 THEN 1 ELSE 0 END) AS over_10_miles
FROM 
    "green_taxi_2019"
WHERE 
    lpep_pickup_datetime >= '2019-10-01 00:00:00' 
    AND lpep_dropoff_datetime < '2019-11-01 00:00:00';
