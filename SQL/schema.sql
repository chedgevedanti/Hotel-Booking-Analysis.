--create table hotel
drop table if exists hotel;
CREATE TABLE Hotel(
hotel_id int primary key,
hotel_name varchar(100)
);
insert into hotel values(1,'Resort Hotel'),(2,'City Hotel');
select* from Hotel;

--guest table
drop table if exists Guest_Type;
CREATE TABLE Guest_Type(
Guest_id int primary key,
Guest_Type varchar(50)
);
insert into Guest_Type values(1,'Single'),(2,'Couple'),(3,'Family');
select* from Guest_Type;


--booking table
Drop table if exists Booking;
CREATE TABLE Booking(
booking_id serial primary key,
hotel_id int,
Guest_id int,
hotel varchar(50),
is_canceled int ,
lead_time int ,
arrival_date_year int,
arrival_date_month varchar(100),
arrival_date_week_number int,
arrival_date_day_of_month int,
stays_in_weekend_nights int,
stays_in_week_nights int,
adults int,
children int,
babies int,
meal	varchar(100),
country	varchar(100),
market_segment	varchar(100),
distribution_channel	varchar(100),
is_repeated_guest	int,
previous_cancellations	int,
previous_bookings_not_canceled	int,
reserved_room_type	varchar(100),
assigned_room_type	varchar(100),
booking_changes	int,
deposit_type	varchar(100),
agent	int,
days_in_waiting_list	int,
customer_type	varchar(100),
adr	numeric(10,2),
required_car_parking_spaces	int,
total_of_special_requests	int,
reservation_status	varchar(100),
reservation_status_date	date,
Guest_Type	varchar(100),
Total_Guest	int,
foreign key(hotel_id) references Hotel(hotel_id) on delete cascade,
foreign key(Guest_id) references Guest_Type(Guest_id) on delete cascade
);

select * from booking;


--update query
Update booking SET hotel_id = 1 WHERE hotel ='Resort Hotel';
Update booking SET hotel_id = 2 WHERE hotel ='City Hotel';

--update guest_id 
Update booking SET Guest_id = 1 Where Guest_type = 'Single';
Update booking SET Guest_id = 2 Where Guest_type = 'Couple';
Update booking SET Guest_id = 3 Where Guest_type = 'Family';