FROM nginx:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget unzip -y
WORKDIR /usr/share/nginx/html
COPY default.conf /etc/nginx/sites-enabled/
ADD https://bootstrapmade.com/content/templatefiles/Valera/Valera.zip .
RUN unzip Valera.zip
RUN mv Valera/* .
RUN rm -rf Valera Valera.zip
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
