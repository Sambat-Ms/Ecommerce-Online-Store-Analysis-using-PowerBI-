# Ecommerce Analysis-using-PowerBI
📊 Ecommerce Analysis using Power BI
Welcome to the Ecommerce Online Store Analysis project!
This project focuses on analyzing e-commerce data to generate actionable insights using Power BI.
# Overview 
📊 Ecommerce Analysis using Power BI
Welcome to the Ecommerce Online Store Analysis project!
This project focuses on analyzing e-commerce data to generate actionable insights using Power BI. 
# Business Question
❓ Business Questions
How is the company performing financially over time based on revenue and profit trends?
Which marketing channels, devices, and products contribute most to revenue?
What are the trends in website traffic and user engagement, and how do they impact conversion and revenue?
# Understanding Data 
📂 Dataset Description
Source: Maven Analytics – Toy Store E-Commerce Dataset
The dataset includes 6 main tables:
Website Sessions: User interactions with the website by date and traffic source
Website Pageviews: Pages viewed during each session
Orders: Unique transaction records (one row per order)
Order Items: Products included in each order
Order Items Refunds: Refund records for returned products
Products: Product details
🛠️ Tools & Technologies
SQL – Data extraction and transformation
Power BI Desktop – Dashboard development
DAX (Data Analysis Expressions) – KPI calculations
Power Query (M Language) – Data cleaning and preparation
Data Modeling – Building relationships between tables
Data Visualization – Interactive dashboards and charts
📈 Sales & Profit Dashboard
🔑 Key Performance Indicators (KPIs)
Total Revenue: Total sales from completed orders
Total Refund: Total refunded amount
Total Spent: Revenue after deducting refunds
Total Profit: Net profit calculation
Profit Margin: Profit divided by total revenue
📊 Visualizations
Revenue & Profit Trends (Line Chart): Analyze performance over time
Revenue by Channel & Device (Pie Chart): Identify top-performing sources
Revenue by Product (Funnel Chart): Product contribution analysis
Profit Summary Table: Overall business performance metrics

🌐 Website Traffic Dashboard
🔑 Key Performance Indicators (KPIs)
Total Sessions: Calculated using DAX by summing website_session_id from the Website Session table
New Sessions: Filter sessions where SessionType = "New" using DAX
Repeat Sessions: Filter sessions where SessionType = "Repeat" using DAX
Conversion Rate: Total Orders ÷ Total Sessions
Average Pageviews per Session: Total Pageviews ÷ Total Sessions
📊 Visualizations
Monthly Session Trends (Line Chart):
Tracks website traffic over time to evaluate overall business performance and seasonality patterns
Sessions by Day of Week & Channel (Line + Donut Chart):
Shows how user activity varies across different days and marketing channels
Conversion Rate Analysis (Line Chart & Clustered Bar Chart):
Identifies high-performing months, traffic sources, and devices in terms of conversion efficiency
Pageviews by Category:
Analyzes how users interact with different page types to understand user interest and engagement behavior
🔍 Key Findings & Conclusion
📈 Dashboard Insights
### Sales & Profit Analysis
[![Demo Image](Output/sale_profit.png)](Output/sale_profit.png)

### Website Traffic Analysis
[![Demo Image](Output/website_traffic.png)](Output/website_traffic.png)

 
- Peak conversion rate reached 7.6%, with desktop direct traffic achieving 9.9%
- Peak conversion rate reached 7.6%, with desktop direct traffic achieving 9.9%
- Significant funnel leakage: approximately 43K users drop off between cart and purchase
- Mobile conversion rate is significantly lower than desktop performance
- Noticeable seasonal slowdown during summer months
- Revenue is heavily concentrated in a small number of products
- 
💡 Business Insights & Recommendations
Stop the leak: Reduce friction in the checkout process to recover up to $1M in lost revenue
Close the gap: Improve mobile user experience to match desktop performance
Smooth seasonality: Strengthen marketing campaigns during low-performing months
Diversify revenue: Promote underperforming products, not just best-sellers
Increase retention: Convert one-time buyers into loyal repeat customers

🎯 Final Conclusion
The analysis reveals a business with strong potential but clear inefficiencies in conversion, mobile experience, and product distribution.
By optimizing the customer journey and diversifying growth strategies, the company can evolve from a seasonal-driven business into a consistent, year-round brand that customers return to for every occasion.

