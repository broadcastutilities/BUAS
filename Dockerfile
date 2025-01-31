# This Dockerfile sets up an Icecast2 server on an Ubuntu Focal base image.
# 
# Base Image:
# - Uses the official Ubuntu Focal (20.04) image.
#
# System User and Group:
# - Creates a system group 'icecast2'.
# - Creates a system user 'icecast2' within the 'icecast2' group without a home directory and with a disabled password.
#
# Package Installation:
# - Updates the package list and upgrades installed packages.
# - Installs Icecast2.
# - Enables Icecast2 by modifying the /etc/default/icecast2 configuration file.
# - Removes unnecessary packages and cleans up to reduce image size.
#
# Entrypoint Script:
# - Copies the entrypoint.sh script into the container.
# - Makes the entrypoint.sh script executable.
#
# Exposed Port:
# - Exposes port 8000 for Icecast2.
#
# Volume:
# - Defines a volume for Icecast2 logs at /var/log/icecast2.
#
# Entrypoint and Command:
# - Sets the entrypoint to the entrypoint.sh script.
# - Starts the Icecast2 service and tails the error log.
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
