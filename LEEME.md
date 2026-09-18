# Reparacion del servidor

Para Minecraft 1.20.1 con Forge 47.4.10.

1. Deten el servidor y termina de subir la copia original al Codespace.
2. Sube reparacion-minecraft.zip a la carpeta que contiene msx.py y servidor_minecraft.
3. En la terminal de esa carpeta ejecuta:

```bash
unzip -o reparacion-minecraft.zip
bash reparar.sh
```

El Codespace debe tener Java 17 y acceso a internet. El script usa el instalador forge.jar de tu copia para regenerar los archivos y completar las bibliotecas. Si falta eula.txt, te permite leer y aceptar la EULA antes de arrancar.

El paquete incluye los tres archivos de argumentos originales, recuperados de tu instalador. El .gitignore conserva las reglas originales y agrega excepciones para los archivos de arranque. Si modificaste ese .gitignore en el nuevo Codespace, conserva tus cambios al combinarlo.

No contiene ni reemplaza world, mods o configuraciones del juego. Necesitas que esas carpetas hayan terminado de subirse. La carpeta local revisada contiene el mundo y los datos de jugadores; no se ha verificado la integridad de cada archivo de la partida.

En la copia local faltan tambien jna-5.12.1.jar y jna-platform-5.12.1.jar; el instalador se encarga de obtener las bibliotecas necesarias.

Para siguientes arranques, desde la carpeta que contiene servidor_minecraft:

```bash
cd servidor_minecraft
bash run.sh nogui
```

La reparacion no configura el tunel o direccion para conectarse desde Minecraft. Si el servidor arranca pero no permite conectarse, hay que revisar esa conexion por separado.

Se verifico que los archivos de argumentos proceden del instalador de tu copia. No se pudo probar el arranque en tu Codespace desde esta sesion. Si falla, comparte las lineas anteriores al codigo de salida.
