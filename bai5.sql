CREATE DATABASE Users;

USE Users;

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    total_orders INT
);

INSERT INTO Users VALUES
(1, 'Nguyen Van A', 600),
(2, 'Tran Thi B', 200),
(3, 'Le Van C', 50),
(4, 'Pham Thi D', NULL);

SELECT full_name AS Ten_Khach_Hang,
CASE 
WHEN  total_orders IS NULL THEN 'Khách mới'
WHEN   total_orders > 500 THEN 'Kim cương'
WHEN   total_orders BETWEEN 100 AND 500 THEN 'Vàng'
ELSE 'Bạc'
END AS Xep_Hang FROM Users;

