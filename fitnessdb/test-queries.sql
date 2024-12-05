-- Query 1: Retrieves members and the details of their membership
SELECT m.Name AS MemberName, 
       m.Email, 
       mt.MembershipName, 
       mt.Price, 
       mt.DurationMonths
FROM Members m
JOIN MembershipTypes mt ON m.MembershipTypeID = mt.MembershipTypeID
ORDER BY m.Name;

-- Query 2: Displays total number of bookings for each member from highest to lowest
SELECT m.Name AS MemberName, 
       COUNT(b.BookingID) AS TotalBookings
FROM Members m
LEFT JOIN Bookings b ON m.MemberID = b.MemberID
GROUP BY m.MemberID
ORDER BY TotalBookings DESC;

-- Query 3: Lists each class with start and end time along with instructor
SELECT c.ClassName, 
       c.StartTime, 
       c.EndTime, 
       t.Name 
FROM Classes c
JOIN Trainers t ON c.TrainerID = t.TrainerID
ORDER BY c.StartTime;

-- Query 4: Gets sum of revenue from memberships
SELECT SUM(mt.Price) AS TotalRevenue
FROM Members m
JOIN MembershipTypes mt ON m.MembershipTypeID = mt.MembershipTypeID;


-- Query 5: Identifies the 5 most recent hires from newest to oldest
SELECT Name, Role, HireDate
FROM Staff
ORDER BY HireDate DESC
LIMIT 5;

