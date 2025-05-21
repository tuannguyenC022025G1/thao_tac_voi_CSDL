use quanlybanhang;
INSERT INTO Customer (cID, cName, cAge) VALUES
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);
INSERT INTO Orders (oID, cID, oDate, oTotalPrice) VALUES
(1, 1, '2006-03-21', NULL),
(2, 2, '2006-03-23', NULL),
(3, 1, '2006-03-16', NULL);
INSERT INTO Product (pID, pName, pPrice) VALUES
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);
INSERT INTO OrderDetail (oID, pID, odQTY) VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);
SELECT oID, oDate, oTotalPrice
FROM Orders;
SELECT Customer.cName AS CustomerName, Product.pName AS ProductName
FROM Customer
JOIN Orders ON Customer.cID = Orders.cID
JOIN OrderDetail ON Orders.oID = OrderDetail.oID
JOIN Product ON OrderDetail.pID = Product.pID;
SELECT cName
FROM Customer
WHERE cID NOT IN (
    SELECT DISTINCT cID
    FROM Orders
);
SELECT 
    o.oID, 
    o.oDate,
    SUM(od.odQTY * p.pPrice) AS TotalPrice
FROM Orders o
JOIN OrderDetail od ON o.oID = od.oID
JOIN Product p ON od.pID = p.pID
GROUP BY o.oID, o.oDate;

