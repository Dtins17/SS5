CREATE DATABASE shop_db;
USE shop_db;

CREATE TABLE Orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NULL,
    total_amount DECIMAL(18,2),
    status VARCHAR(20),
    note VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Orders (user_id, total_amount, status, note) VALUES
(1, 2500000, 'COMPLETED', 'giao gấp'),
(2, 4500000, 'COMPLETED', 'khách VIP cần gấp'),
(NULL, 3000000, 'PENDING', 'đơn hệ thống'),
(NULL, 6000000, 'PENDING', 'đơn lớn'),
(3, 3500000, 'CANCELLED', 'gấp'),
(4, 2000000, 'COMPLETED', 'bình thường'),
(5, 4800000, 'COMPLETED', 'gấp ngay'),
(NULL, 4200000, 'COMPLETED', 'auto'),
(6, 10000000, 'COMPLETED', 'gấp cực'),
(7, 2700000, 'COMPLETED', 'ok');

-- 1. MỔ XẺ BẪY OR
-- AND có độ ưu tiên cao hơn OR
-- Nếu viết: A AND B AND C OR D
-- SQL hiểu: (A AND B AND C) OR D
-- → Khi D đúng (user_id IS NULL) sẽ bỏ qua A, B
-- → Lọt đơn CANCELLED hoặc > 5.000.000

-- Cách xử lý: dùng ngoặc ()
-- AND (C OR D) → khóa bẫy logic


-- 2. PHÂN TRANG
-- Công thức:
-- OFFSET = (page - 1) * pageSize
-- Trang 3: OFFSET = (3 - 1) * 20 = 40

-- Backend chặn lỗi:
-- if (page <= 0) page = 1;


-- 3. TRUY VẤN HOÀN CHỈNH

SELECT 
    id,
    user_id,
    total_amount,
    status,
    note,
    created_at,
    CASE 
        WHEN total_amount > 4000000 THEN 'Nguy hiểm'
        ELSE 'Bình thường'
    END AS Alert_Level
FROM Orders
WHERE 
    total_amount BETWEEN 2000000 AND 5000000
    AND status != 'CANCELLED'
    AND (
        note LIKE '%gấp%' 
        OR user_id IS NULL
    )
ORDER BY total_amount DESC
LIMIT 20 OFFSET 40;
