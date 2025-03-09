-- 📌 1. Quais categorias de produtos vendem mais?
SELECT 
    p.product_category_name, 
    COUNT(o.order_id) AS total_pedidos
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'  -- Consideramos apenas pedidos entregues
GROUP BY p.product_category_name
ORDER BY total_pedidos DESC
LIMIT 10;

-- 📌 2. Qual o ticket médio (preço médio) por categoria?
SELECT 
    p.product_category_name, 
    ROUND(AVG(oi.price), 2) AS ticket_medio
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY ticket_medio DESC
LIMIT 10;

-- 📌 3. Quais produtos têm mais devoluções?
SELECT 
    p.product_category_name,
    oi.product_id, 
    COUNT(*) AS total_devolucoes
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'canceled'  -- Pedidos cancelados podem indicar devoluções
GROUP BY p.product_category_name, oi.product_id
ORDER BY total_devolucoes DESC
LIMIT 10;
