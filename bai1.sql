-- 1. Nguyên nhân lỗi (cốt lõi)
-- Vấn đề nằm ở thứ tự ưu tiên toán tử trong SQL:
-- 	AND được ưu tiên hơn OR 
--  Nên câu lệnh của bạn đang được hiểu như sau:
-- WHERE district = 'Quận 1' 
--    OR (district = 'Quận 3' AND rating > 4.0);
--  Hệ quả:
-- 	Tất cả nhà hàng ở Quận 1 sẽ được lấy không cần quan tâm rating 
-- 	Chỉ Quận 3 mới bị áp điều kiện rating > 4.0 
--  Vì vậy mới xảy ra lỗi:
--  Quận 1 có cả quán rating thấp (2.0–3.0) vẫn xuất hiện

-- 2. Cách sửa đúng
-- Bạn cần dùng ngoặc () để kiểm soát logic:
SELECT restaurant_name, address, rating
FROM Restaurants
WHERE (district = 'Quận 1' OR district = 'Quận 3')
  AND rating > 4.0;
