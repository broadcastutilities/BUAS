FROM ubuntu:focal
LABEL Name=breeze_icecast2 Version=0.0.1 maintainer="Rik Visser <r.visser@rikvissermedia.nl>" github="https://github.com/rikvisser-tech/breeze-icecast2"
RUN apt-get -y update && apt-get install -y fortunes
CMD ["sh", "-c", "/usr/games/fortune -a | cowsay"]
