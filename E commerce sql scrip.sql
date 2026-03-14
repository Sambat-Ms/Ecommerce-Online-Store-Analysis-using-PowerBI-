
--------------------------
-------the company performing financially over time based on revenue and profit trends
SELECT 
    YEAR(oi.Date) AS year,
    MONTH(oi.Date) AS month,

    SUM(oi.price_usd) AS total_revenue,
    SUM(oi.cogs_usd) AS total_cogs,
    COALESCE(SUM(oir.refund_amount_usd),0) AS total_refund,

    SUM(oi.price_usd) - 
    (SUM(oi.cogs_usd) + COALESCE(SUM(oir.refund_amount_usd),0)) AS total_profit

FROM order_items oi
LEFT JOIN order_item_refunds oir
    ON oi.order_item_id = oir.order_item_id

GROUP BY 
    YEAR(oi.Date),
    MONTH(oi.Date)

ORDER BY 
    year,
    month;

-------------------------------
------------Revenue Contribution by Channel 
SELECT 
    ws.utm_source AS channel,
    SUM(oi.price_usd) AS total_revenue,
    
    SUM(oi.price_usd) / 
    (SELECT SUM(price_usd) FROM order_items) * 100 AS revenue_contribution

FROM orders o
JOIN website_sessions ws
    ON o.website_session_id = ws.website_session_id
JOIN order_items oi
    ON o.order_id = oi.order_id

GROUP BY ws.utm_source
ORDER BY total_revenue DESC;


-------------------------------
------------Revenue Contribution by Device
SELECT ws.device_type as device, 
		SUM(o.price_usd) as Total_Revenue
FROM [dbo].[orders] o
Join [dbo].[website_sessions]ws
ON o.website_session_id = ws.website_session_id
GROUP BY ws.device_type
Order by total_revenue DESC; 

-----------------------------
------------Revenue Contribution by Product 

SELECT p.product_name as Product_Name,
		SUM(oi.price_usd) as Total_Revenue
FROM  [dbo].[products] p
LEFT JOIN [dbo].[order_items] oi
on p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC; 

---------------------------------
---------- website traffic trend by session type 
SELECT 
    YEAR(Date) AS session_year,
    MONTH(Date) AS session_month,

    CASE 
        WHEN CAST(is_repeat_session AS VARCHAR(10)) = '0' THEN 'New Visitor'
        ELSE 'Repeat Visitor'
    END AS session_type,

    COUNT(website_session_id) AS total_sessions

FROM website_sessions

GROUP BY 
    YEAR(Date),
    MONTH(Date),
    CASE 
        WHEN CAST(is_repeat_session AS VARCHAR(10)) = '0' THEN 'New Visitor'
        ELSE 'Repeat Visitor'
    END

ORDER BY 
    session_year,
    session_month;


-----------------------------------
----- Total Session trend by dayname 

SELECT 
    day_name,
    total_sessions
FROM (
    SELECT
        DATENAME(WEEKDAY, Date) AS day_name,
        DATEPART(WEEKDAY, Date) AS weekday_num,
        COUNT(website_session_id) AS total_sessions
    FROM website_sessions
    GROUP BY DATENAME(WEEKDAY, Date), DATEPART(WEEKDAY, Date)
) AS t
ORDER BY total_sessions DESC;

-----------------------------------
---------- Total Session by Channel 
SELECT utm_source as Channel, 
COUNT(website_session_id) as Total_session
FROM [dbo].[website_sessions]
GROUP BY utm_source
ORDER BY Total_session DESC; 

-------------------------------
---------Conversion Rate trend 
SELECT 
    MONTH(ws.Date) AS month,

    CAST(
        COUNT(DISTINCT o.order_id) * 100.0 /
        COUNT(DISTINCT ws.website_session_id)
        AS DECIMAL(4,1)
    ) AS conversion_rate_pct

FROM [dbo].[website_sessions] ws
LEFT JOIN [dbo].[orders] o 
    ON o.website_session_id = ws.website_session_id 

GROUP BY 
    MONTH(ws.Date)

ORDER BY 
    conversion_rate_pct DESC;

----------------------------------
-----Conversion rate by channel & Device 
SELECT 
    ws.utm_source AS channel,
    ws.device_type,

    CAST(
        100.0 * COUNT(DISTINCT o.order_id) /
        COUNT(DISTINCT ws.website_session_id)
        AS DECIMAL(4,1)
    ) AS conversion_rate_pct

FROM dbo.website_sessions ws
LEFT JOIN dbo.orders o
    ON ws.website_session_id = o.website_session_id

GROUP BY 
    ws.utm_source,
    ws.device_type

ORDER BY 
    conversion_rate_pct DESC;

--------------------------------------------
--------------pageviews pagecategories

SELECT 
    page_category,
    COUNT(*) AS total_pageviews
FROM
(
    SELECT
        CASE 
            WHEN pageview_url IN ('/home','/') THEN 'Home'
            WHEN pageview_url IN ('/lander-1','/lander-2','/lander-3','/lander-4','/lander-5') THEN 'Landing'
            WHEN pageview_url = '/products' THEN 'Product'
            WHEN pageview_url IN (
                '/the-original-mr-fuzzy',
                '/the-birthday-sugar-panda',
                '/the-forever-love-bear',
                '/the-hudson-river-mini-bear'
            ) THEN 'Specific_Products'
            WHEN pageview_url = '/cart' THEN 'Cart'
            WHEN pageview_url IN ('/billing','/billing-2') THEN 'Billing'
            WHEN pageview_url = '/shipping' THEN 'Shipping'
            WHEN pageview_url = '/thank-you-for-your-order' THEN 'Thank You'
            ELSE 'Other'
        END AS page_category
    FROM dbo.website_pageviews
) t

GROUP BY page_category
ORDER BY total_pageviews DESC;