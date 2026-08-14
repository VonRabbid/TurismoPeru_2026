-- Habitaciones por alojamiento 
CREATE OR ALTER FUNCTION cpam.fn_HabitacionesAlojamiento
(
	@IdAlojamiento int
)
RETURNS TABLE
RETURN
(
SELECT 
	h.id_alojamiento,
	H.numero_habitacion,
	TH.nombrehabitacion,
	th.capacidad_personas,
	H.precio_noche,
	H.estado,
	H.descripcion
FROM cpam.habitacion H INNER JOIN
cpam.tipo_habitacion TH ON
H.id_tipo_habitacion = TH.id_tipo_habitacion
where id_alojamiento = @IdAlojamiento
);
GO

SELECT 
	*, 
	GETDATE() AS [Fecha de Consulta],
cpam.FN_NombreCompletoPersona (104) AS Estudiante
FROM cpam.fn_HabitacionesAlojamiento (7); 