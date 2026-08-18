-- Reserva Cliente
CREATE OR ALTER FUNCTION cpam.fn_MT_ReservasCliente
(
	@IdCliente int
)
RETURNS @Resultado TABLE
(
	IdReserva int,
	FechaReserva date,
	EstadoReserva varchar(100),
	TotalPagado money
)
AS
BEGIN
	INSERT INTO @Resultado
	(
		IdReserva,
		FechaReserva,
		EstadoReserva,
		TotalPagado
	)
	SELECT
		R.id_reserva,
		R.fecha_reserva,
		ER.nombre, 
		isnull (SUM(P.monto), 0) 
	FROM cpam.reserva R 
	INNER JOIN
		cpam.estado_reserva ER on
		er.id_estado_reserva = r.id_estado_reserva

	LEFT JOIN
		cpam.pago P on
		R.id_reserva = P.id_reserva
	where R.id_cliente = @IdCliente

	GROUP BY
		R.id_reserva,
		R.fecha_reserva,
		ER.nombre; 
	
	RETURN;
END;
GO

SELECT 
	*,
	GETDATE() as Fecha_Consulta,
	cpam.fn_NombreCompletoPersona (104) as Estudiante
FROM cpam.fn_MT_ReservasCliente (10);