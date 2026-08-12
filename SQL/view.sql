--CREATING View
--HOTEL-WISE VIEW
CREATE VIEW view_hotel_cancellation as
select  hotel,round(avg(is_canceled)*100,2) as cancellation_rate from booking group by hotel;

--DISPLAY VIEW
SELECT* FROM view_hotel_cancellation;

--Month-wise cancellation trend
Create VIEW view_month_wise_cancellation AS
select arrival_date_month,count(*) as total_booking,
sum(is_canceled) as total_cancellation from booking  group by arrival_date_month;

--DISPLAY VIEW
SELECT* FROM view_month_wise_cancellation;

--Month-wise Revenue
CREATE VIEW month_wise_revenue AS 
select arrival_date_month , sum(adr) as total_revenue from booking group by arrival_date_month;

--DISPLAY VIEW
SELECT* FROM month_wise_revenue;


--guest type distribution
Create View Guest_Type_Distribution AS
select guest_type , count(*) as guest_count , round(count(*) * 100.0/ (select count(*) from booking),2) as percentage_distribution
from booking group by guest_type;

--DISPLAY VIEW
SELECT* FROM  Guest_Type_Distribution;


--Top 10 countries
Create View top_10_countries AS
select country , count(*) as top_countries  from booking  group by country order by  top_countries Desc limit 10; 


--DISPLAY VIEW
SELECT* FROM top_10_countries;