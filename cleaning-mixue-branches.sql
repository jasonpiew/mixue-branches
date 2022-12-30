--filter location not located in indonesia
WITH not_here as(
SELECT formatted_address 
FROM final_mixue_csv AS fmc
WHERE formatted_address ~* 'Singapore|Malaysia'
)

-- create table to store data
CREATE TABLE mixue_cleaned  AS SELECT * FROM final_mixue_csv;

--delete rows that is not needed, aka formatted address in another places
DELETE FROM mixue_cleaned 
WHERE formatted_address IN (SELECT formatted_address FROM not_here);

--create mixue-cleans table with desired columns
CREATE TABLE mixue_cleans AS
WITH FINAL as(
SELECT business_status,
COALESCE(delivery::TEXT,'false') AS delivery,
COALESCE(dine_in::TEXT,'false') AS dine_in,
COALESCE(location3, 'Not Provided') AS sub_city,
COALESCE(location2, 'Not Provided') AS city,
COALESCE(LOCATION, 'Not Provided') AS province,
COALESCE(formatted_phone_number, '0') AS phone_number,
lat,
lng,
name,
place_id,
COALESCE(price_level,0) AS price_level,
COALESCE(round(rating::numeric,2),0)AS rating,
url,
COALESCE(user_ratings_total,0) AS user_rating
FROM mixue_cleaned
)
SELECT * FROM FINAL;

--filter out name that is not mixue store
WITH not_mixue_name as(
SELECT name FROM mixue_cleans
WHERE name !~* 'mixue'
)
--delete the list
DELETE FROM mixue_cleans AS mc 
WHERE name in(SELECT name FROM not_mixue_name)

--check the name again
SELECT name FROM mixue_cleans AS mc 