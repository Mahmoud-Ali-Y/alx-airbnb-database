SELECT 
    property_id,
    property_name,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_number_rank,
    RANK() OVER (ORDER BY total_bookings DESC) AS dense_rank
FROM (
    SELECT 
        p.property_id,
        p.property_name,
        COUNT(b.booking_id) AS total_bookings
    FROM 
        Property p
    LEFT JOIN 
        Booking b ON p.property_id = b.property_id
    GROUP BY 
        p.property_id, p.property_name
) AS booking_counts;