# Build Step 1 - Create the base
FROM node:20.18-alpine AS base

ENV DISCORD_SERVER="https://discord.gg/hG6AZwZcg3"
ENV FIREBASE_API_KEY="AIzaSyCefW0mFOKNHVPqPY5EtI17gpukxARId7A"
ENV FIREBASE_APP_ID="1:602640034854:web:80c7e40ff8bbef4503cae7"
ENV FIREBASE_AUTH_DOMAIN="pokechessbr.firebaseapp.com"
ENV FIREBASE_CLIENT_EMAIL="firebase-adminsdk-ua136@pokechessbr.iam.gserviceaccount.com"
ENV FIREBASE_MESSAGING_SENDER_ID=602640034854
ENV FIREBASE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDHmbl7XPW5xyeA\ntQNMD+M/pLZgeFVsDqgAh+7MONTjkZVN2+em8g7RI+QNZvWvteP/+Ps7ud+u0vuR\npRetHRU1gTkwdsM6nywVnwHHe6CCDaRXhZoEjlXO27piI7UOj8X+1dKXbYWjHbA/\nxyJg8cD3iwzmrfuptQz0wpHQ6oJNawP7O33hp7AVqiKi/ZG7c/eXWziNsbPk8Kwa\nj1dYFKPfN9ji3XJdL59nViyKNq5cnIlQwmd6VsWkh1wRDB4Lqy4BaSCq9YqMsaUE\nKmejGj9OTkyLZ3Uotx6Y3+l2nKoBtTj7RhgztMXutat+b9N2e5rHfc3A5SIw262K\nwLBjqcnZAgMBAAECggEACD6yyU13J+LVROZZ16h/NS2Fee4aABNAoDBq+/Uwc8ct\nu2TAn30TE5yIyH86R2wbLF7SjVeb8hLH4O7a4hZTdRjqRLTMUyIopgZGlNMxEwB+\n+RjWSCcKJzfmEjTf9gwGUylbreLHbYwO+SpSEF6HjTIphEOVSER6BD7WbWurmj+S\n6tMgha/bm7UVky1noKCE5cndY+se9dXs9jbO2MSdEaie5WLcOS2BHXX96P5QIhxa\ntFa2uOujUq93/bIZDmfom0RZrkxFZdGgqF8wJlZtrSpkDft2gHngqm9AnyVvO3NI\ntxI9RgO69h2b8vxIQjW213M4Kkw2NydJlPdjJA/JaQKBgQD8BrRWnT66srmRr155\nGwMymDlvN1mN1bCZ1EEq0j0Y/AB1j2m1DEkhCquaFGivPpJHZZbvaSXZ3aYQt1B9\nO6RZjLh8BvcZmgVGqbDI3WUBdWFTBeu57i09LLyko8X9YCTEVBVEQMwB0hjGAH7W\na/3v7+e4jaJzgmCNcw2hDxqX6wKBgQDKv2fK7BPj1qzmFtCgQaVWn8QHa1D8mpTx\nKe5EH341NpkB3qW04fYVJE8lpQnzusFPxIHhvnQXyVFiUG4fQ/Pm/MXKPjhKHShP\nrrTLnSAnAEkE8SS9ehqsMYrdqAk3laCY2ewWXP81CVlKRMaBfjar5NHNkN7viCln\n8A2B8NPYSwKBgQCgY/PpG3GMh6mpmZ3aHOLQFCiZKvSHW3Nksrw2cE4J1HbGWlq/\nqe3wZUYIbOyieoPFhFWmT5iTKohBIyjKSmaxxuixpg0j8e1hpySm8J8Taoxhtebr\nETUhNZNohAHA2qsLdyeBpGswzXCOskoGU/vr8xXZUeoM8PBZlNsboO0fuQKBgBDM\nZxcjFErOYKj3vvVoOwDAYAeVVrJ3RFvu83Tlfxl9mpPTFLu19SOvTHd8AyUUliu7\nxl8j3o6R+ZJBw74HbU/4JZMqMJPDcrGXchdkv2M73NDyAe9JDKizuiO/ZnQai6He\nfHcl4WdNjP5gUGouQO1hGhkEJdSG3ZdlBll70LGdAoGBAJU17coSIzDw0dJDFyxU\n6jT9gtvHjer+K7Gdz1s1cdXRavyK6XAGmZEFsderq4Y0N1d6Qb3Q5xy8rOY76gqS\n/H4Hua45n8Q9vYlkta628SabOOozKQuounECi/bzGrYp4BYQifCrMPd1HTYX5MXn\n2tj4GXb8Q93TcStBMEGbtJvJ\n-----END PRIVATE KEY-----\n"
ENV FIREBASE_PROJECT_ID="pokechessbr"
ENV FIREBASE_STORAGE_BUCKET="pokechessbr.appspot.com"
ENV MIN_HUMAN_PLAYERS=8
ENV MONGO_URI="mongodb+srv://glauberbronzato:8OJ9nKoj1D4hiYQQ@pokecluster.ijmyo.mongodb.net/?retryWrites=true&w=majority&appName=PokeCluster"

#RUN apk add git --no-cache
#COPY ./ /usr/src/app
#WORKDIR /usr/src/app
#RUN npm install
#RUN npm run download-music
#RUN npm run assetpack

# Build Step 2 - Build the application
#FROM base AS builder
#WORKDIR /usr/src/app
#RUN npm run build

# Build Step 3 - Build a minimal production-ready image
#
# --ignore-scripts is used in the `npm install` to ignore the postinstall-script
# because in the production-ready image we do not need the sources for
# the assetpack or music assets in the isolated image for running the app.

#FROM node:20.18-alpine
#WORKDIR /usr/src/app
#COPY package*.json ./
#RUN npm install --only=production --ignore-scripts
#COPY --from=builder /usr/src/app/app/public/dist ./app/public/dist
#EXPOSE 9000
#ENTRYPOINT ["node", "app/public/dist/server/app/index.js"]

RUN apk add --no-cache git

# Crie e defina o diretório de trabalho no container

# Copie o package.json e o package-lock.json para o container
#COPY package*.json ./

# Copie o código da aplicação para o diretório de trabalho
COPY . .
WORKDIR /app


# Instale as dependências da aplicação
RUN npm install 
RUN npm run download-music
RUN npm run assetpack

# Exponha a porta na qual a aplicação vai rodar
EXPOSE 9000
RUN touch /app/.env
# Comando para iniciar a aplicação
#CMD ["node", "./app/public/dist/server/app/index.js"]
ENTRYPOINT ["npm", "run", "dev"]




