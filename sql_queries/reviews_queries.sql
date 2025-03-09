-- 📌 1. Distribuição das notas das avaliações (review_score)
SELECT 
    review_score, 
    COUNT(*) AS total_avaliacoes
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;

-- 📌 2. Relação entre tempo de entrega e nota da avaliação
SELECT 
    r.review_score, 
    ROUND(AVG(TIMESTAMPDIFF(DAY, o.order_purchase_timestamp, o.order_delivered_customer_date)), 2) AS media_tempo_entrega
FROM order_reviews r
JOIN orders o ON r.order_id = o.order_id
WHERE o.order_delivered_customer_date IS NOT NULL  -- Exclui pedidos não entregues
GROUP BY r.review_score
ORDER BY r.review_score;

-- 📌 3. Palavras mais frequentes nos comentários das avaliações
SELECT 
    word, COUNT(*) AS frequencia
FROM (
    SELECT 
        SUBSTRING_INDEX(SUBSTRING_INDEX(r.review_comment_message, ' ', n.n), ' ', -1) AS word
    FROM order_reviews r
    JOIN (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 
          UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) n 
    ON CHAR_LENGTH(r.review_comment_message) - CHAR_LENGTH(REPLACE(r.review_comment_message, ' ', '')) >= n.n - 1
    WHERE r.review_comment_message IS NOT NULL
) words
WHERE word NOT IN ('o', 'a', 'de', 'e', 'é', 'um', 'uma', 'para', 'com', 'muito', 'bom', 'ruim', 'ótimo', 'péssimo') -- Removendo palavras comuns
GROUP BY word
ORDER BY frequencia DESC
LIMIT 20;
