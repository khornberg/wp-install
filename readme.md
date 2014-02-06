# WordPress with minimal overhead for development

PHP 5.4 builtin server + SQLite Integration = easy WordPress development

This script makes use of [SQLite Integration](http://wordpress.org/plugins/sqlite-integration) and this
[router.php](https://gist.github.com/3801087). 

## Usage
Clone this repo to the folder you want: `git clone https://github.com/khornberg/wp-install.git /awesome-project`  
Run the script: `cd awesome-project; ./wp-install.sh`  
This installs WordPress at `awesome-project/WordPress`  

### -s Start the server
If you want to start the server when you install add the `-s` argument.  
Otherwise run `php -S localhost:7000 -t WordPress router.php` and away you go.  
Open browser, develop, take a breath, it’s that easy now thankfully.  

## Dependencies
Make sure you have the SQLite PDO installed for your system.  
Ubuntu `apt-get install php5-sqlite`  

## Options
Databases are stored in the `wp-content/databases` directory.
You can also specify the database directory and file used.

Add to your `wp-config.php`
```
define('DB_DIR', 'dir');
define('DB_FILE', 'file');
```

This is nice if you wanted to centralize multiple databases for WordPress versions, testing and plugins.