SELECT *
FROM
(SELECT t1.tip_amount, t1."PULocationID", t1."DOLocationID", t2."Zone" as "Dropoff Zone"
FROM
	green_taxi_2019 t1
JOIN
	taxi_zone_lookup t2
ON 
	t1."DOLocationID"=t2."LocationID"
ORDER BY t1.tip_amount DESC
) t3
JOIN
(SELECT "LocationID", "Zone"
	FROM 
		taxi_zone_lookup
	WHERE 
		"Zone" = 'East Harlem North'
) t4
ON t3."PULocationID" = t4."LocationID"
;