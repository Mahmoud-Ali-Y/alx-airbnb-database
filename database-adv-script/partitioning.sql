-- partitioning.sql

-- Step 1: Drop the original Booking table (if exists)
DROP TABLE IF EXISTS Booking;

-- Step 2: Recreate Booking table with RANGE partitioning on start_date
CREATE TABLE Booking (
    booking_id INT NOT NULL,
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM ('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)  -- required for RANGE partitioning
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Query to test performance
EXPLAIN
SELECT *
FROM Booking
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';