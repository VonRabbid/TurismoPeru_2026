-- Utilizar la función de reservas en un JOIN
SELECT 
    C.id_persona AS id_cliente,
    P.nombres,
    P.apaterno,
    FR.id_reserva,
    FR.fecha_reserva,
    FR.estado_reserva,
    GETDATE() AS Fecha_Consulta,
    cpam.FN_NombreCompletoPersona(104) AS Estudiante
FROM cpam.cliente C
INNER JOIN cpam.persona P 
    ON C.id_persona = P.id_persona
CROSS APPLY CPAM.FN_ReservasClienteEstado(C.id_persona, DEFAULT) AS FR;
