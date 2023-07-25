# Ground Control Station

*Ce répertoire sert de documentation pour le GCS. Il relatera des diffrents tests et paramétrages effectués sur la plateforme.*

## Paramétrage du Navio

Sélection de la frame Boat 

## Installation de QGC

Sur le PC GCS suivre les instructions suivantes: [installation qgc](https://docs.qgroundcontrol.com/master/en/getting_started/download_and_install.html) ou passer par un conteneur (ex: [Docker](https://docs.docker.com/get-docker/)).

### Installation par docker

*Pour éviter d'installer trop d'applications en local ou se protéger lors de tests, il peut être intéressant de passer par des conteneurs.*

1. Construire l'image à partir du [Dockerfile](/Dockerfile).

    ```sh
    # Depuis le répertoire du fichier Dockerfile
    sudo docker build -t qgc .
    ```

    *Cette étape peut durer quelques minutes*

2. Créer le conteneur QGC

Pour autoriser l'execution d'application graphique depuis le conteneur, executer la commande

```sh
xhost +local:root
```

Pour créer le conteneur

```sh
sudo docker run -it \
    --privileged \
    --network host \
    --name=QGC \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="LIBGL_ALWAYS_SOFTWARE=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -u qgc \
    qgc \
    ./QGroundControl.AppImage
```

Pour démarrer le conteneur et accéder à l'application depuis un conteneur en actif

```sh
sudo docker start QGC # Démarrage
sudo docker exec -it -u qgc bash # Executer un conteneur en cours
```

### LISTE DES PARAMETRES

export csv, conservation des params importants.

Il existe plusieurs , ....

## Liens

- [QGroundControl](https://docs.qgroundcontrol.com/master/en/getting_started/download_and_install.html) 
- [Docker](https://docs.docker.com/get-docker/)
