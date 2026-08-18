--Obtener nombre completo de una persona 
CREATE OR ALTER FUNCTION CPAM.FN_NombreCompletoPersona
(
    @IdPersona int
)
RETURNS VARCHAR (200)
AS
BEGIN
    Declare @nombrecompleto Varchar (200);
    
    Select @nombrecompleto = p.nombres + ' ' + p.apaterno + ' ' + p.amaterno
    from CPAM.persona p
    where p.id_persona = @IdPersona;
    
    Return @nombrecompleto
END
GO
--Ejecutar función
Select cpam.FN_NombreCompletoPersona (104)
As Persona, getdate () as FechaConsulta;