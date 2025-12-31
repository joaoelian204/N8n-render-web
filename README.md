# n8n en Render con Supabase

Proyecto de n8n desplegado en Render utilizando PostgreSQL de Supabase como base de datos.

## 🚀 Características

- ✅ n8n última versión
- ✅ Base de datos PostgreSQL (Supabase)
- ✅ Conexión IPv4 compatible usando Transaction Pooler
- ✅ Datos persistentes
- ✅ Configuración lista para Render
- ✅ Docker containerizado

## 📋 Requisitos

- Cuenta en [Render.com](https://render.com)
- Cuenta en [Supabase](https://supabase.com)
- Docker (para desarrollo local)
- Git

## 🛠️ Instalación Local

### 1. Clonar el repositorio

```bash
git clone https://github.com/joaoelian204/n8n-render.git
cd n8n-render
```

### 2. Configurar variables de entorno

Crea un archivo `.env` con tus credenciales de Supabase:

```env
# Supabase credenciales (Transaction Pooler - IPv4 compatible)
SUPABASE_HOST=aws-1-us-east-1.pooler.supabase.com
SUPABASE_PORT=6543
SUPABASE_DB=postgres
SUPABASE_USER=postgres.TU_PROJECT_ID
SUPABASE_PASSWORD=tu_password

#Timezone
GENERIC_TIMEZONE=America/Guayaquil
TZ=America/Guayaquil
```

### 3. Obtener credenciales de Supabase

1. Ve a tu proyecto en [Supabase Dashboard](https://supabase.com/dashboard)
2. Ve a **Settings** → **Database**
3. En **Connection string**, selecciona el modo **Transaction**
4. Copia los parámetros:
   - Host: `aws-1-us-east-1.pooler.supabase.com`
   - Port: `6543`
   - User: `postgres.tu_project_id`
   - Password: tu contraseña de base de datos

> ⚠️ **Importante**: Usa el **Transaction Pooler** ya que tiene soporte IPv4 gratuito.

### 4. Iniciar n8n localmente

```bash
docker-compose up -d
```

### 5. Acceder a n8n

Abre tu navegador en: http://localhost:5678

## 🌐 Desplegar en Render

### Opción 1: Usando render.yaml (Recomendado)

1. Ve a [Render Dashboard](https://dashboard.render.com/)
2. Haz clic en **"New +"** → **"Blueprint"**
3. Conecta este repositorio
4. Render detectará automáticamente el `render.yaml`
5. Agrega las variables de entorno manualmente:
   - `DB_POSTGRESDB_HOST`
   - `DB_POSTGRESDB_PORT`
   - `DB_POSTGRESDB_DATABASE`
   - `DB_POSTGRESDB_USER`
   - `DB_POSTGRESDB_PASSWORD`

### Opción 2: Manualmente

1. Ve a [Render Dashboard](https://dashboard.render.com/)
2. Haz clic en **"New +"** → **"Web Service"**
3. Conecta este repositorio
4. Configuración:

   - **Name**: `n8n-render`
   - **Region**: Elige la más cercana
   - **Branch**: `main`
   - **Runtime**: Docker
   - **Plan**: Free (o el que prefieras)

5. Agrega las variables de entorno (ver sección anterior)
6. Haz clic en **"Create Web Service"**

### Variables de Entorno en Render

Añade estas variables en la configuración del servicio:

```
DB_POSTGRESDB_HOST = aws-1-us-east-1.pooler.supabase.com
DB_POSTGRESDB_PORT = 6543
DB_POSTGRESDB_DATABASE = postgres
DB_POSTGRESDB_USER = postgres.TU_PROJECT_ID
DB_POSTGRESDB_PASSWORD = tu_password
```

## 📁 Estructura del Proyecto

```
n8n-render/
├── .gitignore              # Archivos ignorados por git
├── docker-compose.yml      # Configuración para desarrollo local
├── Dockerfile              # Imagen de Docker para n8n
├── render.yaml             # Configuración para Render
├── .env                    # Variables de entorno (NO subir a git)
└── README.md               # Este archivo
```

## 🔧 Comandos Útiles

### Desarrollo Local

```bash
# Iniciar n8n
docker-compose up -d

# Ver logs
docker-compose logs -f n8n

# Detener n8n
docker-compose down

# Reiniciar n8n
docker-compose restart

# Ver estado de contenedores
docker-compose ps
```

## 🐛 Solución de Problemas

### Error: "getaddrinfo ENOTFOUND"

- **Causa**: Problema de conexión a Supabase
- **Solución**: Asegúrate de usar el Transaction Pooler (puerto 6543) en lugar de la conexión directa

### Error: "Tenant or user not found"

- **Causa**: Usuario incorrecto
- **Solución**: El usuario debe tener el formato `postgres.tu_project_id` cuando usas el pooler

### Error: "No es compatible con IPv4"

- **Causa**: Estás usando la conexión directa que solo tiene IPv6
- **Solución**: Usa el Transaction Pooler de Supabase (gratis y con IPv4)

### n8n no se conecta a Supabase

1. Verifica que tu proyecto de Supabase esté activo (no pausado)
2. Confirma que la contraseña sea correcta
3. Usa el Transaction Pooler en lugar de la conexión directa
4. Verifica que los puertos y host sean correctos

## 📝 Notas Importantes

- ⚠️ **Nunca subas el archivo `.env` a GitHub** - Contiene credenciales sensibles
- 🔒 El archivo `.gitignore` ya está configurado para proteger información sensible
- 💾 Los datos de n8n se guardan en Supabase, no se pierden al reiniciar
- 🆓 El plan gratuito de Render duerme después de 15 minutos de inactividad
- 📊 Supabase tiene límites en el plan gratuito (500 MB de base de datos)

## 🔗 Enlaces Útiles

- [Documentación de n8n](https://docs.n8n.io/)
- [Render Docs](https://render.com/docs)
- [Supabase Docs](https://supabase.com/docs)
- [n8n Community](https://community.n8n.io/)

## 📄 Licencia

Este proyecto usa n8n, que tiene su propia licencia. Consulta la [licencia de n8n](https://github.com/n8n-io/n8n/blob/master/LICENSE.md) para más detalles.

## 👤 Autor

**Joao Elian**

- GitHub: [@joaoelian204](https://github.com/joaoelian204)

---

⭐ Si te ha sido útil este proyecto, dale una estrella en GitHub!
