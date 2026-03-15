FROM nginx:alpine
COPY . /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
CMD sh -c "sed -i 's/PORT/$PORT/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
