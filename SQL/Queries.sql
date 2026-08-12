
--Query 1:  Total bookings and hotel-wise split (City vs Resort)
Select hotel , count(*) as Total_Booking from booking group by hotel;


-- Query 2: Find the earliest and latest arrival year in the dataset (MIN and MAX of arrival_date_year)
Select Min(arrival_date_year) AS earliest_arrival_year from booking;
Select Max(arrival_date_year) AS latest_arrival_year from booking;


-- Query 3: Find cancellation rate (%) for each hotel type
select  hotel,round(avg(is_canceled)*100,2) as cancellation_rate from booking group by hotel;

-- Query 4: Find total bookings and cancellations for each month (month-wise trend)
select arrival_date_month,count(*) as total_booking,
sum(is_canceled) as total_cancellation from booking  group by arrival_date_month;

-- Query 5: Find average lead_time for cancelled bookings vs non-cancelled bookings
select  is_canceled ,round(avg(lead_time),2) as average_lead_time from booking group by is_canceled;

-- Query 6: Find cancellation rate (%) grouped by deposit_type
select deposit_type ,round(avg(is_canceled)*100,2) as cancellation_rate_by_deposit_type from booking group by deposit_type;

-- Query 7: Find average adr (price) for each hotel type
select hotel ,round(avg(adr),2) as average_adr_price from booking group by hotel;

-- Query 8: Find average adr (price) for each guest_type (Single/Couple/Family)
select Guest_Type , round(avg(adr),2) as average_adr_price_by_guest_type from booking group by Guest_Type;

-- Query 9: Find total revenue (sum of adr) for each month
select arrival_date_month , sum(adr) as total_revenue from booking group by arrival_date_month;

-- Query 10: Compare cancellation rate between repeated guests (is_repeated_guest=1) and new guests (is_repeated_guest=0)
select is_repeated_guest, round(avg(is_canceled)*100,2)as cancellation_rate from booking group by  is_repeated_guest;

-- Query 11: Find top 10 countries with highest number of bookings
select country , count(*) as top_countries  from booking  group by country order by  top_countries Desc limit 10; 

-- Query 12: Find percentage distribution of guest_type (what % are Single, Couple, Family)
select guest_type , count(*) as guest_count , round(count(*) * 100.0/ (select count(*) from booking),2) as percentage_distribution
from booking group by guest_type;

-- Query 13: Find percentage of bookings where reserved_room_type does not match assigned_room_type
select round(avg(case when reserved_room_type != assigned_room_type then 1 else 0 end)*100,2) as mismatch_percentage
from booking;

-- Query 14: Find total bookings grouped by market_segment (booking source)
select market_segment , count(*) as total_booking_by_market_segment from booking group by market_segment;

-- Query 15: Write a JOIN query to show hotel_name and guest_type (from lookup tables) along with booking details, instead of showing hotel_id and guest_id
select   b.booking_id ,h .hotel_name , g.Guest_type , b.adr , b.is_canceled from booking as b 
join hotel h on b.hotel_id = h.hotel_id
join Guest_Type g on  g.Guest_id = b.Guest_id;

-- Query 16: Using a CTE, find bookings where lead_time is greater than the average lead_time of their own hotel type
with avgleadtime as(
select  hotel_id, avg(lead_time) as average_lead_time  from booking group by hotel_id)
select  b. booking_id ,b.hotel, b.lead_time ,a.average_lead_time from booking b join avgleadtime a
on b.hotel_id = a.hotel_id where b.lead_time > a.average_lead_time ;

-- Query 17: Using a subquery, find all bookings where adr is greater than the overall average adr of the dataset
select booking_id , hotel_id , adr from booking where adr > (select avg(adr) from booking);