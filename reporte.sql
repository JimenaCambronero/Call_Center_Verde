
/* crear un reporte automático que se guarde como vista para que el jefe departamento pueda acceder a él. Entonces,
crear la consulta que genera ese reporte. 
¿Qué es lo que debe contener esta consulta?
1.- Nombre completo del empleado en un mismo campo
2.- Título del trabajo que tiene ese empleado,
3.- Nombre del departamento donde está ese empleado,
4.- Fecha de inicio de trabajo en la empresa del empleado, la fecha fin, 
5.- Provincia del empleado, 
6.- Salario que da en el empleado
deberemos filtrar este reporte por los empleados que ganen por encima del salario medio de todos los empleados.
*/

SELECT CONCAT(nombre_empleado,' ', apellido_empleado) as nombre_empleado,
titulo_trabajo, nombre_departamento
FROM empleados e
left JOIN trabajos t
ON e.id_trabajo = t.id_trabajo
left join departamentos d
ON d.id_departamento = e.id_departamento;



