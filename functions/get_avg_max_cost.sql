USE Oliinyk_7_63;

DELIMITER //
DROP FUNCTION IF EXISTS get_avg_overall_rating;
CREATE FUNCTION get_avg_overall_rating()
RETURNS DECIMAL
BEGIN
	return(SELECT AVG(max_cost) FROM family_value);
END;
SELECT * FROM family_value WHERE max_cost < get_avg_overall_rating()//
DELIMITER ;