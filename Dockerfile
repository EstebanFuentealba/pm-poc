FROM --platform=linux/amd64 ubuntu:20.04

# Evitar prompts interactivos durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Habilitar arquitectura i386 para Wine
RUN dpkg --add-architecture i386

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    unzip \
    srecord \
    wine \
    wine32 \
    wine64 \
    make \
    && rm -rf /var/lib/apt/lists/*

# Crear directorio de trabajo y c88-pokemini
WORKDIR /opt
RUN git clone https://github.com/pokemon-mini/c88-pokemini.git

# Configurar Wine (después de crear el directorio)
ENV WINEARCH=win32
ENV WINEPREFIX=/opt/c88-pokemini/wineprefix
RUN wineboot --init && while pgrep wineserver > /dev/null; do sleep 1; done

# Ejecutar el instalador
WORKDIR /opt/c88-pokemini
RUN chmod +x install.sh installers/*.sh && bash install.sh

# Configurar el PATH
ENV PATH="/opt/c88-pokemini/c88tools/bin:${PATH}"

# Directorio de trabajo para el proyecto
WORKDIR /project

# Comando por defecto
CMD ["make"]

