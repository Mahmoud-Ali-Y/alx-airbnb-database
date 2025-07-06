✅ Step 3: Refactor the Query for Performance
🔧 Improvements:

    Ensure indexes exist on:

        Booking.Indexeduser_id

        Booking.Indexedproperty_id

        Payment.Indexedbooking_id

    Remove unneeded columns if not required for output

    Use INNER JOIN only when data is guaranteed (reduces unnecessary scans)
    Refactored Query (Improved)

-- Refactored query
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    u.email,
    p.property_name,
    p.property_location,
    pay.amount AS payment_amount,
    pay.payment_method
FROM Booking b
INNER JOIN User u ON b.Indexeduser_id = u.user_id
INNER JOIN Property p ON b.Indexedproperty_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.Indexedbooking_id;

This version:

    Combines first/last name for simpler results

    Uses INNER JOIN where data must exist

    Keeps LEFT JOIN for payments, which may be optional

    Leverages indexes to improve lookup speed