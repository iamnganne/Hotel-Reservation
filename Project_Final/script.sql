
CREATE DATABASE HotelReservation
GO
USE HotelReservation
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
CONSTRAINT [PK_dbo.DimDate] PRIMARY KEY CLUSTERED 
([DateKey] )
) ON [PRIMARY]
;


/* Create table dbo.Dim_ CustomerType */
CREATE TABLE dbo.Dim_CustomerType (
   [CustomerTypeKey]  int IDENTITY  NOT NULL
,  [CustomerType]  nvarchar(10)   NULL
, CONSTRAINT [PK_dbo.Dim_CustomerType] PRIMARY KEY CLUSTERED 
( [CustomerTypeKey] )
) ON [PRIMARY]
;


/* Create table dbo.DimMarketSegmentType */
CREATE TABLE dbo.DimMarketSegmentType (
   [MarketSegmentKey]  int IDENTITY  NOT NULL
,  [market_segment_type]  nvarchar(20)   NOT NULL
, CONSTRAINT [PK_dbo.DimMarketSegmentType] PRIMARY KEY CLUSTERED 
( [MarketSegmentKey] )
) ON [PRIMARY]
;

/* Create table dbo.DimParkingSpace */



/* Create table dbo.DimRoomType */
CREATE TABLE dbo.DimRoomType (
   [RoomTypeKey]  int IDENTITY  NOT NULL
,  [room_type_reserved]  nvarchar(20)   NOT NULL
, CONSTRAINT [PK_dbo.DimRoomType] PRIMARY KEY CLUSTERED 
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
,  [avg_price_per_room]  int   NOT NULL
,  [total]  int   NOT NULL
,  [totalpeople]  int   NOT NULL
, CONSTRAINT [PK_dbo.Booking_fact] PRIMARY KEY NONCLUSTERED 
([BookingKey] )
) ON [PRIMARY]
;

/* Create table dbo.DimBooking */
CREATE TABLE dbo.DimBooking (
   [BookingKey]  int IDENTITY  NOT NULL
,  [BookingID]  nvarchar(15)   NOT NULL
,  [BookingStatus]  nvarchar(15)   NOT NULL
,  [SpecialRequests]  bit  NOT NULL
,  [avg_price_per_room]  int   NOT NULL
,  [Lead_time]  int   NULL
,  [Weekend_nights]  int   NULL
,  [Week_nights]  int   NULL
, CONSTRAINT [PK_dbo.DimBooking] PRIMARY KEY CLUSTERED 
( [BookingKey] )
) ON [PRIMARY]
;

/* Create table dbo.DimMealType */
CREATE TABLE dbo.DimMealType (
   [MealKey]  int IDENTITY  NOT NULL
,  [type_of_meal_plan]  nvarchar(20)   NOT NULL
, CONSTRAINT [PK_dbo.DimMealType] PRIMARY KEY CLUSTERED 
( [MealKey] )
) ON [PRIMARY]
;

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
   FK_dbo_Cancellation_fact_DateKey FOREIGN KEY
   (
   DateKey
   ) REFERENCES DimDate
   ( DateKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.Cancellation_fact ADD CONSTRAINT
   FK_dbo_Cancellation_fact_MarketSegmentKey FOREIGN KEY
   (
   MarketSegmentKey
   ) REFERENCES DimMarketSegmentType
   ( MarketSegmentKey)
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;

ALTER TABLE dbo.Booking_fact ADD CONSTRAINT
   FK_dbo_Booking_fact_BookingKey FOREIGN KEY
   (
   BookingKey
   ) REFERENCES DimBooking
   ( BookingKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
ALTER TABLE dbo.Booking_fact ADD CONSTRAINT
   FK_dbo_Booking_fact_DateKey FOREIGN KEY
   (
   DateKey
   ) REFERENCES DimDate
   ( DateKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;

 
ALTER TABLE dbo.Booking_fact ADD CONSTRAINT
   FK_dbo_Booking_fact_MarketSegmentKey FOREIGN KEY
   (
   MarketSegmentKey
   ) REFERENCES DimMarketSegmentType
   ( MarketSegmentKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.Booking_fact ADD CONSTRAINT
   FK_dbo_Booking_fact_MealKey FOREIGN KEY
   (
   MealKey
   ) REFERENCES DimMealType
   ( MealKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.Booking_fact ADD CONSTRAINT
   FK_dbo_Booking_fact_CustomerTypeKey FOREIGN KEY
   (
   CustomerTypeKey
   ) REFERENCES Dim_CustomerType
   ( CustomerTypeKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
ALTER TABLE HotelReservation.dbo.Dim_CustomerType
ALTER COLUMN CustomerType Int

ALTER TABLE HotelReservation.dbo.Booking_fact DROP COLUMN totalpeople