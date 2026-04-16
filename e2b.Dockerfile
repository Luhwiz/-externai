FROM node:20-bullseye

WORKDIR /code

# Prevent npm from logging extra noise
RUN npm config set fund false && npm config set update-notifier false

# Create a baseline package.json
RUN npm init -y

# Pre-install Vite, React, Tailwind, and ALL standard AI libraries globally/locally 
# so they are permanently cached on the disk.
RUN npm install \
    react@^18.2.0 \
    react-dom@^18.2.0 \
    lucide-react@^0.368.0 \
    recharts@^2.12.3 \
    framer-motion@^11.0.24 \
    clsx@^2.1.0 \
    tailwind-merge@^2.2.2 \
    vite@^5.2.0 \
    @vitejs/plugin-react@^4.2.1 \
    tailwindcss@^3.4.3 \
    postcss@^8.4.38 \
    autoprefixer@^10.4.19 \
    typescript@^5.4.0

# Ensure Vite can bind to all public interfaces inside the VM
EXPOSE 5173
EXPOSE 3000
# Trigger build
