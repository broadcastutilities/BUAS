# This script configures Icecast server settings based on environment variables.
# It updates the Icecast configuration file (/etc/icecast2/icecast.xml) with the provided values.
#
# Environment variables:
# - ICECAST_SOURCE_PASSWORD: Password for source clients.
# - ICECAST_RELAY_PASSWORD: Password for relay clients.
# - ICECAST_ADMIN_PASSWORD: Password for admin access.
# - ICECAST_ADMIN_USERNAME: Username for admin access.
# - ICECAST_ADMIN_EMAIL: Email address for admin contact.
# - ICECAST_LOCATION: Location of the Icecast server.
# - ICECAST_HOSTNAME: Hostname of the Icecast server.
# - ICECAST_MAX_CLIENTS: Maximum number of clients.
# - ICECAST_MAX_SOURCES: Maximum number of sources.
#
# The script uses `sed` to replace the corresponding XML tags in the configuration file with the values of the environment variables.
# If an environment variable is not set, the corresponding XML tag remains unchanged.
#
# Finally, the script executes the command passed as arguments to the script.
#!/bin/sh

if [ -n "$ICECAST_SOURCE_PASSWORD" ]; then
    sed -i "s/<source-password>[^<]*<\/source-password>/<source-password>$ICECAST_SOURCE_PASSWORD<\/source-password>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$ICECAST_RELAY_PASSWORD" ]; then
    sed -i "s/<relay-password>[^<]*<\/relay-password>/<relay-password>$ICECAST_RELAY_PASSWORD<\/relay-password>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$ICECAST_ADMIN_PASSWORD" ]; then
    sed -i "s/<admin-password>[^<]*<\/admin-password>/<admin-password>$ICECAST_ADMIN_PASSWORD<\/admin-password>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$ICECAST_ADMIN_USERNAME" ]; then
    sed -i "s/<admin-user>[^<]*<\/admin-user>/<admin-user>$ICECAST_ADMIN_USERNAME<\/admin-user>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$ICECAST_ADMIN_EMAIL" ]; then
    sed -i "s/<admin>[^<]*<\/admin>/<admin>$ICECAST_ADMIN_EMAIL<\/admin>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$ICECAST_LOCATION" ]; then
    sed -i "s/<location>[^<]*<\/location>/<location>$ICECAST_LOCATION<\/location>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$ICECAST_HOSTNAME" ]; then
    sed -i "s/<hostname>[^<]*<\/hostname>/<hostname>$ICECAST_HOSTNAME<\/hostname>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$ICECAST_MAX_CLIENTS" ]; then
    sed -i "s/<clients>[^<]*<\/clients>/<clients>$ICECAST_MAX_CLIENTS<\/clients>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$ICECAST_MAX_SOURCES" ]; then
    sed -i "s/<sources>[^<]*<\/sources>/<sources>$ICECAST_MAX_SOURCES<\/sources>/g" /etc/icecast2/icecast.xml
fi

exec "$@"