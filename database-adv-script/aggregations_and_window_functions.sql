SELECT COUNT(*) , Indexeduser_id
FROM Booking
GROUP BY Indexeduser_id;

SELECT 
    p.property_id,
    p.property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM 
    Property p
LEFT JOIN 
    Booking b ON p.property_id = b.Indexedproperty_id
GROUP BY 
    p.property_id, p.property_name
ORDER BY 
    booking_rank;