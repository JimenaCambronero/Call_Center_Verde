SELECT * from call_center;

#Del campo ib se debe extraer el código de 8 digitos que viene luego de las letras en un nuevo campo que se llame green_code
SELECT id,
SUBSTRING(id,5,8) as green_code
FROM call_center;

#Actualizar el formato fecha de string a fecha
SELECT STR_TO_DATE(tiempo_llamada, '%m/%d/%Y') as tiempo_lamada
FROM call_center;

#Aquellas llamadas que tengan el csat_score = deben convertirse a nulas
SELECT
CASE 
	when puntuacion = 0 THEN NULL
    else puntuacion
END as puntuacion
FROM call_center;

# La ciudad de New York se ha descargado mal y hay q pasar aquellos que no tengan el formato adecuado al que corresponde
SELECT 
CASE 
	when estado IN('NEWYORK', 'NewYork', 'NY', 'New York City') THEN estado = 'New York'
    ELSE estado
END as estado
FROM call_center;

#Convertir los minutos que están como enteros a hh:mm:ss
SELECT 
SEC_TO_TIME(duracion_llamada*60)as duracion_llamada
FROM call_center;

#Crear una nueva tabla a partir de las transformaciones
CREATE TABLE call_center_verde(
SELECT
SUBSTRING(id,5,8) as id,
nombre_cliente,
calificacion,
CASE 
	when puntuacion = 0 THEN NULL
    else puntuacion
END as puntuacion,
STR_TO_DATE(tiempo_llamada, '%m/%d/%Y') as tiempo_llamada,
razon,
ciudad,
CASE 
	when estado IN('NEWYORK', 'NewYork', 'NY', 'New York City') THEN estado = 'New York'
    ELSE estado
END as estado,
canal, 
tiempo_respuesta,
SEC_TO_TIME(duracion_llamada*60)as duracion_llamada,
call_center
FROM call_center);