# TTPS-Ruby-2017 - Trabajo Integrador.

## Preparación del ambiente

### Asegurarse de tener instalado:
- Docker Compose
- Ruby
- PostgreSQL
- Gema Bundler
- Git

### Pasos a seguir:

1. Navegar en consola hasta la carpeta del proyecto.
2. Clonar este repositorio.
3. Ejecutar ` docker-compose build `.
4. Levantar el proyecto usando ` docker-compose up -d `.
5. Cargar la información a la base de datos usando ` docker-compose exec web rails db:setup `.
6. Ingresar a ` localhost:3000 `.
7. Acceder al sistema con email 'admin@admin.com' y contraseña: '123456'.

### Para correr los test:

1. Ejecutar ` docker-compose exec web rails test `.

### Para finalizar:

1. Ejecutar ` docker-compose down `.
