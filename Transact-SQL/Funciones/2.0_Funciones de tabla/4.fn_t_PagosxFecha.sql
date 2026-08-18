--Pagos por rango de fechas
CREATE OR ALTER FUNCTION CPAM.FN_PagosRangoFechas
(
    @FechaInicio DATE,
    @FechaFin DATE
)
RETURNS TABLE
RETURN
(
    SELECT 
        id_pago,
        id_reserva,
        monto,
        fecha_pago  
    FROM cpam.pago
    WHERE fecha_pago BETWEEN @FechaInicio AND @FechaFin
);
GO

SELECT 
    *, 
    GETDATE() AS Fecha_Consulta,
    cpam.FN_NombreCompletoPersona(104) AS Estudiante
FROM CPAM.FN_PagosRangoFechas('2026-01-01', '2026-12-31');