# Test Falabella python dev
## Prueba practica de SQL:
### según el script adjunto “creación tablas” con el que se crean las tablas para un sistema de facturación Indique y conteste::


###  1.	¿Cuáles son las llaves primarias y las llaves foráneas? *
- Llaves Primarias (Primary Keys):
1.	En la tabla KME_PRODUCTO, la llave primaria es IDPRODUCTO.
2.	En la tabla KME_CLIENTE, la llave primaria es IDCLIENTE.
3.	En la tabla KME_EMPRESA, la llave primaria es NIT.
4.	En la tabla KME_VENDEDOR, la llave primaria es IDVENDEDOR.
5.	En la tabla KME_FACTURA, la llave primaria es IDFACTURA.
6.	En la tabla DETALLE_FACTURA_PRODUCTO, la llave primaria es IDDETALLE.
- Llaves Foráneas (Foreign Keys):
1.	En la tabla KME_VENDEDOR, la llave foránea NIT hace referencia a la columna NIT en la tabla KME_EMPRESA.
2.	En la tabla KME_FACTURA, las llaves foráneas IDCLIENTE, IDVENDEDOR, y NIT hacen referencia a las columnas IDCLIENTE, IDVENDEDOR, y NIT en las tablas KME_CLIENTE, KME_VENDEDOR, y KME_EMPRESA, respectivamente.
3.	En la tabla DETALLE_FACTURA_PRODUCTO, las llaves foráneas IDFACTURA e IDPRODUCTO hacen referencia a las columnas IDFACTURA e IDPRODUCTO en las tablas KME_FACTURA y KME_PRODUCTO, respectivamente.


### 2.	¿Como se podría encontrar el vendedor con mayor monto de ventas? *

 ```
SELECT
    v.IDVENDEDOR,
    v.NOMBRE AS NOMBRE_VENDEDOR,
    SUM(p.PRECIO * dfp.CANTIDAD) AS MONTO_VENTAS`
  FROM
      falabella_test.KME_VENDEDOR v
  JOIN
      falabella_test.KME_FACTURA f ON v.IDVENDEDOR = f.IDVENDEDOR
  JOIN
      falabella_test.DETALLE_FACTURA_PRODUCTO dfp ON f.IDFACTURA = dfp.IDFACTURA
  JOIN
      falabella_test.KME_PRODUCTO p ON dfp.IDPRODUCTO = p.IDPRODUCTO
  GROUP BY
      v.IDVENDEDOR, v.NOMBRE
  ORDER BY
      MONTO_VENTAS DESC
  LIMIT 1

  ```
- Esta consulta une las tablas relevantes, calcula el monto total de ventas para cada vendedor sumando el precio de los productos vendidos en todas las facturas, agrupa por vendedor y luego ordena los resultados en orden descendente según el monto total de ventas. La cláusula LIMIT 1 asegura que solo se devuelva el vendedor con el monto de ventas más alto.


### 3.	Listar todos los clientes cuyo nombre contenga la letra A:.

`SELECT * FROM falabella_test.KME_CLIENTE WHERE NOMBRE LIKE '%A%';`

###  4. ¿Cuál es el valor promedio de los productos?

 `SELECT AVG(PRECIO) AS VALOR_PROMEDIO_PRODUCTOS`
 `FROM falabella_test.KME_PRODUCTO;`


### 5. ¿Cuál es la fecha de la primera venta, última venta, y el conteo total de ventas? 

- Observaciones:  Se genera una factura por cada tipo de producto, pero la cantidad puede ser 1 o más unidades.

- Fecha de la primera venta:
`SELECT MIN(FECHA) AS FECHA_PRIMERA_VENTA FROM falabella_test.KME_FACTURA;`

- Fecha de la última venta:
`SELECT MAX(FECHA) AS FECHA_ULTIMA_VENTA FROM KME_FACTURA;`

- Conteo total de ventas:
`SELECT COUNT(*) AS TOTAL_VENTAS FROM KME_FACTURA;`

- EEstas consultas te proporcionarán la fecha de la primera venta, la última venta y el conteo total de ventas basadas en la tabla KME_FACTURA.


### Prueba de Desarrollo
- Por medio de Visual Basic o Python (preferiblemente). Generar un pequeño programa que permita automatizar el cruce de la información de los dos archivos de Excel adjuntos. Una vez se realice el cruce, debe permitir realizar la descarga del archivo final. Tener en cuenta que un archivo contiene información general y otro las notas asociadas.
Plus: Ya sea en el archivo descargado o en la interfaz del programa desarrollado, mostrar un pequeño gráfico o tabla dinámica, con la información que considere relevante para dar una conclusión de los datos.
