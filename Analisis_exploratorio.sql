SELECT * FROM call_center;

#Chequear rango de tiempo de las llamadas, min fecha y max fecha
SELECT MIN(tiempo_llamada) fecha_minima,
MAX(tiempo_llamada)fecha_maxima
FROM call_center;

#Chequear la cantidad de columnas y filas que tenemos
SELECT COUNT(*) as cantidad,
'Columnas' as descripcion
FROM information_schema.columns
WHERE table_name = 'call_center';

SELECT COUNT(*) as cantidad,
'Filas' as descripcion
FROM call_center;

#Chequear valores unicos de las siguientes columnas: calificacion, razon, canal, tiempo_respuesta, estado
SELECT DISTINCT(calificacion)
FROM call_center;

SELECT DISTINCT(razon)
FROM call_center;

SELECT DISTINCT(canal)
FROM call_center;

SELECT DISTINCT(tiempo_respuesta)
FROM call_center;

SELECT DISTINCT(estado)
FROM call_center;

#Chequear la cantidad de registros y porcentajes de las columnas q miramos los valores únicos
SELECT calificacion,
COUNT(*) as Registros,
ROUND((
		COUNT(*)/ 
			(SELECT COUNT(*) FROM call_center)
	  )
      *100,1
	   ) as Porcentaje
FROM call_center
GROUP BY calificacion;

SELECT razon,
COUNT(*) as Registros,
ROUND((
		COUNT(*)/ 
			(SELECT COUNT(*) FROM call_center)
	  )
      *100,1
	   ) as Porcentaje
FROM call_center
GROUP BY razon;

SELECT canal,
COUNT(*) as Registros,
ROUND((
		COUNT(*)/ 
			(SELECT COUNT(*) FROM call_center)
	  )
      *100,1
	   ) as Porcentaje
FROM call_center
GROUP BY canal;

SELECT tiempo_respuesta,
COUNT(*) as Registros,
ROUND((
		COUNT(*)/ 
			(SELECT COUNT(*) FROM call_center)
	  )
      *100,1
	   ) as Porcentaje
FROM call_center
GROUP BY tiempo_respuesta;

SELECT estado,
COUNT(*) as Registros,
ROUND((
		COUNT(*)/ 
			(SELECT COUNT(*) FROM call_center)
	  )
      *100,1
	   ) as Porcentaje
FROM call_center
GROUP BY estado
ORDER BY Registros DESC;

#Verifique la duración promedio de las llamadas por call center, siendo una llamada éxito aquella que tenga una duracion < 10 minutos
SELECT call_center,
ROUND(AVG(duracion_llamada),2) Promedio_llamada_exitosa
FROM call_center
WHERE duracion_llamada <10
GROUP BY call_center
ORDER BY Promedio_llamada_exitosa desc;


