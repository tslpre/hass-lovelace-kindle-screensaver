FROM node:12-alpine

WORKDIR /app

RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    imagemagick

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser --ignore-certificate-errors \
    USE_IMAGE_MAGICK=true

COPY package*.json ./

RUN npm ci

COPY . . 

EXPOSE 5000

CMD ["npm", "start"]
