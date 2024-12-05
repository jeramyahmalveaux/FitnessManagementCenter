SELECT 
    c.ClassName, 
    COUNT(b.BookingID) AS TotalBookings
FROM 
    Bookings b
JOIN 
    Classes c ON b.ClassID = c.ClassID
GROUP BY 
    c.ClassName;
