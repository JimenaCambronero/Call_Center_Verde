/* Crear la consulta para el SP
El primer paso será crear la consulta para generar el reporte. El reporte debe contener:
Nombre completo: Nombre y apellido en un mismo campo separado por espacio
Titulo del trabajo que tiene el empleado
Nombre del departamento
Fecha inicio de trabajo en la empresa
Fecha fin de trabajo en la empresa
Provincia del empleado
Salario que gana el empleado
Deberas filtrar por los empleados que ganen por encima del salario de medio todos los empleados
*/


SELECT 
	CONCAT(nombre_empleado, " ", apellido_empleado) as nombre_completo,
	t.titulo_trabajo,
	d.nombre_departamento,
    h.fecha_fin,
    h.fecha_inicio,    
	u.estado_provincia,
    e.salario,
    NOW() as fecha_actualizacion
FROM hr_unicorn.empleados e
LEFT JOIN hr_unicorn.trabajos t ON t.id_trabajo = e.id_trabajo
LEFT JOIN hr_unicorn.departamentos d ON d.id_departamento = e.id_departamento
LEFT JOIN hr_unicorn.historial_trabajos h ON h.id_empleado = e.id_empleado
LEFT JOIN hr_unicorn.ubicaciones u ON u.id_ubicacion = d.id_ubicacion
WHERE e.salario > (SELECT AVG(salario) FROM hr_unicorn.empleados)
ORDER BY salario ASC;

/* Crear una vista que guarde la información de la consulta anterior
La vista se debe llamar reporting_salario_medio 
*/
CREATE VIEW reporting_salario_medio AS
	SELECT 
		CONCAT(nombre_empleado, " ", apellido_empleado) as nombre_completo,
		t.titulo_trabajo,
		d.nombre_departamento,
		h.fecha_fin,
		h.fecha_inicio,    
		u.estado_provincia,
		e.salario,
		NOW() as fecha_actualizacion
	FROM hr_unicorn.empleados e
	LEFT JOIN hr_unicorn.trabajos t ON t.id_trabajo = e.id_trabajo
	LEFT JOIN hr_unicorn.departamentos d ON d.id_departamento = e.id_departamento
	LEFT JOIN hr_unicorn.historial_trabajos h ON h.id_empleado = e.id_empleado
	LEFT JOIN hr_unicorn.ubicaciones u ON u.id_ubicacion = d.id_ubicacion
	WHERE e.salario > (SELECT AVG(salario) FROM hr_unicorn.empleados);

/* Crear un SP que guarda esa consulta como vista y la reemplace
El SP se debe llamar crear_reporting_salario_medio 
CREATE PROCEDURE `crear_reporting_salario_medio` ()
BEGIN
CREATE OR REPLACE VIEW reporting_salario_medio as 
SELECT 
		CONCAT(nombre_empleado, " ", apellido_empleado) as nombre_completo,
		t.titulo_trabajo,
		d.nombre_departamento,
		h.fecha_fin,
		h.fecha_inicio,    
		u.estado_provincia,
		e.salario,
		NOW() as fecha_actualizacion
	FROM hr_unicorn.empleados e
	LEFT JOIN hr_unicorn.trabajos t ON t.id_trabajo = e.id_trabajo
	LEFT JOIN hr_unicorn.departamentos d ON d.id_departamento = e.id_departamento
	LEFT JOIN hr_unicorn.historial_trabajos h ON h.id_empleado = e.id_empleado
	LEFT JOIN hr_unicorn.ubicaciones u ON u.id_ubicacion = d.id_ubicacion
	WHERE e.salario > (SELECT AVG(salario) FROM hr_unicorn.empleados);
END

*/
SELECT * FROM reporting_salario_medio;

CALL crear_reporting_salario_medio();