SELECT 
    oi.seller_id, 
    SUM(oi.price) AS faturamento_total,  -- Soma de todas as vendas do vendedor
    AVG(oi.price) AS faturamento_medio -- Média por pedido
FROM order_items oi
GROUP BY oi.seller_id
ORDER BY faturamento_total DESC
LIMIT 10;



SELECT 
    payment_type, 
    COUNT(*) AS total_transacoes,
    ROUND(100 * COUNT(*) / (SELECT COUNT(*) FROM order_payments), 2) AS percentual_uso
FROM order_payments
GROUP BY payment_type
ORDER BY total_transacoes DESC;


SELECT 
    (COUNT(DISTINCT CASE WHEN o.order_status = 'delivered' THEN o.order_id END) 
     / COUNT(DISTINCT o.order_id)) * 100 AS taxa_aprovacao
FROM orders o;



