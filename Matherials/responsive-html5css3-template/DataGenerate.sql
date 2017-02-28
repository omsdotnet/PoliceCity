/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
 'localCollection.add(new ymaps.Circle([[' + rd.CoordinateLng + ', ' + rd.CoordinateLat + '], 50], {draggable: false, fillColor: "#DB709377" }));'
FROM [RealtyObject] as ro
 inner join RealtyObjectDetail as rd on rd.ID = ro.ID
WHERE (rd.CoordinateLng is not null) and (rd.CoordinateLat is not null)
