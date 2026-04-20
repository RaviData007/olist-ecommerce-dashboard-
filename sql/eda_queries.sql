USE OlistDashboard

SELECT
* 
FROM
olist_master

SELECT COUNT(*) AS total_rows FROM dbo.olist_master;
SELECT TOP 3 * FROM dbo.olist_master;

--Total States

SELECT
	COUNT(DISTINCT (seller_state))
FROM
	olist_master


--Revenue trend by month

SELECT
	year,
	month_name,
	month_num,
	ROUND(SUM(revenue),2) AS revenue,
	COUNT(DISTINCT order_id) AS orders,
	ROUND(AVG(revenue),2) AS AOV 
FROM
	olist_master
WHERE
	order_status= 'delivered'
GROUP BY
	year,
	month_name,
	month_num
ORDER BY
	year,
	month_num ASC

--YoY growth using LAG

WITH monthly AS (
  SELECT year, month_num, SUM(revenue) rev
  FROM dbo.olist_master WHERE order_status='delivered'
  GROUP BY year, month_num
)
SELECT *, ROUND((rev - LAG(rev) OVER (PARTITION BY month_num ORDER BY year))
          / LAG(rev) OVER (PARTITION BY month_num ORDER BY year) * 100, 2) AS yoy_pct
FROM monthly ORDER BY year, month_num;

--Top 10 product categories by revenue

SELECT TOP 10 
	category_en,
	COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(revenue),2) AS revenue,
    ROUND(AVG(review_score),2) AS avg_rating
FROM
	dbo.olist_master
WHERE
	order_status='delivered' AND category_en IS NOT NULL
GROUP BY
	category_en
ORDER BY 
	revenue DESC;

--Delivery performance — on-time vs late

SELECT
	SUM(CASE WHEN is_late=0 THEN 1 ELSE 0 END) AS on_time,
    SUM(CASE WHEN is_late=1 THEN 1 ELSE 0 END) AS late,
    ROUND(AVG(CAST(delivery_days AS FLOAT)),1) AS avg_delivery_days,
    ROUND(AVG(CAST(delay_days AS FLOAT)),1) AS avg_delay_days
FROM
	dbo.olist_master
WHERE 
	order_status='delivered';

--Payment type distribution

SELECT
	payment_type,
	COUNT(*) AS orders,
	ROUND(COUNT(*)*100.0/SUM(COUNT(*)) OVER(),2) AS pct
FROM
	olist_master
GROUP BY 
	payment_type

--Review score distribution

SELECT review_score,
       COUNT(*) AS count,
       ROUND(COUNT(*)*100.0/SUM(COUNT(*)) OVER(),2) AS pct
FROM 
	olist_master
WHERE
	review_score IS NOT NULL
GROUP BY 
	review_score 
ORDER BY 
	review_score;

--Top 10 seller states by revenue

SELECT
	seller_state,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(revenue),2) AS revenue,
    COUNT(DISTINCT seller_id) AS sellers
FROM 
	olist_master
WHERE 
	order_status='delivered'
GROUP BY 
	seller_state 
ORDER BY 
	revenue DESC;

--Top 10 customer states by orders

SELECT TOP 10
	customer_state,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(revenue),2) AS revenue
FROM
	olist_master
GROUP BY 
	customer_state ORDER BY orders DESC;


--Freight vs price ratio by category

SELECT
	category_en,
    ROUND(AVG(revenue),2) AS avg_price,
    ROUND(AVG(freight),2) AS avg_freight,
    ROUND(AVG(freight)/NULLIF(AVG(revenue),0)*100,2) AS freight_pct
FROM
	olist_master
WHERE 
	order_status='delivered' AND category_en IS NOT NULL
GROUP BY 
	category_en 
ORDER BY 
	freight_pct DESC;


--Cancellation rate by category

SELECT 
	category_en,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN order_status='canceled' THEN 1 ELSE 0 END) AS canceled,
    ROUND(SUM(CASE WHEN order_status='canceled' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS cancel_pct
FROM 
	olist_master 
WHERE 
	category_en IS NOT NULL
GROUP BY 
	category_en 
ORDER BY 
	cancel_pct DESC;

--Instalment analysis — single vs multi-payment

SELECT
  CASE WHEN payment_installments=1 THEN 'Single'
       WHEN payment_installments<=6 THEN '2–6 instalments'
       ELSE '7+ instalments' END AS instalment_band,
  COUNT(*) AS orders,
  ROUND(AVG(total_payment),2) AS avg_value
FROM olist_master GROUP BY
  CASE WHEN payment_installments=1 THEN 'Single'
       WHEN payment_installments<=6 THEN '2–6 instalments'
       ELSE '7+ instalments' END
ORDER BY orders DESC;

--Low rating orders — what categories get bad reviews?

SELECT 
	category_en,
    COUNT(*) AS total,
    SUM(low_rating) AS low_reviews,
    ROUND(AVG(CAST(review_score AS FLOAT)),2) AS avg_score
FROM
	olist_master
WHERE
	review_score IS NOT NULL AND category_en IS NOT NULL
GROUP BY 
	category_en 
ORDER BY 
	avg_score ASC;
