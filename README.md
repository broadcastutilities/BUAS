# Easy Icecast2

Broadcast Utilities Audio-Server is a Docker-based solution for running an Icecast2 server. Icecast2 is a streaming media server which supports various streaming formats, including MP3, Ogg Vorbis, and Ogg Theora. This project simplifies the process of setting up and running an Icecast2 server using Docker and Docker Compose.

## Installation

### Prerequisites

- Docker
- Docker Compose

### Steps

1. Clone the repository:

   ```sh
   git clone https://github.com/broadcastutilities/audio-server.git
   cd easy-icecast2
   ```

2. Build the Docker image:

   ```sh
   docker-compose build
   ```

## Usage

To start the Icecast2 server, run the following command:

```sh
docker-compose up -d
```

This will start the Icecast2 server in detached mode. You can access the Icecast2 admin interface by navigating to `http://127.0.0.1:8000/admin` or your public ip in your web browser.

## Configuration

The Icecast2 server can be configured using environment variables. The following environment variables are available:

- `ICECAST_SOURCE_PASSWORD`: The source password for the Icecast2 server.
- `ICECAST_ADMIN_PASSWORD`: The admin password for the Icecast2 server.
- `ICECAST_RELAY_PASSWORD`: The relay password for the Icecast2 server.
- `ICECAST_ADMIN_USERNAME`: The admin username for the Icecast2 server.
- `ICECAST_ADMIN_EMAIL`: The admin email for the Icecast2 server.
- `ICECAST_LOCATION`: The location of the Icecast2 server.
- `ICECAST_HOSTNAME`: The hostname of the Icecast2 server.
- `ICECAST_MAX_CLIENTS`: The maximum number of clients for the Icecast2 server.
- `ICECAST_MAX_SOURCES`: The maximum number of sources for the Icecast2 server.

These environment variables can be set in the `docker-compose.yml` file.

## Publishing to Docker Hub

To publish the Docker image to Docker Hub, follow these steps:

1. Create a new release on GitHub.
2. The GitHub Actions workflow will automatically build and push the Docker image to Docker Hub.

You can find the Docker image in your Docker Hub repository.


## Publishing to GitHub Packages

To publish the Docker image to GitHub Packages, follow these steps:

1. Create a new release on GitHub.
2. The GitHub Actions workflow will automatically build and push the Docker image to GitHub Packages.

You can find the Docker image in the GitHub Packages section of your repository.

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue or submit a pull request.

## License

This project is licensed under the GNU General Public License v2.0. See the [LICENSE](LICENSE) file for details.
