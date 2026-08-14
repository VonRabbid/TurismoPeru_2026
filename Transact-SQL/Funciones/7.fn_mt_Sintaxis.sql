-- Sintaxis Funcion Tabla Multiple
CREATE OR ALTER FUNCTION cpam.fn_nombrefuncion
(
--@Parametro TipoDato
@edad int
)
RETURNS @Resultado Table
(
Columna1 tipodato,
Columna2 típodato,
Columna3 tipodato
AS
BEGIN 
--Instrucciones sql 
RETURN;

END;
GO