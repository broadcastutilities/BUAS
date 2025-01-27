FROM ubuntu:focal


RUN addgroup --system icecast2 && adduser --system --no-create-home --disabled-password --ingroup icecast2 icecast2

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y icecast2 && \
    sed -i "s#ENABLE=.*#ENABLE=true#" /etc/default/icecast2 && \
    cat /etc/default/icecast2 && \
    apt-get autoremove && apt-get clean && \
    rm -rf /var/lib/apt/lists/*


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8000
VOLUME [ "/var/log/icecast2" ]
ENTRYPOINT [ "/entrypoint.sh" ]


CMD  /etc/init.d/icecast2 start && tail -f /var/log/icecast2/error.log
