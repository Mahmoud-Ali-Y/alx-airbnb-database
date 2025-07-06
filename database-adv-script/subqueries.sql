SELECT *
FROM Property
WHERE Review.rating > (
    SELECT AVG(Review.rating)
    FROM Review
);

SELECT *
FROM User
WHERE (
    SELECT COUNT(Indexeduser_id)
    FROM Booking
    WHERE Booking.Indexeduser_id = User.user_id
) > 3;

