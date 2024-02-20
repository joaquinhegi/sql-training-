# Tipo de Datos
&nbsp;

## Numéricos Exactos

| Tipo de Dato | Bytes | Rango | Recomendaciones de Uso |
|--------------|-------|-------|------------------------|
| `bit`        | 0.125 (1 bit) | 0 a 1 | Preferir para almacenar valores booleanos o flags. |
| `tinyint`    | 1     | 0 a 255 | Óptimo para números enteros pequeños, maximiza el ahorro de espacio. |
| `smallint`   | 2     | -32,768 a 32,767 | Elegir para números enteros con un rango menor, cuando el ahorro de espacio es importante. |
| `int`        | 4     | -2,147,483,648 a 2,147,483,647 | El tipo estándar para números enteros en la mayoría de las situaciones. |
| `bigint`     | 8     | -2^63 a 2^63-1 | Utilizar para números enteros muy grandes que superen el rango de `int`. |
| `numeric`    | Variable | -10^38 +1 a 10^38 -1 | Usar para valores decimales precisos donde se requiere especificar la precisión y escala. |
| `decimal`    | Variable | -10^38 +1 a 10^38 -1 | Similar a `numeric`, utilizar cuando se necesitan cálculos decimales de alta precisión. |
| `smallmoney` | 4     | -214,748.3648 a 214,748.3647 | Para representar cantidades monetarias menores con 4 dígitos decimales. |
| `money`      | 8     | -922,337,203,685,477.5808 a 922,337,203,685,477.5807 | Para cantidades monetarias mayores, usar cuando se requieren 4 dígitos decimales. |

Los tipos numéricos exactos de Transact-SQL ofrecen una gran flexibilidad para manejar datos numéricos con precisión. La elección entre ellos depende del rango de datos que necesitas almacenar, si requieres precisión decimal y consideraciones de almacenamiento.

&nbsp;
## Numéricos Aproximados

| Tipo de Dato | Bytes | Rango | Recomendaciones de Uso |
|--------------|-------|-------|------------------------|
| `real`       | 4     | -3.40E+38 a 3.40E+38 (con precisión de 7 dígitos) | Preferir para números reales cuando se puede tolerar menor precisión. Esencialmente una versión menos precisa y más pequeña de `float`. |
| `float`      | 4 u 8 | -1.79E+308 a 1.79E+308 (con precisión de 15 dígitos) | Utilizar para números reales con necesidad de gran precisión. La cantidad de bytes depende de la precisión especificada (`float(24)` usa 4 bytes, más de eso usa 8 bytes). |

Los tipos numéricos aproximados son útiles para cálculos científicos o cuando se trabaja con números muy grandes o muy pequeños que no requieren precisión exacta. La elección entre `float` y `real` depende del equilibrio entre precisión y eficiencia de almacenamiento.

&nbsp;
## Fecha y Hora

| Tipo de Dato     | Almacenamiento | Rango | Precisión | Recomendaciones de Uso |
|------------------|----------------|-------|-----------|------------------------|
| `date`           | 3 bytes        | 0001-01-01 a 9999-12-31 | 1 día | Utilizar cuando solo se necesita almacenar la fecha sin la hora. |
| `smalldatetime`  | 4 bytes        | 1900-01-01 a 2079-06-06 | 1 minuto | Menor rango y precisión. Adecuado para aplicaciones con requisitos menos estrictos. |
| `time`           | 3 a 5 bytes    | 00:00:00.0000000 a 23:59:59.9999999 | 100 nanosegundos | Ideal para almacenar solo la hora del día con precisión hasta los nanosegundos. |
| `datetime2`      | 6 a 8 bytes    | 0001-01-01 a 9999-12-31 | 100 nanosegundos | Ofrece mayor rango y precisión que `datetime`. Usar cuando se necesitan estas características. Recomendado para nuevos proyectos |
| `datetime`       | 8 bytes        | 1753-01-01 a 9999-12-31 | 3.33 milisegundos | Tradicionalmente utilizado para fecha y hora. `datetime2` es generalmente preferible por su mayor precisión. Deprecado|
| `datetimeoffset` | 8 a 10 bytes   | 0001-01-01 a 9999-12-31 | 100 nanosegundos | Para fecha y hora con información de zona horaria. Útil en aplicaciones distribuidas globalmente. |


La elección del tipo de datos adecuado para fecha y hora depende del rango y la precisión requeridos, así como de si se necesita almacenar información de la zona horaria.

&nbsp;
## Cadenas de Caracteres

| Tipo de Dato | Almacenamiento | Descripción | Recomendaciones de Uso |
|--------------|----------------|-------------|------------------------|
| `char(n)`    | n bytes        | Cadenas de caracteres de longitud fija. | Utilizar para almacenar cadenas de longitud constante para mejorar el rendimiento de búsqueda. |
| `varchar(n)` | Variable hasta n+2 bytes | Cadenas de caracteres de longitud variable. | Preferir para cadenas de longitud variable para ahorrar espacio. |

La elección entre `char` y `varchar` depende de si la longitud de la cadena se mantiene constante o varía significativamente. 


### Usar `CHAR` cuando:
- **La longitud de los datos es consistente:** `CHAR` es ideal para datos que tienen una longitud fija, como códigos postales, números de teléfono (sin considerar códigos de país variables), identificadores de tamaño fijo, etc. Al ser de longitud fija, el espacio de almacenamiento requerido para CHAR es predecible, y SQL Server puede optimizar el acceso a estos datos.

- **Rendimiento de lectura optimizado:** Para columnas que serán leídas frecuentemente y cuyos valores tienen una longitud fija o varían poco en longitud, `CHAR` puede ofrecer un mejor rendimiento porque el espacio de almacenamiento es uniforme, lo que facilita la estimación de página y la localización de datos.

### Usar `VARCHAR` cuando:

- **La longitud de los datos varía significativamente:** `VARCHAR` es más adecuado para datos cuya longitud puede variar mucho, como nombres, direcciones de correo electrónico, descripciones, etc. Al usar `VARCHAR`, solo se almacena la cantidad de datos realmente utilizada (más 2 bytes para la longitud), lo que puede ahorrar una cantidad significativa de espacio, especialmente en columnas con variaciones grandes en la longitud de sus datos.

- **Ahorro de espacio:** Si el espacio de almacenamiento es una consideración importante, `VARCHAR` es a menudo la mejor elección, ya que no reserva espacio para la longitud máxima si no se utiliza. Esto es especialmente relevante en bases de datos grandes con millones de filas.

- **Flexibilidad:** Para textos o cadenas que pueden exceder los límites de longitud previsibles o cuando no puedes garantizar una longitud fija para todos los registros.

### Consideraciones Adicionales:

- **Rendimiento:** Aunque `CHAR` puede ser más rápido para leer debido a su naturaleza de longitud fija, `VARCHAR` puede ser más eficiente en términos de almacenamiento. Sin embargo, este beneficio de rendimiento de `CHAR` se reduce o se neutraliza cuando las cadenas no ocupan la totalidad del espacio reservado.

- **Fragmentación y rendimiento de escritura:** Las actualizaciones que cambian la longitud de una columna `VARCHAR` pueden causar fragmentación de la base de datos más rápidamente que las columnas `CHAR`.

En resumen, usa `CHAR` para datos de longitud fija para maximizar el rendimiento en escenarios de lectura intensiva y considera `VARCHAR` para la mayoría de los otros casos, especialmente cuando los datos varían en longitud o cuando el almacenamiento es una preocupación.

&nbsp;
## Cadenas de Caracteres Unicode
| Tipo de Dato | Almacenamiento | Descripción | Recomendaciones de Uso |
|--------------|----------------|-------------|------------------------|
| `nchar(n)`   | 2n bytes       | Cadenas de caracteres Unicode de longitud fija. | Utilizar para almacenar cadenas de longitud constante que requieran soporte Unicode. Ideal para datos que no varían en tamaño, como códigos de país o identificadores de tamaño fijo. |
| `nvarchar(n)`| Variable, hasta 2n+2 bytes | Cadenas de caracteres Unicode de longitud variable. | Preferir para cadenas de longitud variable que requieran soporte Unicode. Adecuado para texto que puede variar en longitud, como nombres, direcciones de correo electrónico, y descripciones de productos. |

La elección entre `nchar` y `nvarchar` depende de si la longitud de la cadena se mantiene constante o varía significativamente. 


###  Usar `NCHAR` cuando:

- **La longitud de los datos es consistente:** `NCHAR` es adecuado para datos de longitud fija que necesitan soportar caracteres Unicode, como nombres propios, códigos de país, y otros tipos de datos que tienen una longitud predecible. Al ser de longitud fija, `NCHAR` reserva espacio para la cantidad máxima de caracteres definida, independientemente de la longitud de los datos realmente almacenados.

- **Rendimiento de lectura:** Para columnas que serán leídas frecuentemente y cuyos valores son de longitud fija o varían poco, `NCHAR` puede ofrecer un acceso más rápido debido a la predictibilidad de su almacenamiento.


### Usar `NVARCHAR` cuando:

- **La longitud de los datos varía:** `NVARCHAR` es la opción preferida para datos de longitud variable que deben soportar caracteres Unicode. Es ideal para almacenar información como comentarios, direcciones de correo electrónico, descripciones de productos, y cualquier otro dato textual que pueda variar significativamente en tamaño.

- **Ahorro de espacio:** Dado que `NVARCHAR` solo utiliza el espacio necesario para almacenar los datos reales (más 2 bytes para la longitud), ayuda a ahorrar espacio en comparación con NCHAR, lo que puede ser crítico en bases de datos grandes.

- F**lexibilidad y escalabilidad:** NVARCHAR permite adaptarse a diferentes longitudes de datos, lo que lo hace más versátil para el desarrollo de aplicaciones internacionales que manejan múltiples idiomas.

&nbsp;
## Cadenas Binarias

| Tipo de Dato | Almacenamiento | Descripción | Recomendaciones de Uso |
|--------------|----------------|-------------|------------------------|
| `binary(n)`  | n bytes        | Datos binarios de longitud fija. | Utilizar para almacenar datos binarios que no cambian de tamaño, como hashes o claves de cifrado fijas. |
| `varbinary(n)` | Variable, hasta n bytes | Datos binarios de longitud variable. | Preferir para datos binarios que pueden variar en tamaño, como archivos o imágenes que se almacenan directamente en la base de datos. |
| `image`      | Variable, hasta 2^31 - 1 bytes | Tipo de datos obsoleto para almacenar grandes datos binarios. | Evitar en nuevos desarrollos. Usar `varbinary(max)` para almacenar grandes volúmenes de datos binarios. |

La elección entre `binary` y `varbinary` depende del tamaño de los datos binarios que necesitas almacenar. `image` está obsoleto y se recomienda usar `varbinary(max)` para una mayor flexibilidad y para aprovechar las mejoras de rendimiento y funcionalidad.

### Binary
- **Longitud Fija:** binary(n) almacena datos binarios con una longitud fija de n bytes. Si el tamaño de los datos es menor que n, el sistema rellena el resto con ceros (bytes nulos) hasta alcanzar la longitud definida. Esto significa que el espacio de almacenamiento utilizado será siempre de n bytes, independientemente de la longitud real de los datos.

### varbinary
- **Longitud Variable:** varbinary(n) permite almacenar datos binarios con una longitud variable hasta un máximo de n bytes. Si los datos son más cortos que n, solo se almacenan los bytes necesarios para representar los datos, sin relleno adicional. Esto hace que varbinary sea más eficiente en términos de almacenamiento para datos binarios de tamaño variable.

- **varbinary(max):** Una variante especial de varbinary que puede almacenar grandes volúmenes de datos binarios, hasta aproximadamente 2 GB. Esta opción es recomendable para datos binarios que exceden los tamaños típicos o cuando se desea almacenar archivos grandes directamente en la base de datos.

### Consideraciones Adicionales

- **Rendimiento:** El rendimiento de acceso puede variar entre binary y varbinary dependiendo de la situación. binary puede ofrecer un rendimiento ligeramente mejor en ciertas operaciones debido a su predictibilidad de tamaño, pero esto puede ser insignificante para muchos casos de uso.

- **Almacenamiento:** varbinary tiende a ser más eficiente en el uso del espacio de almacenamiento, especialmente para datos que varían significativamente en tamaño, ya que no utiliza espacio adicional para relleno.

&nbsp;
## Datos Especiales

| Tipo de Dato     | Descripción | Recomendaciones de Uso |
|------------------|-------------|------------------------|
| `cursor`         | Un tipo de datos de referencia que almacena referencias a resultados de consultas para su manipulación posterior. | Utilizar en procedimientos almacenados y código T-SQL donde se necesite iterar sobre los resultados de una consulta de manera secuencial. |
| `uniqueidentifier` | Almacena un identificador único global (GUID). | Adecuado para generar valores únicos a nivel de sistema, útil como clave primaria o cuando se necesita identificación única en distribuidos. |
| `sql_variant`    | Un tipo de datos que puede almacenar valores de varios tipos de datos de SQL Server, excepto `text`, `ntext`, `image`, `timestamp`, `sql_variant`, `geography`, `geometry`, `hierarchyid`, y algunos tipos de `xml`. | Usar cuando se necesite almacenar datos de diferentes tipos en una sola columna, aunque su uso puede complicar el diseño y la consulta de la base de datos. |
| `xml`            | Almacena datos XML. Puede contener documentos XML o fragmentos, y permite la indexación y consulta con XQuery. | Utilizar para almacenar y manipular datos estructurados como XML de manera eficiente, especialmente cuando se requiere interoperabilidad con sistemas o aplicaciones basadas en XML. |
| `table`          | Un tipo de datos especial que se utiliza para almacenar resultados temporales y manipular datos dentro de procedimientos almacenados, funciones definidas por el usuario, y bloques de código T-SQL. | Emplear para almacenar resultados temporales o intermedios y realizar operaciones complejas en el ámbito de una transacción o rutina T-SQL. |