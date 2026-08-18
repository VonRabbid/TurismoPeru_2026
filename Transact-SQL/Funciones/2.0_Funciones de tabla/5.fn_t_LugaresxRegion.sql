-- Lugares turísticos por región 
CREATE OR ALTER FUNCTION CPAM.FN_LugaresPorRegion
(
    @IdRegion INT
)
RETURNS TABLE
RETURN
(
    SELECT 
        L.id_lugarturistico, 
        L.nombre AS NombreLugar, 
        L.descripcion,
        R.nombreregion 
    FROM cpam.lugar_turistico L
    INNER JOIN cpam.direccion_lugarturistico DL 
        ON L.id_lugarturistico = DL.id_lugarturistico
    INNER JOIN cpam.direccion D
        ON DL.id_direccion = D.id_direccion
    INNER JOIN cpam.ciudad C 
        ON D.id_ciudad = C.id_ciudad
    INNER JOIN cpam.subregion SR 
        ON C.id_subregion = SR.id_subregion
    INNER JOIN cpam.region R 
        ON SR.id_region = R.id_region
    WHERE R.id_region = @IdRegion
);
GO
SELECT 
    *, 
    GETDATE() AS Fecha_Consulta,
    cpam.FN_NombreCompletoPersona(104) AS Estudiante
FROM CPAM.FN_LugaresPorRegion(2);
-- Ejecutar 
SELECT 
    *, 
    GETDATE() AS Fecha_Consulta,
    cpam.FN_NombreCompletoPersona(104) AS Estudiante
FROM CPAM.FN_LugaresPorRegion(2);

