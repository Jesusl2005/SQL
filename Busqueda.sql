SELECT ventas.Zona,
       ventas.Cuenta,
       Salida.Cliente,
       CONVERT(date, Salida.Fecha) AS Fecha,
       det.Articulo,
       det.Referencia,
       CONVERT(int,det.Valor) AS VrUnitario,
       det.Cantidad AS Cant,
       ventas.NoCtas,
       ventas.CtasPag
FROM VLIDA.dbo.InvtSalidas AS Salida
JOIN VLIDA.dbo.Ventas AS ventas ON
ventas.OSNo = Salida.Numero
JOIN VLIDA.dbo.InvtSalidas_Det AS det ON
det.Numero = Salida.Numero
WHERE Salida.Fecha BETWEEN '01-08-2023' AND '31-08-2023'
AND det.Valor <> 0
AND Salida.Estado = 0
AND Salida.Cliente != '50847935-9'
ORDER BY Fecha;