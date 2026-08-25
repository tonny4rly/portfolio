FROM nginx:alpine

# Nettoyage et configuration des permissions
RUN rm -rf /usr/share/nginx/html/*

# Copie des fichiers statiques
COPY . /usr/share/nginx/html

# Ajustement des droits pour l'utilisateur non-root nginx
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html

# Bonne pratique SecOps : Exécution sous utilisateur non-privilégié
USER nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
