# ejercicio Reporting
# Paso 1: 

SELECT calificacion, 
COUNT(*) as cantidad_llamadas
FROM call_center
GROUP BY calificacion;

# Paso 2:
SELECT 
call_center, calificacion,
COUNT(*) as cantidad_callcenter
FROM call_center
WHERE calificacion IN ('Muy Negativa', 'Negativa')
GROUP BY calificacion, call_center
ORDER BY call_center;

