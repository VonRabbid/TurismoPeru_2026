-- Clasificación del cliente
CREATE OR ALTER FUNCTION CPAM.FN_ClasificacionCliente
(
    @IdCliente int
)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @Cantidad int;
    DECLARE @Categoria VARCHAR(50);
    SELECT @Cantidad = COUNT(id_reserva)
    FROM cpam.reserva
    WHERE id_cliente = @IdCliente;
    IF @Cantidad > 15
        SET @Categoria = 'Cliente VIP';
    ELSE IF @Cantidad >= 5  
        SET @Categoria = 'Cliente Frecuente';
    ELSE
        SET @Categoria = 'Cliente Nuevo'; 
        
    RETURN @Categoria;
END
GO

SELECT 
    cpam.FN_NombreCompletoPersona(104) AS Estudiante,
    2 AS ID_Cliente_Evaluado,
    CPAM.FN_CantidadReservasCliente(2) AS CantidadReservas,
    CPAM.FN_ClasificacionCliente(2) AS Clasificacion,
    GETDATE() AS FechaConsulta;