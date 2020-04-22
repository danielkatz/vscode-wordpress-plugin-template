# WordPress Plugin template for VS Code

## Summary

*A template for WordPress template development on vscode remote container*

## Description

Included software:

|Software|Version|
|--------|-------|
|PHP-FPM|7.4.x|
|WordPress|5.4.x|
|Composer|[latest](https://getcomposer.org/)|
|PHP_CodeSniffer|[latest](https://packagist.org/packages/squizlabs/php_codesniffer)|
|WordPress-Coding-Standards|[master](https://github.com/WordPress/WordPress-Coding-Standards)|
|NGINX|[latest](https://hub.docker.com/_/nginx)|
|MariaDB|[latest](https://hub.docker.com/_/mariadb)|

Preinstalled VS Code extensions:

|Extension|Description|
|---------|-----------|
|Remote - Containers|Lets you use a Docker container as a full-featured development environment|
|PHP Extension Pack|PHP debugger and IntelliSense support for VS Code|
|PHP Sniffer & Beautifier|Linter that integrates `phpcs` & `phpcbf` into VS Code|
|SQLTools - Database tools|Connection explorer, query runner, intellisense, bookmarks, query history|

## How it works

This template uses [Visual Studio Code Remote - Containers](https://code.visualstudio.com/docs/remote/containers), to setup a consistent, full-featured development environment using Docker containers.

After installing the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extention, when you are opening the project for the first time, a fresh copy of WordPress will be installed info `.wordrpess` folder inside your project. This folder will contain two sub-folders:
* `html` for WordPress files.
* `mysql` for MariaDB files.

You will find your own code mapped via a symlink to `html/wp-content/plugins/dev-plugin` inside `.wordpress`;

This way, your development WordPress installation will persist between development sessions. The `.wordpress` folder is excluded from Git by `.gitignore`.

If later, you need to get a fresh WordPress installation again, just delete the `.wordpress` folder and re-open the project.

The development environment is pre-configured for debugging with xdebug. You can place break points in your code, or even inside WordPress code in `.wordpress/html` folder.

## Configuration

**Though this template will work out-of-the-box, to make the most out of it, you can easily config any aspect of it to suit your needs.**

### Plugin or Template location

By default, the root folder of your project will be mapped via a symlink into `wp-content/plugins/dev-plugin` inside the WordPress folder, but you can change that by editing `symlink_target` variable in `.devcontainer/setup.sh` file.

### Selecting PHP and WordPress versions

To change the version of WordPress or PHP, edit the `FROM` statement in `.devcontainer/Dockerfile` to be of form:

```
FROM wordpress:<wordpress_version>-php<php_version>-fpm
```

For example for WordPress version *5.4* and PHP version *7.4* the `FROM` statement should be:

```
FROM wordpress:5.4-php7.4-fpm
```

After changing the PHP version press <kbd>F1</kbd> for the Command Palette and select **Remote-Containers: Rebuild Container**. If you also changed the WordPress version, you should delete the `.wordpress` folder before.

### Configuring NGINX

In case you need to add custom NGINX rules, you can do it by editing the `.devcontainer/config/nginx.conf` file. Then re-opening the project for the changes to take effect.

### Configuring PHP

For configuring the PHP environment edit the`.devcontainer/config/php.ini` file. Then re-open the project for the changes to take effect.

### Coding Styles

By default PHP Sniffer & Beautifier will use the `WordPress` standard, but if it detects any of `.phpcs.xml`, `.phpcs.xml.dist`, `phpcs.xml`, `phpcs.xml.dist`, `phpcs.ruleset.xml` or `ruleset.xml` files in the rood of your project it will override the default setting.
