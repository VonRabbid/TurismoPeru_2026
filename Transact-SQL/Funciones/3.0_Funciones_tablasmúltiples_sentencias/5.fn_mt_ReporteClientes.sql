--Reporte de TODOS los clientes
CREATE OR ALTER FUNCTION CPAM.FN_ReporteClientesFrecuentes2 () 
RETURNS @TablaReporte TABLE 
(
    id_cliente INT,
    nombre_completo VARCHAR(200),
    total_reservas INT,
    total_pagado MONEY,
    clasificacion VARCHAR(50)
)
AS
BEGIN
    INSERT INTO @TablaReporte (id_cliente, nombre_completo, total_reservas, total_pagado, clasificacion)
    SELECT 
        C.id_persona AS id_cliente,
        CPAM.FN_NombreCompletoPersona(C.id_persona),
        CPAM.FN_CantidadReservasCliente(C.id_persona),
        ISNULL((
            SELECT SUM(P.monto) 
            FROM cpam.pago P 
            INNER JOIN cpam.reserva R ON P.id_reserva = R.id_reserva 
            WHERE R.id_cliente = C.id_persona
        ), 0),
        CPAM.FN_ClasificacionCliente(C.id_persona)
    FROM cpam.cliente C;
    RETURN;
END;
GO
-- Ejecutar
SELECT 
    *, 
    GETDATE() AS Fecha_Consulta,
    cpam.FN_NombreCompletoPersona(104) AS Estudiante
FROM CPAM.FN_ReporteClientesFrecuentes2()
ORDER BY total_reservas DESC;
