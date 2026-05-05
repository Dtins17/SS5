-- 1. Hai cách triển khai
-- Giải pháp 1: Dùng 
SELECT order_id, status, reason
FROM Orders
WHERE reason = 'KHACH_HUY'
   OR reason = 'QUAN_DONG_CUA'
   OR reason = 'KHONG_CO_TAI_XE'
   OR reason = 'BOM_HANG';
   
--    Giải pháp 2: Dùng IN
SELECT order_id, status, reason
FROM Orders
WHERE reason IN ('KHACH_HUY', 'QUAN_DONG_CUA', 'KHONG_CO_TAI_XE', 'BOM_HANG');

-- 2. Bảng so sánh
--     Tiêu chí	                   Dùng OR      	                             Dùng IN
-- 🧹 Code sạch	              ❌ Dài, lặp lại nhiều	                         ✅ Ngắn gọn, dễ đọc
-- 📈 Khả năng mở rộng	      ❌ Rất khó (20 điều kiện = viết mỏi tay)        ✅ Rất dễ (chỉ thêm vào list)
-- ⚡ Hiệu năng SQL Engine	  ⚠️ Có thể kém hơn (parse nhiều OR)	          ✅  Tối ưu hơn (engine xử lý như tập hợp)

-- 3. Bẫy dữ liệu: Mảng rỗng
-- IF reasons_list IS NULL OR reasons_list IS EMPTY
--     → RETURN empty result (không gọi SQL)
--     // hoặc:
--     → thêm điều kiện WHERE 1 = 0 (để trả về rỗng an toàn)

-- ELSE
--     → build query với IN (...)

-- 4. Câu SQL tốt nhất
SELECT order_id, status, reason
FROM Orders
WHERE reason IN (reasons_list);