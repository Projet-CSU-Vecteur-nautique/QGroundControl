FROM ubuntu:20.04

RUN apt-get update

RUN apt-get install mesa-utils -y \
&& apt-get install gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-gl -y \
&& apt-get install libqt5gui5 -y \
&& apt-get install wget fuse libpulse-dev -y

RUN wget https://d176tv9ibo4jno.cloudfront.net/latest/QGroundControl.AppImage 

RUN useradd -m -G dialout -s /bin/bash qgc \
&& chmod +x QGroundControl.AppImage

ENV QT_X11_NO_MITSHM="1"
ENV LIBGL_ALWAYS_SOFTWARE="1"