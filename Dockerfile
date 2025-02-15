FROM nginx:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget unzip -y
WORKDIR /usr/share/nginx/html
COPY default.conf /etc/nginx/sites-enabled/
ADD https://bootstrapmade.com/content/templatefiles/AgriCulture/AgriCulture.zip .
RUN unzip AgriCulture.zip
RUN mv AgriCulture/* .
RUN rm -rf AgriCulture AgriCulture.zip
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
