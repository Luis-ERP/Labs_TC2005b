/*
REFERENCIA:
Materiales(Clave, Descripción, Costo, PorcentajeImpuesto)
Proveedores(RFC, RazonSocial)
Proyectos(Numero, Denominacion)
Entregan(Clave, RFC, Numero, Fecha, Cantidad)
*/

--La suma de las cantidades e importe total de todas las entregas realizadas durante el 97. 
select sum(Cantidad) as 'total unidades'
from entregan E, materiales M
where E.clave = M.clave

--Para cada proveedor, obtener la razón social del proveedor, número de entregas e importe total de las entregas realizadas
select P.RazonSocial, count(E.clave) as 'total entregas', sum(E.cantidad*M.costo) as 'importe total'
from proveedores P, entregan E, materiales M
where P.RFC = E.RFC
group by P.RazonSocial

--Por cada material obtener la clave y descripción del material, la cantidad total entregada, la mínima cantidad entregada, la máxima cantidad entregada, 
--el importe total de las entregas de aquellos materiales en los que la cantidad promedio entregada sea mayor a 400.
select M.clave, M.descripcion, sum(E.cantidad) as 'cantidad total', min(E.cantidad) as 'minima cantidad', max(E.cantidad) as 'maxima cantidad', 
sum(E.cantidad*M.costo) as 'importe total', avg(cantidad) as 'promedio' 
from Materiales M, entregan E
where M.clave= E.clave
group by M.clave, M.descripcion having avg(cantidad) > 400

--Para cada proveedor, indicar su razón social y mostrar la cantidad promedio de cada material entregado, detallando la clave y descripción del material, 
--excluyendo aquellos proveedores para los que la cantidad promedio sea menor a 500.
select P.RazonSocial, M.clave, M.descripcion, avg(E.cantidad) as 'promedio'
from proveedores P, materiales M, entregan E
where M.clave= E.clave and P.RFC = E.RFC
group by P.RazonSocial, M.clave, M.descripcion
having avg(cantidad) > 500

--Mostrar en una solo consulta los mismos datos que en la consulta anterior pero para dos grupos de proveedores: 
--aquellos para los que la cantidad promedio entregada es menor a 370 y aquellos para los que la cantidad promedio entregada sea mayor a 450. 
select P.RazonSocial, M.clave, M.descripcion, avg(E.cantidad) as 'promedio'
from proveedores P, materiales M, entregan E
where M.clave= E.clave and P.RFC = E.RFC
group by P.RazonSocial, M.clave, M.descripcion
having avg(cantidad) > 450 or avg(cantidad) < 370
order by 'promedio' desc

--Clave y descripción de los materiales que nunca han sido entregados.
(select clave, descripcion 
from materiales)
except
(select M.clave, M.descripcion 
from materiales M, entregan E
where M.clave = E.clave)

select clave, descripcion from Materiales
where clave not in(
select clave from entregan)

--Razón social de los proveedores que han realizado entregas tanto al proyecto 'Vamos México' como al proyecto 'Querétaro Limpio'.
select distinct P.RazonSocial
from proveedores P, entregan E, proyectos Pr
where E.numero = Pr.numero and P.RFC = E.RFC and Pr.denominacion = 'Vamos Mexico' or  Pr.denominacion = 'Queretaro limpio'

--Descripción de los materiales que nunca han sido entregados al proyecto 'CIT Yucatán'.
(select descripcion
from Materiales)
except
(select M.descripcion
from Materiales M, Entregan E, Proyectos P
where M.clave=E.clave and P.numero=E.numero and P.Denominacion = 'CIT Yucatan')

--Razón social y promedio de cantidad entregada de los proveedores cuyo promedio de cantidad entregada es mayor al promedio de la cantidad entregada por el proveedor 
--con el RFC 'AAAA800101'.
select P.RazonSocial, avg(E.cantidad) as 'promedio de cantidad'
from proveedores P, entregan E
where P.RFC = E.RFC
group by RazonSocial 
having avg(E.Cantidad) > (select avg(E.cantidad) from Proveedores P, Entregan E where P.RFC = E.RFC and P.RFC = 'AAAA800101') 

--RFC, razón social de los proveedores que participaron en el proyecto 'Infonavit Durango' y cuyas cantidades totales entregadas en el 2000 
--fueron menores a las cantidades totales entregadas en el 2001. 
select Pro.RFC, Pro.RazonSocial
from Proveedores Pro, Proyectos P, Entregan E
where Pro.RFC = E.RFC and P.numero = E.numero and P.Denominacion = 'Infonavit Durango' and E.fecha between '01-JAN-2000' and '31-DEC-2000'
group by Pro.RFC, Pro.RazonSocial
having sum(E.cantidad) < (select sum(cantidad) from entregan E, Proyectos P 
where E.numero=P.numero and P.denominacion  = 'Infonavit Durango' and E.fecha between '01-JAN-2001' and '31-DEC-2001')