//game start

instance_create_depth(0,0,0,obj_console);


ini_open("conf.ini");

var _width = ini_read_real("conf", "window_width_size", global.width);
var _height = ini_read_real("conf", "window_height_size", global.height);
var _zoom_level = ini_read_real("conf", "zoom_level", global.zoom_level);


ZOOM_LEVEL = _zoom_level;
//window_set_size(surface_get_width(application_surface) , surface_get_height(application_surface)/2);
window_set_size(_width, _height);
//surface_resize(application_surface, _width/2, _height/2);



ini_close();



