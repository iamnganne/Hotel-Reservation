
CREATE DATABASE BookingHotelDW
GO
USE BookingHotelDW
Go

/* Create table dbo.Cancellation_fact */
CREATE TABLE dbo.Cancellation_fact (
   [DateKey]  int   NOT NULL
,  [BookingKey]  int   NOT NULL
,  [MarketSegmentKey]  int   NOT NULL
,  [BookingStatus]  nvarchar(15)   NULL
,  [Lead_time]  int   NULL
,  [RoomTypeKey]  int   NOT NULL
, CONSTRAINT [PK_dbo.Cancellation_fact] PRIMARY KEY NONCLUSTERED 
([BookingKey] )
) ON [PRIMARY]
;

/* Create table dbo.DimDate */
CREATE TABLE dbo.DimDate (
   [DateKey]  int   NOT NULL
,  [Arrival_date]  int   NULL
,  [Arrival_month]  int   NULL
,  [Arrival_year]  int   NULL
,  [Quarter]  int   NULL
CONSTRAINT [PK_dbo.DimDatee] PRIMARY KEY CLUSTERED 
([DateKey] )
) ON [PRIMARY]
;


/* Create table dbo.Dim_ CustomerType */
CREATE TABLE dbo.Dim_CustomerType (
   [CustomerTypeKey]  int IDENTITY  NOT NULL
,  [CustomerType]  INT   NULL
, CONSTRAINT [PK_dbo.Dim_CustomerTypee] PRIMARY KEY CLUSTERED 
( [CustomerTypeKey] )
) ON [PRIMARY]
;


/* Create table dbo.DimMarketSegmentType */
CREATE TABLE dbo.DimMarketSegmentType (
   [MarketSegmentKey]  int IDENTITY  NOT NULL
,  [market_segment_type]  nvarchar(20)   NOT NULL
, CONSTRAINT [PK_dbo.DimMarketSegmentTypee] PRIMARY KEY CLUSTERED 
( [MarketSegmentKey] )
) ON [PRIMARY]
;

/* Create table dbo.DimParkingSpace */



/* Create table dbo.DimRoomType */
CREATE TABLE dbo.DimRoomType (
   [RoomTypeKey]  int IDENTITY  NOT NULL
,  [room_type_reserved]  nvarchar(20)   NOT NULL
, CONSTRAINT [PK_dbo.DimRoomTypee] PRIMARY KEY CLUSTERED 
( [RoomTypeKey] )
) ON [PRIMARY]
;

/* Create table dbo.Booking_fact */
CREATE TABLE dbo.Booking_fact (
   [DateKey]  int   NOT NULL
,  [BookingKey]  int   NOT NULL
,  [MarketSegmentKey]  int   NOT NULL
,  [MealKey]  int   NOT NULL
,  [CustomerTypeKey]  int   NOT NULL
,  [RoomTypeKey]  int   NOT NULL
,  [avg_price_per_room]  float   NOT NULL
,  [total] float   NOT NULL
, CONSTRAINT [PK_dbo.Booking_fact] PRIMARY KEY NONCLUSTERED 
([BookingKey] )
) ON [PRIMARY]
;

/* Create table dbo.DimBooking */
CREATE TABLE dbo.DimBooking (
   [BookingKey]  int IDENTITY  NOT NULL
,  [BookingID]  nvarchar(15)   NOT NULL
,  [BookingStatus]  nvarchar(15)   NOT NULL
,  [SpecialRequests]  int  NOT NULL
,  [avg_price_per_room]  float   NOT NULL
,  [Lead_time]  int   NULL
,  [Weekend_nights]  int   NULL
,  [Week_nights]  int   NULL
,  [no_of_adults] int NULL
,  [no_of_childrens] int NULL
,  [required_car_parking_space] int NULL
, CONSTRAINT [PK_dbo.DimBookingg] PRIMARY KEY CLUSTERED 
( [BookingKey] )
) ON [PRIMARY]
;

/* Create table dbo.DimMealType */
CREATE TABLE dbo.DimMealType (
   [MealKey]  int IDENTITY  NOT NULL
,  [type_of_meal_plan]  nvarchar(20)   NOT NULL
, CONSTRAINT [PK_dbo.DimMealTypee] PRIMARY KEY CLUSTERED 
( [MealKey] )
) ON [PRIMARY]
;
---------------------FACT_CANCELLATION-----------------------------------------------------------------
ALTER TABLE dbo.Cancellation_fact ADD CONSTRAINT
   FK_dbo_Cancellation_fact_BookingKey FOREIGN KEY
   (
	BookingKey
   ) REFERENCES DimBooking
   ( BookingKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
ALTER TABLE dbo.Cancellation_fact ADD CONSTRAINT
   FK_dbo_Cancellation_fact_RoomTypeKeyy FOREIGN KEY
   (
   RoomTypeKey
   ) REFERENCES DimRoomType
   ( RoomTypeKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;

ALTER TABLE dbo.Cancellation_fact ADD CONSTRAINT
   FK_dbo_Cancellation_fact_DateKeyy FOREIGN KEY
   (
   DateKey
   ) REFERENCES DimDate
   ( DateKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.Cancellation_fact ADD CONSTRAINT
   FK_dbo_Cancellation_fact_MarketSegmentKeyy FOREIGN KEY
   (
   MarketSegmentKey
   ) REFERENCES DimMarketSegmentType
   ( MarketSegmentKey)
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
----------------------FACT_BOOKING--------------------------------------------------------------------------------
ALTER TABLE dbo.Booking_fact ADD CONSTRAINT
   FK_dbo_Booking_fact_BookingKeyy FOREIGN KEY
   (
   BookingKey
   ) REFERENCES DimBooking
   ( BookingKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
ALTER TABLE dbo.Booking_fact ADD CONSTRAINT
   FK_dbo_Booking_fact_RoomTypeKeyy FOREIGN KEY
   (
   RoomTypeKey
   ) REFERENCES DimRoomType
   ( RoomTypeKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
ALTER TABLE dbo.Booking_fact ADD CONSTRAINT
   FK_dbo_Booking_fact_DateKeyy FOREIGN KEY
   (
   DateKey
   ) REFERENCES DimDate
   ( DateKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;

 
ALTER TABLE dbo.Booking_fact ADD CONSTRAINT
   FK_dbo_Booking_fact_MarketSegmentKeyy FOREIGN KEY
   (
   MarketSegmentKey
   ) REFERENCES DimMarketSegmentType
   ( MarketSegmentKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.Booking_fact ADD CONSTRAINT
   FK_dbo_Booking_fact_MealKeyy FOREIGN KEY
   (
   MealKey
   ) REFERENCES DimMealType
   ( MealKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.Booking_fact ADD CONSTRAINT
   FK_dbo_Booking_fact_CustomerTypeKeyyy FOREIGN KEY
   (
   CustomerTypeKey
   ) REFERENCES Dim_CustomerType
   ( CustomerTypeKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 

