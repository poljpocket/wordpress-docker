# WordPress Docker

WordPress Docker composition for local development.

This composition is designed for a quick and dirty local installation of a WordPress website duplicated with the Duplicator plugin.

## Usage

Configure `docker-compose.yml`: Set `WEB_USER_ID` and `WEB_GROUP_ID` to the appropriate values for your local user (on most Linux, the first user has ID `1000`). You can use `id` to verify.

Place the `installer.php` and the archive (`.dup` or `.zip`) into the `backup` folder.

Run `docker compose up`.

Go to http://localhost:8080/installer.php and go through the installation process as normal. When asked for database credentials, use `database` as host, and `docker` for user, password and database name.

## Features

For convenience, the `themes` and `plugins` directories will be mapped to the local filesystem.

You can view/edit the database with phpMyAdmin on http://localhost:8081.

You should use git repositories inside `themes` and `plugins` (e.g. `themes/your_theme_name`) to work on the files directly. It doesn't make any sense to commit the whole WordPress install.
