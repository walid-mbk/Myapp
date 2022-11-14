FROM nginxinc/nginx-unprivileged:stable-alpine

COPY ./dist/Myapp /usr/share/nginx/html

EXPOSE 4201

CMD ["nginx", "-g", "daemon off;"]