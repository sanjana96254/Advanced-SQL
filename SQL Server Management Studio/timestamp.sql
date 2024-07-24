CREATE TABLE Timestamps (
    StartTimestamp DATETIME,
    EndTimestamp DATETIME
);


INSERT INTO Timestamps (StartTimestamp, EndTimestamp)
VALUES 
    ('2024-04-24 10:00:00', '2024-04-24 12:30:30'),
    ('2024-04-24 08:45:00', '2024-04-24 09:30:15'),
    ('2024-04-24 15:00:00', '2024-04-24 16:45:00');

-- Calculate the difference in hours, minutes, and seconds
SELECT *,
    DATEDIFF(HOUR, StartTimestamp, EndTimestamp) AS Hours,
    DATEDIFF(MINUTE, StartTimestamp, EndTimestamp) % 60 AS Minutes,
    DATEDIFF(SECOND, StartTimestamp, EndTimestamp) % 60 AS Seconds
FROM Timestamps;

