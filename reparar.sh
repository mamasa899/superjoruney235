#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")/servidor_minecraft"
if ! command -v java >/dev/null 2>&1; then
  echo 'Falta Java. Instala Java 17 en el Codespace y vuelve a ejecutar este archivo.'
  exit 1
fi
java -version
if [ ! -f forge.jar ]; then
  echo 'Falta servidor_minecraft/forge.jar. Termina de subir la copia original y vuelve a intentarlo.'
  exit 1
fi
echo 'Reparando Forge 1.20.1-47.4.10 y sus bibliotecas. Necesita internet.'
java -jar forge.jar --installServer
if [ ! -f user_jvm_args.txt ] || [ ! -f libraries/net/minecraftforge/forge/1.20.1-47.4.10/unix_args.txt ]; then
  echo 'Forge no termino de generar los archivos de arranque. Comparte el error anterior.'
  exit 1
fi
if ! grep -Eq '^[[:space:]]*eula[[:space:]]*=[[:space:]]*true[[:space:]]*$' eula.txt 2>/dev/null; then
  echo 'Falta la aceptacion de la EULA de Minecraft: https://aka.ms/MinecraftEULA'
  read -r -p 'Si aceptas la EULA, escribe ACEPTO: ' respuesta
  if [ "$respuesta" != ACEPTO ]; then
    echo 'Archivos reparados. Para arrancar queda pendiente aceptar la EULA.'
    exit 0
  fi
  printf 'eula=true\n' > eula.txt
fi
echo 'Reparacion terminada. Iniciando el servidor...'
exec bash run.sh nogui
