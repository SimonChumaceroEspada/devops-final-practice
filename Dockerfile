# Usa una imagen base de Node.js
FROM node:16-alpine

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el package.json y el package-lock.json
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto de la aplicación
COPY . .

# Construye la aplicación
RUN npm run build

# Expone el puerto en el que la aplicación se ejecutará
EXPOSE 4173

# Comando para ejecutar la aplicación
CMD ["npm", "run", "preview", "--", "--host"]