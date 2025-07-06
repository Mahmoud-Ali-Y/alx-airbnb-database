SELECT *, user_name
FROM Booking
INNER JOIN User ON Booking.user_id = User.Indexeduser_id;

SELECT *
FROM Property
LEFT JOIN Review ON Property.property_id = Review.review_id
ORDER BY Property.property_id;

SELECT *
FROM Booking
FULL OUTER JOIN User ON Booking.Indexeduser_id=User.user_id
ORDER BY User.user_id;