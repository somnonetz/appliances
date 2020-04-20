# snet-nginx


nginx frontend proxy and static file server.

includes:
* a base nginx.conf
* [pre-built copla-editor](https://github.com/somnonetz/copla-editor/tree/master/sn-editor)
* [pre-build snet-asclepios-search](https://github.com/somnonetz/snet-asclepios-search)

## Usage

* server configs should be mounted at `/etc/nginx/conf.d`
* copla-editor is installed in : `/var/www/copla-editor`
* [example config](https://github.com/somnonetz/snet-xnat-docker-compose/blob/master/nginx/xnat.local.conf)
