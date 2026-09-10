FROM node:20-slim

WORKDIR /app

# Copie les fichiers de dépendances (ici juste package.json, pas de deps externes)
COPY package.json ./

# Pas de dépendances à installer, mais on garde la ligne au cas où
RUN npm install --omit=dev || true

# Copie le reste du code
COPY . .

# Bonne pratique : ne pas tourner en root (vu dans ton cours !)
USER node

EXPOSE 8080

CMD ["node", "src/app.js"]