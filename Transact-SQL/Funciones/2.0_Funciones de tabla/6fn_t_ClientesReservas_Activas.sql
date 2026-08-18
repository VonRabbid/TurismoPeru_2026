-- Clientes con reservas activas
CREATE OR ALTER FUNCTION CPAM.FN_ClientesReservasActivas ()
RETURNS TABLE
RETURN
(
    SELECT 
        C.id_persona AS id_cliente, 
        P.nombres,
        P.apaterno,
        R.id_reserva,
        R.fecha_reserva,
        ER.nombre AS estado_reserva 
    FROM cpam.cliente C
    INNER JOIN cpam.persona P 
        ON C.id_persona = P.id_persona
    INNER JOIN cpam.reserva R 
        ON C.id_persona = R.id_cliente 
    INNER JOIN cpam.estado_reserva ER 
        ON R.id_estado_reserva = ER.id_estado_reserva
    WHERE ER.nombre = 'Confirmada' 
);
GO

-- Ejecutar 
SELECT 
    *, 
    GETDATE() AS Fecha_Consulta,
    cpam.FN_NombreCompletoPersona(104) AS Estudiante
FROM CPAM.FN_ClientesReservasActivas();
