# BUAS
## Broadcast Utilities Audio Server

Broadcast Utilities Audio-Server is a Docker-based solution for running an Icecast2 server. Icecast2 is a streaming media server which supports various streaming formats, including MP3, Ogg Vorbis, and Ogg Theora. This project simplifies the process of setting up and running an Icecast2 server using Docker and Docker Compose.

## Installation

### Prerequisites

- Docker
- Docker Compose

### Steps

1. Clone the repository:

   ```sh
   git clone https://github.com/broadcastutilities/audio-server.git
   cd audio-server
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

This will start the Icecast2 server in detached mode. You can access the Icecast2 admin interface by navigating to `http://127.0.0.1:8000/admin` or your public IP in your web browser. The default Icecast2 admin username is `admin`.

## Configuration

The Icecast2 server can be configured using environment variables. The following environment variables are available:

- `ICECAST_SOURCE_PASSWORD` (default: `hackme`): The source password for the Icecast2 server.
- `ICECAST_ADMIN_PASSWORD` (default: `hackme`): The admin password for the Icecast2 server.
- `ICECAST_RELAY_PASSWORD` (default: `hackme`): The relay password for the Icecast2 server.
- `ICECAST_ADMIN_USERNAME` (default: `admin`): The admin username for the Icecast2 server.
- `ICECAST_ADMIN_EMAIL` (default: `admin@example.com`): The admin email for the Icecast2 server.
- `ICECAST_LOCATION` (default: `Earth`): The location of the Icecast2 server.
- `ICECAST_HOSTNAME` (default: `localhost`): The hostname of the Icecast2 server.
- `ICECAST_MAX_CLIENTS` (default: `100`): The maximum number of clients for the Icecast2 server.
- `ICECAST_MAX_SOURCES` (default: `10`): The maximum number of sources for the Icecast2 server.

These environment variables can be set in the `docker-compose.yml` file. Here is an example:

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
