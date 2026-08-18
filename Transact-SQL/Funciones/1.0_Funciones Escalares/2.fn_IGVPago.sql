--Calcular el igv de un pago
CREATE OR ALTER FUNCTION CPAM.FN_CalcularIGVPago
(
@monto money 
)
returns money 
as 
begin 
return @monto *0.18;
end
go

Select CPAM.FN_CalcularIGVPago (459) as IGV, 
GETDATE () as Fecha_consulta;

Select 
monto, 
CPAM.FN_CalcularIGVPago (monto) as IGV, 
GETDATE () as Fecha_consulta
from cpam.pago 
where monto >= 0;