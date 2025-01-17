SELECT *
FROM
	(SELECT
		SUM(total_amount), "PULocationID"
	FROM 
	    "green_taxi_2019"
	WHERE
	    lpep_pickup_datetime >= '2019-10-18 00:00:00' 
	    AND lpep_pickup_datetime < '2019-10-19 00:00:00'
	GROUP BY
		"PULocationID"
	HAVING
		SUM(total_amount)>13000
	) t1
	JOIN
	(SELECT
        "LocationID", 
        CONCAT("Borough", ' / ', "Zone") AS "pickup_loc"
    FROM
        taxi_zone_lookup
	) t2
	ON t1."PULocationID" = t2."LocationID";
