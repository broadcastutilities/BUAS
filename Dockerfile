FROM ubuntu:focal

LABEL Name=easyicecast-2 maintainer="Rik Visser <r.visser@rikvissermedia.nl>" github="https://github.com/rikvisser-tech/easy-icecast2"

RUN addgroup --system icecast2 && adduser --system --no-create-home --disabled-password --ingroup icecast2 icecast2

RUN apt update && apt upgrade -y && \
    apt install -y icecast2 && \
    sed -i "s#ENABLE=.*#ENABLE=true#" /etc/default/icecast2 && \
    cat /etc/default/icecast2 && \
    apt autoremove && apt clean && \
    rm -rf /var/lib/apt/lists/*


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8000
VOLUME [ "/var/log/icecast2" ]
ENTRYPOINT [ "/entrypoint.sh" ]


CMD  /etc/init.d/icecast2 start && tail -f /var/log/icecast2/error.log
