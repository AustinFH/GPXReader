/****** Script for SelectTopNRows command from SSMS  ******/
USE ZipCodes

DECLARE @Count AS INT = (SELECT COUNT(*)FROM Waypoints_25FEB17)
DECLARE @CountIncr AS INT = 1
DECLARE @LAT AS REAL
DECLARE @LON AS REAL

DECLARE @LATv AS VARCHAR(20)
DECLARE @LONv AS VARCHAR(20)
DECLARE @Space1 AS VARCHAR(1) = ' '
DECLARE @Comma1 AS VARCHAR(2) = ', '

DECLARE @LineString AS VARCHAR(MAX) ='LINESTRING('
SELECT @LineString

WHILE @CountIncr < @Count
BEGIN

SET @LAT = (SELECT Latitude FROM Waypoints_25FEB17 WHERE SEQ = @CountIncr)
SET @LON = (SELECT Longitude FROM Waypoints_25FEB17 WHERE SEQ = @CountIncr)

SET @LATv = CAST(@LAT AS VARCHAR(20))
SET @LONv = CAST(@LON AS VARCHAR(20))

SET @LineString = CONCAT(@LineString,  @LONv, @Space1, @LATv)


SET @CountIncr = @CountIncr + 1
--SELECT @CountIncr
END


DECLARE @BracketC AS VARCHAR(8) = '), 4326'
--SET @LineString = CONCAT(@LineString)--, 4326));

--INSERT INTO Waypoints_25FEB17Polyline (geog)
-- VALUES (geography::STGeomFromText(@LineString + ')', 4326))

SELECT @LAT AS LAT
SELECT @LON AS LON
SELECT @LineString AS Linestring

--SELECT TOP 1000 [SEQ] ,geog  FROM [ZipCodes].[dbo].[Waypoints_25FEB17Polyline]

