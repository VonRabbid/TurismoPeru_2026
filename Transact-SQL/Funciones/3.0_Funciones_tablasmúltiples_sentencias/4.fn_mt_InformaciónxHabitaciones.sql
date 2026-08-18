--Resumen de habitaciones por alojamiento
CREATE OR ALTER FUNCTION CPAM.FN_ResumenHabitacionesAlojamiento
(
    @IdAlojamiento INT
)
RETURNS @TablaResumen TABLE 
(
    numero_habitacion VARCHAR(20),
    tipo_habitacion VARCHAR(50),
    capacidad INT,
    precio_noche MONEY,
    estado VARCHAR(20)
)
AS
BEGIN
    INSERT INTO @TablaResumen (numero_habitacion, tipo_habitacion, capacidad, precio_noche, estado)
    SELECT 
        H.numero_habitacion,
        TH.nombrehabitacion, 
        TH.capacidad_personas,
        H.precio_noche,
        H.estado
    FROM cpam.habitacion H
    INNER JOIN cpam.tipo_habitacion TH 
        ON H.id_tipo_habitacion = TH.id_tipo_habitacion
    WHERE H.id_alojamiento = @IdAlojamiento;
    RETURN;
END;
GO
-- Ejecutar 
SELECT 
    *, 
    GETDATE() AS Fecha_Consulta,
    cpam.FN_NombreCompletoPersona(104) AS Estudiante
FROM CPAM.FN_ResumenHabitacionesAlojamiento(7);
