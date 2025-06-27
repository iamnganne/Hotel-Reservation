# 🏨 Hotel Reservation ETL Project 
This project demonstrate an end-to-end **ETL Pipeline** for **Hotel Reservation**, store it in SQL Server databse using the Star Schema model, and visualize the data using Power BI. The ETL process implemented using SSIS (SQL Server Integration Services).
- **SQL Server** as the data warehouse 
- **SSIS** for the ETL process 
- **Power BI** for dashboard visualization 
- A **Star Schema** data model with **Fact** and **Dimension** tables 

## Data Structure 
The project ues the Star Schema, include Fact and Dimension tables

| Fact Table  | 
| ------------- | 
| Fact Booking |
| Fact Cancellation  | 

|  Dimension Table  | 
| ------------- | 
| Dim MealType |
| Dim MarketSegment  |
| Dim Date |
| Dim Customer Type  | 

## ETL Process (SSIS) 
The ETL workflow includes: 
1. **Extract**: 
- Import raw hotel reservation data (CSV/Excel) from Kagle
2. **Transform**:
- Clean data
- Convert date/time formats
- Check and handle missing null values
- Map categories fields
3. **Load**:
  - Load transformed data into dimension table
  - Load transactional records into the fact table

## Installation Instructions 
1. Set up environemnt
Install SQL Server (version 2019 or higher).
Install SQL Server Data Tools (SSDT) for SSIS development.
Install Power BI Desktop.
2. Create Database:
Run the scrips in the folder to create Fact and Dimension tables.
3. Run SSIS packages
Configure connections to data sources and SQL Server.
Execute packages in the order: Extract -> Transform -> Load.
4. Visualize data
Open the Hotel_Reservation_Dashboard.pbix file in Power BI Desktop.

## Power BI Reports 
Power BI connects directly to the data warehouse and visualizes: 
- Total bookings and revenue by month
- Room type popularity
- Booking status trends
- Cancellation rate
