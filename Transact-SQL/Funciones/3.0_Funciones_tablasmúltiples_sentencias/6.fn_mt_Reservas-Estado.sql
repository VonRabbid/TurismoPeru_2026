-- Reservas por cliente
CREATE OR ALTER FUNCTION CPAM.FN_ReservasClienteEstado
(
    @IdCliente INT,
    @Estado VARCHAR(30) = NULL
)
RETURNS @TablaReservas TABLE 
(
    id_reserva INT,
    fecha_reserva DATETIME,
    estado_reserva VARCHAR(30)
)
AS
BEGIN
    IF @Estado IS NULL
    BEGIN
        INSERT INTO @TablaReservas (id_reserva, fecha_reserva, estado_reserva)
        SELECT 
            R.id_reserva, 
            R.fecha_reserva, 
            ER.nombre
        FROM cpam.reserva R
        INNER JOIN cpam.estado_reserva ER 
            ON R.id_estado_reserva = ER.id_estado_reserva
        WHERE R.id_cliente = @IdCliente;
    END
    ELSE
    BEGIN
        INSERT INTO @TablaReservas (id_reserva, fecha_reserva, estado_reserva)
        SELECT 
            R.id_reserva, 
            R.fecha_reserva, 
            ER.nombre
        FROM cpam.reserva R
        INNER JOIN cpam.estado_reserva ER 
            ON R.id_estado_reserva = ER.id_estado_reserva
        WHERE R.id_cliente = @IdCliente 
          AND ER.nombre = @Estado;
    END
    RETURN;
END;
GO
-- Ejecutar
SELECT 
    *,
    GETDATE() AS Fecha_Consulta,
    cpam.FN_NombreCompletoPersona(104) AS Estudiante
FROM CPAM.FN_ReservasClienteEstado(2, DEFAULT); 
