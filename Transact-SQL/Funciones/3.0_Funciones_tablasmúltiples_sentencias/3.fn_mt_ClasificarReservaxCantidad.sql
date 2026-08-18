-- Clasificar reservas de un cliente
CREATE OR ALTER FUNCTION CPAM.FN_ClasificarClienteTabla
(
    @IdCliente INT
)
RETURNS @TablaClasificacion TABLE 
(
    id_cliente INT,
    cantidad_reservas INT,
    clasificacion VARCHAR(50)
)
AS
BEGIN 
    DECLARE @Cantidad INT;
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
    INSERT INTO @TablaClasificacion (id_cliente, cantidad_reservas, clasificacion)
    VALUES (@IdCliente, ISNULL(@Cantidad, 0), @Categoria);
    RETURN;
END;
GO

-- Ejecutar
SELECT 
    *, 
    GETDATE() AS Fecha_Consulta,
    cpam.FN_NombreCompletoPersona(104) AS Estudiante
FROM CPAM.FN_ClasificarClienteTabla(2);
