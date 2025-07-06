SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.property_name,
    p.property_location,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_date
FROM Booking b
JOIN User u ON b.Indexeduser_id = u.user_id
JOIN Property p ON b.Indexedproperty_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.Indexedbooking_id;