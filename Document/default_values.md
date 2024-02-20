
# Uso de Valores Predeterminados en el Diseño de Tablas

El uso de valores predeterminados (`default values`) en el diseño de tablas de base de datos es crucial para facilitar la inserción de datos, asegurando la consistencia y automatizando la asignación de valores comunes.

&nbsp;
## Escenarios Adecuados

- **Valores Iniciales Comunes**: Asignar un valor común a la mayoría de las filas de una columna, como un estado inicial en pedidos.
- **Marcas de Tiempo**: Registrar automáticamente la fecha y hora de creación de las filas.
- **Configuraciones por Defecto**: Definir configuraciones o preferencias comunes entre usuarios, como un idioma predeterminado.
- **Valores de Llave Externa para Categorización**: Establecer una categoría predeterminada para nuevas entradas.
- **Indicadores de Estado**: Indicar un estado activo o inactivo por defecto en nuevas filas.

&nbsp;
## Ejemplos de Implementación

### Enteros y Numéricos
```sql
CREATE TABLE Users (
    UserID int NOT NULL,
    LoginAttempts int DEFAULT 0
);
```

### Cadenas de Texto
```sql
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderStatus varchar(50) DEFAULT 'Nuevo'
);
```

### Fecha y Hora
```sql
CREATE TABLE Posts (
    PostID int NOT NULL,
    CreatedAt datetime DEFAULT GETDATE()
);
```

### Booleanos (Bit)
```sql
CREATE TABLE Accounts (
    AccountID int NOT NULL,
    IsActive bit DEFAULT 1
);
```

### Valores UUID
```sql
CREATE TABLE UniqueItems (
    ItemID uniqueidentifier DEFAULT NEWID(),
    ItemName varchar(255)
);
```

### Configuraciones por Defecto
```sql
CREATE TABLE UserPreferences (
    UserID int NOT NULL,
    Language varchar(50) DEFAULT 'English'
);
```

Los valores predeterminados son fundamentales para el diseño eficiente de bases de datos, mejorando la inserción de datos y manteniendo la integridad y consistencia de la base de datos.