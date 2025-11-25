-- Esquem para auth-service (Microservicio de Autenticación)
-- Tabla de Usuarios
CREATE TABLE "Users" (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(), -- ID Único generado automáticamente
    email VARCHAR(100) UNIQUE NOT NULL,                -- Correo Único para Login
    password_hash VARCHAR(255) NOT NULL,               -- Contraseña cifrada (bcrypt)
    first_name VARCHAR(50) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'ADMIN',         -- Rol de usuario (ADMIN, VENDEDOR, etc.)
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
);


-- Esquem para catalog-service (Microservicio de Catálogo)
-- Tabla de Productos
CREATE TABLE "Products" (
    product_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sku VARCHAR(50) UNIQUE NOT NULL,                   -- Código único de producto
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,                     -- Precio con dos decimales
    is_active BOOLEAN NOT NULL DEFAULT TRUE,           -- true: visible en la vitrina
    image_url VARCHAR(255),
    created_by_user_id UUID,                           -- Para auditoría (Relación indirecta con Users)
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
    -- NOTE: La relación con la tabla Users es indirecta para mantener los microservicios desacoplados
);

