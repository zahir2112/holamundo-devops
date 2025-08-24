# Imagen ligera de Node
FROM node:20-alpine

# Carpeta de trabajo
WORKDIR /app

# Instalar dependencias (aprovechar layer cache)
COPY package*.json ./
RUN npm ci --omit=dev

# Copiar el resto del código
COPY . .

# Config
ENV PORT=3000
EXPOSE 3000

# Healthcheck simple (opcional)
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost:3000/ || exit 1

# Comando
CMD ["node", "index.js"]
