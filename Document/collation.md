# Collation

El "Collation" o intercalación en SQL se refiere al conjunto de reglas que determina cómo se comparan y ordenan las cadenas de caracteres en una base de datos. La configuración de intercalación afecta a la forma en que se realizan las operaciones de comparación de cadenas, ordenación y búsqueda dentro de una base de datos. Es crucial para el soporte de idiomas internacionales y la correcta comparación de caracteres en diferentes idiomas, considerando aspectos como mayúsculas y minúsculas, acentos, y caracteres especiales.


## Niveles

- Nivel de Servidor: Define la intercalación predeterminada para el servidor de base de datos. Esta configuración se aplica a todas las bases de datos y tablas creadas en el servidor, a menos que se especifique de otra manera.

- Nivel de Base de Datos: Específica la intercalación para una base de datos individual. Esta configuración predetermina la intercalación para todas las tablas y columnas dentro de la base de datos, a menos que se indique una configuración diferente a nivel de columna o expresión.

- Nivel de Columna: Define la intercalación para una columna específica dentro de una tabla. Esta configuración permite que diferentes columnas en la misma tabla tengan diferentes reglas de intercalación, lo que es útil para datos que requieren diferentes consideraciones lingüísticas.

- Nivel de Expresión: Permite especificar una intercalación para una operación de comparación específica dentro de una consulta SQL. Esto ofrece flexibilidad para realizar comparaciones usando diferentes reglas de intercalación en el contexto de una sola consulta.


&nbsp;
| Abreviatura | Significado            | Descripción                                                                                         |
|-------------|------------------------|-----------------------------------------------------------------------------------------------------|
| CI          | Case Insensitive       | No distingue entre mayúsculas y minúsculas.                                                         |
| CS          | Case Sensitive         | Distingue entre mayúsculas y minúsculas.                                                            |
| AS          | Accent Sensitive       | Distingue entre caracteres con y sin acentos.                                                      |
| AI          | Accent Insensitive     | No distingue entre caracteres con y sin acentos.                                                   |
| BIN         | Binary                 | Compara cadenas de caracteres según el orden binario de los bytes.                                  |
| BIN2        | Binary - Version 2     | Versión más reciente de la comparación binaria que respeta la clasificación Unicode completa.      |
| KS          | Kana Sensitive         | Distingue entre caracteres kana japoneses Hiragana y Katakana.                                      |
| WS          | Width Sensitive        | Distingue entre caracteres de ancho simple y doble (por ejemplo, espacios en blanco de diferentes anchuras). |
| KI          | Kana Insensitive       | No distingue entre caracteres kana japoneses Hiragana y Katakana.                                   |
| WI          | Width Insensitive      | No distingue entre caracteres de ancho simple y doble.                                              |

&nbsp;
## Comandos
&nbsp;
### Ver Collation
```sql
USE smcdb1
SELECT name, collation_name FROM sys.databases WHERE name = 'smcdb1';
```

### Collation a nivel Expresión
```sql
SELECT *
FROM smcdb1.dbo.Test AS testDb01
JOIN smcdb2.dbo.Test AS testDb02
ON testDb01.code COLLATE Latin1_General_CI_AS = testDb02.code COLLATE Latin1_General_CI_AS;
```