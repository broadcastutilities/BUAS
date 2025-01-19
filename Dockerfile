FROM ubuntu:focal

LABEL Name=breeze_icecast2 Version=0.0.1 maintainer="Rik Visser <r.visser@rikvissermedia.nl>" github="https://github.com/rikvisser-tech/breeze-icecast2"

RUN addgroup --system icecast2 && adduser --system --no-create-home --disabled-password --ingroup icecast2 icecast2

RUN apt update && apt upgrade -y && \
    apt install -y icecast2 && \
    sed -i "s#ENABLE=.*#ENABLE=true#" /etc/default/icecast2 && \
    cat /etc/default/icecast2 && \
    apt autoremove && apt clean && \
    rm -rf /var/lib/apt/lists/*


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


CMD  /etc/init.d/icecast2 start && tail -f /var/log/icecast2/error.log
