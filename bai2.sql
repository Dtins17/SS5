-- 1. Nguyên nhân lỗi (lỗ hổng kiến trúc)
-- Câu SQL hiện tại:
-- SELECT restaurant_name, created_at
-- FROM Restaurants
-- LIMIT 5;
--  Vấn đề cốt lõi:
-- 	LIMIT 5 chỉ giới hạn số lượng, KHÔNG đảm bảo thứ tự 
-- 	SQL không mặc định sắp xếp dữ liệu nếu bạn không dùng ORDER BY 
--  Kết quả:
-- 	Mỗi lần query, database có thể trả về 5 bản ghi bất kỳ 
-- 	Thứ tự phụ thuộc vào: 
-- 	cách lưu trữ nội bộ 
-- 	index 
-- 	trạng thái hệ thống 
--  Nên mới xảy ra hiện tượng:
-- Refresh là đổi quán → có cả quán từ năm ngoái 

--  2. Cách sửa đúng
-- Bạn cần sắp xếp theo thời gian tạo mới nhất trước, rồi mới giới hạn:
SELECT restaurant_name, created_at
FROM Restaurants
ORDER BY created_at DESC
LIMIT 5;

