--Reserva de un cliente
CREATE OR ALTER FUNCTION CPAM.FN_ReservaCliente
(
    @IdCliente int
)
RETURNS TABLE
RETURN
(
    Select
    R.id_reserva,
    R.fecha_reserva,
    R.id_estado_reserva
    From cpam.reserva R inner join
    cpam.estado_reserva ER on
    ER.id_estado_reserva = R.id_estado_reserva
    where R.id_cliente = @IdCliente
);
GO

Select *, GETDATE () as Fecha_Consulta,
cpam.FN_NombreCompletoPersona (104) AS Estudiante
from cpam.FN_ReservaCliente (2);