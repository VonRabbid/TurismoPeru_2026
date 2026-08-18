-- Cantidad reservas
CREATE OR ALTER FUNCTION cpam.FN_CantidadReservasCliente
(
    @IdCliente INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Cantidad INT;
    SELECT @Cantidad = COUNT(id_reserva)
    FROM cpam.reserva
    WHERE id_cliente = @IdCliente;
    RETURN ISNULL(@Cantidad, 0); 
END
GO
-- Ejecutar
SELECT 
    cpam.FN_CantidadReservasCliente(2) AS CantidadReservas,
    GETDATE() AS Fecha_Consulta;