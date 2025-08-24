# Hola Mundo DevOps – CI/CD con GitHub Actions, Docker y Render

Proyecto de ejemplo para tu **Práctica Final DevOps**. Incluye:
- App web "Hola Mundo" en **Node.js + Express**.
- **Prueba unitaria** con Jest y Supertest.
- **Dockerfile** listo para producción.
- **GitHub Actions** para CI/CD:
  - Instala dependencias
  - Ejecuta pruebas
  - Construye y **sube la imagen a Docker Hub**
  - Dispara **deploy en Render** mediante Deploy Hook (opcional)

## 1) Requisitos
- Node.js 20+ y npm
- Docker + cuenta en Docker Hub
- Cuenta en GitHub
- (Opcional) Cuenta en Render.com

## 2) Ejecutar localmente
```bash
npm ci
npm test
npm start
# App en http://localhost:3000
```

## 3) Construir y correr con Docker
```bash
docker build -t holamundo-devops:local .
docker run -p 3000:3000 holamundo-devops:local
# http://localhost:3000
```

## 4) Crear repositorio en GitHub
1. Crea un repo público vacío en tu cuenta (por ejemplo: `holamundo-devops`).
2. Sube este código:
```bash
git init
git branch -M main
git remote add origin https://github.com/<TU_USUARIO>/<TU_REPO>.git
git add .
git commit -m "Init: Hola Mundo DevOps CI/CD"
git push -u origin main
```

## 5) Configurar Docker Hub (imagen pública)
1. Crea un **Access Token** en Docker Hub: **Account Settings → Security → New Access Token**.
2. En el repo de GitHub ve a **Settings → Secrets and variables → Actions → New repository secret** y crea:
   - `DOCKERHUB_USERNAME` → tu usuario de Docker Hub
   - `DOCKERHUB_TOKEN` → el access token creado

> La imagen se publicará como: `docker.io/<DOCKERHUB_USERNAME>/devops-hola-mundo:latest`

## 6) (Opcional) Configurar Render Deploy Hook
1. Crea un servicio Web en **Render** conectado a tu repositorio de GitHub.
2. En **Settings** del servicio, copia tu **Deploy Hook** (URL).
3. Crea en GitHub un secret adicional:
   - `RENDER_DEPLOY_HOOK_URL` → pega la URL del deploy hook
4. El pipeline hará `curl` a esa URL tras publicar la imagen y pasar tests.

## 7) Flujo de CI/CD
- Cada **push** o **PR** ejecuta: `npm ci` y **tests**.
- En **push a main**:
  - **Login** a Docker Hub
  - **Build & push** de la imagen (`latest` y `<git-sha>`)
  - **Deploy** en Render (si `RENDER_DEPLOY_HOOK_URL` está configurado)

## 8) Entregables para tu práctica
- **Enlace del repositorio público** (GitHub).
- **URL pública de la app en producción** (Render u otro servicio).
- **URL de la imagen en Docker Hub** *(opcional para mostrar)*.

---

### Estructura
```
.
├─ index.js
├─ app.test.js
├─ package.json
├─ package-lock.json   # (se genera al hacer npm ci/npm install)
├─ Dockerfile
├─ .dockerignore
├─ .github/
│  └─ workflows/
│     └─ ci-cd.yml
└─ README.md
```

¡Éxitos! 🚀
