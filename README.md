Docker-compose scripts to run both https://github.com/smartdevicelink/sdl_core and https://github.com/smartdevicelink/generic_hmi in container and allow hello_sdl_java example application from https://github.com/smartdevicelink/sdl_java_suite use them.

Also https://github.com/smartdevicelink/sdl_hmi available on separate port for convenience

sdl_core/sdl_preloaded_pt.json contains in the end section to describe connection details to example application. During startup 'localhost' automatically replaced with current hostname as sdl_core connecting to java application with this hostname.

Example usage:

starter$ ./starter.sh   # start sdl_core and generic_hmi

starter$ ./starter.sh stop # stop sdl_core and generic_hmi

https://github.com/smartdevicelink/generic_hmi available at port 3000
https://github.com/smartdevicelink/sdl_hmi available at port 4000
