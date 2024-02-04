



global.width = window_get_width();
global.height = window_get_height();



ini_open("conf.ini"); //open file

global.player_hp = ini_read_real("conf", "player_hp", 1000);
global.knight_hp = ini_read_real("conf", "knight_hp", 500);
global.zoom_level = ini_read_real("conf", "zoom_level", -5);


ini_close(); //close file

_player_hp = global.player_hp;
_knight_hp = global.knight_hp;
_zoom_level = global.zoom_level;
ZOOM_LEVEL = _zoom_level;
