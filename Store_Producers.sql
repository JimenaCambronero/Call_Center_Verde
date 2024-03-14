/* CREATE PROCEDURE `sp_crear_tabla_llamadas_positivas`()
BEGIN
# Paso 1: si la tabla de calificación de llamadas existe, eliminarla para poder reemplazarla.
DROP TABLE IF EXISTS dbCall_center_verde.calificacion_llamadas; 

# Paso 2: crear la tabla de calificacion de llamadas con condiciones indicadas: solo llamadas positivas y con un nuevo campo de fecha de actualización
CREATE TABLE calificacion_llamadas(
	SELECT *,
    NOW() as fecha_actualizacion
    FROM call_center
    WHERE calificacion = 'Positiva'
    );

END
*/

CALL sp_crear_tabla_llamadas_positivas;
SELECT * FROM calificacion_llamadas;