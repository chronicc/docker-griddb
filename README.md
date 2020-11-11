GridDB Docker
=============

Ready to use GridDB docker image.

## Build Arguments

### JAVA_VERSION

Specify the version of the openJDK tools used to run GridDB. Defaults to `1.8.0`.

### GRIDDB_VERSION

Specify the version of GridDB that is installed in the container. No default value.

### GRIDDB_PACKAGE

When you are running a rpm proxy or another form of package source (e.g. ftp), you can overwrite this argument with the url to your package. In this case the `GRIDDB_VERSION` will be ignored. 

## License

* Docker Image: MIT
* GridDB: APACHE 2.0
