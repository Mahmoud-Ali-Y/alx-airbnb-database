✅ Step 3: Sample Report (to include in your submission)
📊 Performance Report: Partitioning Booking Table by start_date

Objective: Improve query performance on large Booking table by using partitioning based on start_date.
🔍 Query Used for Testing:

SELECT * FROM Booking
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';

📉 Before Partitioning:

    EXPLAIN shows full table scan

    High number of rows examined (even outside the date range)

    Execution time: ~XXX ms (example)

📈 After Partitioning:

    EXPLAIN shows partition pruning — only relevant partition(s) are accessed

    Fewer rows scanned

    Execution time: ~YYY ms (significant improvement)

✅ Observed Improvements:

    Improved query speed by reducing I/O on irrelevant rows

    Better performance scalability as data grows

    Makes monthly/yearly reports faster and more efficient