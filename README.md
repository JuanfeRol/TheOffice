Roberto Carlos Hernandez Aparicio

Proyecto final para la materia: Administracion de redes

1.-Para ejecutar es necesario primero construir las imagenes
    'docker build -t workers ./PC'
    'docker build -t printers ./Printer


2.-Ejecuta 'docker compose up' desde el directorio raiz del proyecto

Extra:

-Para acceder con una consola interactiva a un contenedor:
docker exec -it Worker1_Ventas bash

-Ahora se podra acceder a CUPS desde navegador escribiendo en la barra de busqueda:
http://127.0.0.1:1661

-En Metas.txt se encuentra los siguiente a realizar
