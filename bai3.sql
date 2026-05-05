-- IF min_trust_score IS NULL
--     → set = 80 (giá trị mặc định theo nghiệp vụ)

-- ELSE IF min_trust_score < 0
--     → set = 0 (hoặc 80 nếu muốn strict theo business)

-- ELSE IF min_trust_score > 100
--     → set = 100 (giới hạn hợp lệ)

-- ELSE
--     → dùng giá trị min_trust_score

SELECT driver_id, name, status, trust_score, distance_km
FROM Drivers
WHERE status = 'AVAILABLE'
  AND trust_score >= 80
ORDER BY distance_km ASC, trust_score DESC;