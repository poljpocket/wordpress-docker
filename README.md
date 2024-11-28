# WordPress Docker

WordPress Docker composition for local development.

This composition is designed for a quick and dirty local installation of a WordPress website duplicated with the Duplicator plugin.

## Configuration

Edit the `docker-compose.yml` file to adjust the composition to your needs.

### PHP Version

There are several images available for different PHP versions. Compare [Docker Hub](https://hub.docker.com/r/poljpocket/wordpress). Set `image` of the `web` container to the appropriate PHP version.

### User configuration

Set `WEB_USER_ID` and `WEB_GROUP_ID` in `docker-compose.yml` to the appropriate values for your local user (on most Linux installations, the first user has ID `1000`). You can use `id` to verify.

## Running the composition

Place the `installer.php` and the archive (`.dup` or `.zip`) into the `backup` folder.

Run `docker compose up -d` to run the composition.

Go to http://localhost:8080/installer.php and go through the installation process as normal. When asked for database credentials, use `database` as host, and `docker` for user, password and database name.

After the installation, a `copied` file will be placed into the `backup` folder to mark that the files have been copied into the container. This will prevent further runs from copying the files again.

## Clean-up

You can use one single installation of this repository for multiple runs of different archives. To clean up, stop the composition and clear the `backup`, `themes` and `plugins` folders. Also, remove the `files` and `database` volumes Docker created to have a clean slate again.

## Advanced usage

For convenience, the `themes` and `plugins` directories will be mapped to the local filesystem.

You can view/edit the database with phpMyAdmin on http://localhost:8081.

After installation is done, you can remap single folders in the `themes` and `plugins` directories to allow local development. You can, for example, remove the folder `my_theme` in `themes` and clone it's actual git repository into the `themes` folder. This allows you to work on the code whilst running it as part of the WordPress installation locally.
