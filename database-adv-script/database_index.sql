-- User table indexes
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_user_role ON User(user_role);

-- Booking table indexes
CREATE INDEX idx_booking_property_id ON Booking(Indexedproperty_id);
CREATE INDEX idx_booking_user_id ON Booking(Indexeduser_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_created_at ON Booking(created_at);

-- Property table indexes
CREATE INDEX idx_property_host_id ON Property(Indexedhost_id);
CREATE INDEX idx_property_location ON Property(property_location);

-- Example query to test before and after
EXPLAIN ANALYZE
SELECT 
    p.property_id,
    p.property_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    Property p
JOIN 
    Booking b ON p.property_id = b.Indexedproperty_id
WHERE 
    b.status = 'confirmed'
GROUP BY 
    p.property_id
ORDER BY 
    total_bookings DESC
LIMIT 10;