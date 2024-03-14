/* Crear un evento
Se debe ejecutar cada 5 minutos el SP 
El evento se debe llamar ejecutar_sp_crear_reporting_salario_medio


Antes de empezar a crear eventos, necesitamos saber si el planificador o scheduler de MySQL está arrancado. Para ello tendremos que ver el fichero de configuración de MySQL (my.cnf en Unix o my.ini en Window) y ver el valor de la variable event_scheduler. Estos valores pueden ser:

0 (por defecto): estado del planificador parado (OFF).
1: estado del planificador arrancado (ON).
DISABLED: estado del planificador deshabilitado.
Para poder modificar el estado del planificador/scheduler podemos o bien modificar el fichero de configuración de MySQL y rearrancar la base de datos o bien modificar el valor de la variable event_scheduler ejecutando lo siguiente:

SET GLOBAL event_scheduler=ON;
Una vez que tengamos arrancado el planificador/scheduler podemos comprobarlo ejecuando

SHOW PROCESSLIST;
Entonces veremos como hay un nuevo proceso llamado evento_scheduler.
*/

SHOW PROCESSLIST;

CREATE EVENT ejecutar_sp_crear_reporting_salario_medio
	ON SCHEDULE EVERY 5 minute
		STARTS CURRENT_TIMESTAMP + INTERVAL 1 MINUTE #comienza - opcional
		ENDS CURRENT_TIMESTAMP + INTERVAL 60 MINUTE #termina - opcional
	DO
		CALL crear_reporting_salario_medio();
        
SHOW EVENTS;
    