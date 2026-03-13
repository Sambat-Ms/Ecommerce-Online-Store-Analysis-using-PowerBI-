# Ecommerce Analysis-using-PowerBI
Welcome to the Ecommerce Online Store Analysis Power BI project repository! This project aims to provide insightful analysis and visualization of Ecommerce data using Power BI.
# Overview 
This Power BI project analyzes various aspects of Online Store to provide valuable insights for decision-making. It comprises two main dashboards: Sale &amp; Profit Performance and Website Traffic 
# Business Question
1. How is the company performing financially over time based on revenue and profit trends?
2. Which marketing channels, devices, and products contribute most to total revenue?
3. What are the trends in website traffic and user engagement, and how do they influence conversion and revenue performance?
# Understanding Data 
**Dataset:** Toy Store E-Commerce Database extract from Maven Analytics that contain 6 tables such as website session, website pageviews, order items, order_items_refund and product.
- **website session:** store the information of user interation on website with specific date and source
- **website pageviews:** store each page loaded during visitor view
- **orders table:** store the uique transation records exch raw represents one completed order made by customer
- **order_items table:** record each product purchased with an order
- **order_items_refund:** record refund event for individual item with an order 
# Tools & Technologies 
- **SQL:** Data extraction and creation of views from the database
- **Microsoft Power BI Desktop:** Interactive dashboard development and data visualization
- **DAX (Data Analysis Expressions):** Creating measures such as Total Sessions, Conversion Rate, Revenue, and Profit
- **Power Query (M Language):** Data cleaning, transformation, and preparation
- **Data Modeling:** Building relationships between fact and dimension tables
- **Data Visualization:** Charts, KPIs, and traffic analysis dashboards
## Sale & profit dashboard 
### Key Performance Indicators(KPI) 
1. **Total Revenue:** Calculate total price_usd recieved during user successed order
2. **Total Refund:**  Calculate total refund_amount_usd from order_items_Refunds table
3. **Total Spent:**   Calculate by minnus total revenue with total refund
4. **Total profit:**  Calculate by minnus total revenue with total refund
5. **profit Margin:** Divide  by total profit and total revenue 
### Visualization 
1. **Monthly Trends by Revenue and Profit (Line Chart):** Tracking Revenue and Profit trend overtime , identify which seasonality make business growth and weak
2. **Revenue by channel and Device (Pie Chart):** Understand the distribution of Revenue across various channel and revenue 
3. **Revenue by product (Funnel Chart):** Identify revenue distribution by product
4. **Profit Summary by Product (Table):** Summary overall business health such as Total Revenue, Total Cogs_Spent, Total Refund,Total spent and  Profit Margin
    
## website traffic dashboard 
### Key Performance Indicators(KPI) 
1. **Total Session:** use Dax function calulate by SUm of website_session_ID from website session table 
2. **New Session:** use Dax Calulate by filter "New" form column SessionType
3. **Repeat Session:**  it is the same with New Session but change filter to "Repeat" 
4. **Conversion Rate:**  devide Total orders with Total sessions
5. **AVG Pageviews:** Use Dax to devide Total Pageviews with Total sessions
### Visualization 
1. **Monthly Trends by Website Session (Line Chart):** Tracking website session trend overtime to identity the business health 
2. **Session Trend by day of week and Session by channel (Line Chart & Donut chart):** Understand the distribution of Session across various day and channel 
3. **Conversion Rate trend and Conversion rate by Channel & Device (Line Chart & Clustered Bar Chart):** Identify month and channel with significant high conversion rate activity
4. **Pageviews by Pagecategory:**  understand how website traffic is distributed across different types of pages. This helps understand what users are most interested in and where they spend time on the website.
## Key Finding & Conclusion 
### Sales & Profit Analysis
[![Demo Image](Output/sale_profit.png)](Output/sale_profit.png)

### Website Traffic Analysis
[![Demo Image](Output/website_traffic.png)](Output/website_traffic.png)
