SELECT 
    ROUND(AVG(TIMESTAMPDIFF(DAY, order_purchase_timestamp, order_delivered_customer_date)), 2) AS tempo_medio_entrega_dias
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;


SELECT 
    (COUNT(CASE WHEN order_status = 'canceled' THEN 1 END) * 100.0 / COUNT(*)) AS taxa_cancelamento
FROM orders;


SELECT 
    c.customer_state, 
    c.customer_city,
    COUNT(o.order_id) AS total_pedidos
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state, c.customer_city
ORDER BY total_pedidos DESC
LIMIT 10;
