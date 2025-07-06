SELECT *
FROM Property
WHERE (
    SELECT AVG(Review.rating)
    FROM Review
) > 4.0;

SELECT *
FROM User
WHERE (
    SELECT COUNT(Indexeduser_id)
    FROM Booking
    WHERE Booking.Indexeduser_id = User.user_id
) > 3;

