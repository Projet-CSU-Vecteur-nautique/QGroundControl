# Ground Control Station

*Ce répertoire sert de documentation pour le GCS. Il relatera des diffrents tests et paramétrages effectués sur la plateforme.*

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

## Configuration de QGroundControl

### Branchement du module SiK

![branchement_sik](/images/branchement_sik.jpg)

Brancher le module à l'ordinateur. (Dans le cas d'une installation par Docker, il faut brancher le module avant le lancement de l'application)

### Paramétrage de la connexion

![autoconnect](/images/autoconnect_qgc.png)

Une fois l'application lancée, il faut autoriser la connexion du logiciel au drone. Cette connexion se réalise par UDP ou via une radio SiK.

### Connexion au module SiK

|  |  |  |
:--|--|--:
![add_sik](/images/add_sik.png) | ![create_sik](/images/create_sik.png) | ![connect_sik](/images/connect_sik.png)

Après avoir autorisé la connexion aux radios SiK, il faut maintenant ajouter un lien de connection au port USB sur lequel est branché le module (ce port peut changer en fonction du nombre d'appareil USB branché sur le PC).

|  |  |
:--|--:
![connected_sik](/images/connected_sik.jpg) | ![connected_drone](/images/connected_drone.png)

Une fois la connexion établie, une led rouge du module devrait commencer à clignoter rapidement et l'application devrait se connecter au drone.

Il est possible que la LED clignote lentement, si l'autre module SiK n'est pas repéré. Dans ce cas, vérifier que le drone soit correctement lancé ou dans le champ de portée du module (~ 300m).

## Paramétrage du Navio

### Configuration initiale

Lors de la première configuration, suivre le [tutoriel d'ArduPilot](https://ardupilot.org/rover/docs/rover-code-configuration.html) pour une compréhension globale du système.

Pour la calibration des [capteurs](https://docs.qgroundcontrol.com/master/en/SetupView/sensors_ardupilot.html) (accéléromètre, compas, gyroscope), de la [radio](https://docs.qgroundcontrol.com/master/en/SetupView/Radio.html) et le [monitoring de la tension](https://docs.qgroundcontrol.com/master/en/SetupView/Power.html) se référer à la [documentation spécifique de QGroundControl](https://docs.qgroundcontrol.com/master/en/SetupView/SetupView.html).

Globalement, la procédure de configuration est la suivante:

1. Sélection de la classe Boat (Bateau)
2. Calibration de la radio
3. Calibration des capteurs
4. Paramétrage des moteurs et servomoteurs connectés au véhicule
5. Calibration des ESC
6. Définition des instructions au déclenchement du mode secours
7. Customisations

La calibration des ESCs varie en fonction du modèle possédé. Les instructions de configuration des ESCs du drone sont disponible [ici](/docs/esc.pdf).

Pour les étapes `4`, `6` et `7`, une liste de paramètre importants est donnée ci -dessous.

### LISTE DES PARAMETRES

export csv, conservation des params importants.

Il existe plusieurs , ....

## Liens

- [QGroundControl](https://docs.qgroundcontrol.com/master/en/getting_started/download_and_install.html)
- [Docker](https://docs.docker.com/get-docker/)
