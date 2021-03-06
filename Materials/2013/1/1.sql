/****** Script for SelectTopNRows command from SSMS  ******/
select *, 'POLYGON((' + REPLACE(replace(REPLACE(REPLACE(C, ',', ' '), '] [', ' , '), '[', ''), ']', '')+	'))' 
from [dbo].[AREA]
--where  F8 like '%' + CHAR(10) + '%'


update [dbo].[AREA]
	set F9 = geography::STGeomFromText('POLYGON((' + 
	REPLACE(replace(REPLACE(REPLACE(C, ',', ' '), '] [', ' , '), '[', ''), ']', '') +
	'))', 4326)
FROM [dbo].[AREA]
where N = 7
	
GO

--POLYGON((54.99438 73.31387 , 54.99268 73.31131 , 54.99091 73.31515 , 54.9892 73.31895 , 54.99077 73.32135 , 54.99438 73.31387))
--POLYGON((54.99438 73.31387 , 54.99268 73.31131 , 54.99091 73.31515 , 54.9892 73.31895 , 54.99077 73.32135 , 54.99438 73.31387))
--POLYGON((-122.358 47.653 , -122.348 47.649, -122.348 47.658, -122.358 47.658, -122.358 47.653))


update [dbo].[AREA]
set F9 = geography::STGeomFromText(
	'POLYGON((
	54.99438 73.31387 , 
	54.99077 73.32135 ,
	54.9892 73.31895 , 
	54.99091 73.31515 , 
	54.99268 73.31131 , 	 
	54.99438 73.31387))', 4326);
GO


SELECT	'localCollection.add(new ymaps.Polygon([[' + C + 
		']], { hintContent: "' + 
		
		'Преступлений на участке: ' + isnull(cast(data.F3 as varchar(16)), 'не указано') + '<br\> Уровень преступности: ' +
		
		case
			when data.F4 = 0 then 'средний'
			when data.F4 = -2 then 'низкий'
			when data.F4 = -1 then 'ниже среднего'
			when data.F4 = 1 then 'выше среднего'
			when data.F4 = 2 then 'высокий'
			when data.F4 is null then 'не указан'
		end		

		+ '" }, { fillColor: ''' + 
		case
			when data.F4 = 0 then '#FFFF00'
			when data.F4 = -2 then '#228B22'
			when data.F4 = -1 then '#00FF00'
			when data.F4 = 1 then '#F08080'
			when data.F4 = 2 then '#FF0000'
			when data.F4 is null then '#DCDCDC'
		end		
		+ ''', opacity: 0.5 }));'
  
FROM [MDW].[dbo].[AREA]
left join data on data.f1 = area.n