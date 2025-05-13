Roberto Carlos Hernandez Aparicio

Proyecto final para la materia: Administracion de redes

1.-Para ejecutar es necesario primero construir las imagenes
    'docker build -t workers ./PC'
    'docker build -t printers ./Printer


NOTA: Es necesario crear una imagen para cada departamento:

    'docker build -t workers_contabilidad ./PC/Contabilidad'
    'docker build -t workers_gerencia ./PC/Gerencia'
    'docker build -t workers_ventas ./PC/Ventas'
    'docker build -t workers_recursos ./PC/Recursos'
    'docker build -t workers_soporte ./PC/Soporte'


2.-Ejecuta 'docker compose up' desde el directorio raiz del proyecto

Extra:

-Para acceder con una consola interactiva a un contenedor:
docker exec -it Worker1_Ventas bash

-Ahora se podra acceder a CUPS desde navegador escribiendo en la barra de busqueda:
http://127.0.0.1:1661

-En Metas.txt se encuentra los siguiente a realizar

-Con los nuevos cambios al ingresar a un contenedor con exec, en el directorio /home del contenedor se encuentra el script addPrinters.sh, el cual agrega al ordenador las impresoras de su respectiva red.
