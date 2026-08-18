--Total pago por una reserva
CREATE OR ALTER FUNCTION CPAM.FN_PagoTotalxReserva
(
@IdReserva int
)
Returns Money
AS
BEGIN
Declare @Total money
Select 
@Total = sum(monto)
from cpam.pago
where id_reserva = @IdReserva;

RETURN isnull (@Total,0);
END;

--Ejecutar 
Select CPAM.FN_PagoTotalxReserva (2) AS MontoPagado,
GetDate () as Fecha_Consulta;