var xTo, yTo;
var xOffset = 350; // Adjust these offset values as needed
var yOffset = 100; // Adjust these offset values as needed
var defaultScale = 1;

var MIN_ZOOM_LEVEL = -5;
var MAX_ZOOM_LEVEL = 0;

if (keyboard_check(ord("M")) or mouse_wheel_up()) {
    if (o_Player.ZOOM_LEVEL > MIN_ZOOM_LEVEL) {
        o_Player.ZOOM_LEVEL -= 0.1; // Adjust the zoom out speed as needed
        if (o_Player.ZOOM_LEVEL < MIN_ZOOM_LEVEL) {
            o_Player.ZOOM_LEVEL = MIN_ZOOM_LEVEL; // Limit zoom level to the minimum
        }
    }
}

if (keyboard_check(ord("N")) or mouse_wheel_down()) {
    if (o_Player.ZOOM_LEVEL < MAX_ZOOM_LEVEL) {
        o_Player.ZOOM_LEVEL += 0.1; // Adjust the zoom in speed as needed
        if (o_Player.ZOOM_LEVEL > MAX_ZOOM_LEVEL) {
            o_Player.ZOOM_LEVEL = MAX_ZOOM_LEVEL; // Limit zoom level to the maximum
        }
    }
}

var zoomFactor = 1 + o_Player.ZOOM_LEVEL * 0.1;
var newWidth = camWidth / zoomFactor;
var newHeight = camHeight / zoomFactor;

camera_set_view_size(view_camera[0], newWidth, newHeight);

if (o_Player.lock_mode) {
        if !instance_exists(o_target_sprite_obj) 
            target_box = instance_create_layer(0, 0, "projectiles", o_target_sprite_obj);
        if !instance_exists(o_Player.obj) {
            xTo = follow.x;
            yTo = follow.y;
        } else {
            if o_Player.input._del {
                o_Player.obj.hp = 0;
            }
            
            var mid_x = (o_Player.x + o_Player.obj.x) / 2;
            var mid_y = (o_Player.y + o_Player.obj.y) / 2;
            xTo = mid_x - view_wview[0] / 2 + xOffset; // Apply offset here
            yTo = mid_y - view_hview[0] / 2 + yOffset; // Apply offset here

            var death_mob_lock_object_offset = 23;

             if o_Player.obj == o_death_mob {
                target_box.x = o_Player.obj.x;
                target_box.y = o_Player.obj.y - death_mob_lock_object_offset;             
             } else {
                target_box.x = o_Player.obj.x;
                target_box.y = o_Player.obj.y;
             }

            // target_box.x = o_Player.obj.x;
            // target_box.y = o_Player.obj.y;

            var s = point_distance(x, y, o_Player.obj.x, o_Player.obj.y);
            
            // Define a scaling factor based on distance
            // var scale = defaultScale + (s * 0.001); // Tweak the multiplier as needed  - default: 0.001
            
            // target_box.image_xscale = scale;
            // target_box.image_yscale = scale;


            //change size of target box sprite
            target_box.image_xscale = 1.5;
            target_box.image_yscale = 1.5;
        }
} else {

    if (instance_exists(o_target_sprite_obj)) {
        instance_destroy(o_target_sprite_obj);
        target_box = noone; // Reset target_box to noone
    }

    if (follow != noone) {
        xTo = follow.x; 
        yTo = follow.y; 
    } else {
        xTo = o_Player.x;
        yTo = o_Player.y;
    }
    
}

var panSpeedX = (xTo - x) / camera_to_player_speed;
var panSpeedY = (yTo - y) / camera_to_player_speed;

// Apply screenshake if _xyshake is true
if (_xyshake) {
    if (shakeTimer <= shakeDuration) {
            var shakeX = random_range(-screenshake, screenshake);
            var shakeY = random_range(-screenshake, screenshake);

            x += panSpeedX + shakeX;
            y += panSpeedY + shakeY;

            shakeTimer++;
            //show_debug_message(string(shakeTimer));
        } else {
            _xyshake = false; // Reset screenshake variable
            screenshake = 3; // Adjust the magnitude of screenshake
            shakeDuration = 3; // Adjust the duration of screenshake
            shakeTimer = 0;
        }
} else {
    x += panSpeedX;
    y += panSpeedY;
}
camera_set_view_pos(view_camera[0], x - (newWidth * 0.5), y - (newHeight * 0.5));

if (instance_exists(o_target_sprite_obj) && instance_exists(o_Player.obj)) {
    target_box.depth = depth - 1;
        target_box.x = o_Player.obj.x;
        //TODO:  add unique y position of target box in every mob
        if o_Player.obj.name == "death_mob" {
            target_box.x = o_Player.obj.x-(2 * image_xscale);
            target_box.y = o_Player.obj.y - 35; //25
        } else {
            target_box.y = o_Player.obj.y - 25; //25
        } 
        var a = point_direction(o_Player.x, o_Player.y, o_Player.obj.x, o_Player.obj.y);
        target_box.image_angle = a; // Rotate the target_box toward the player.obj
} else {
    o_Player.lock_mode = false;
    o_Player.target_name = "none";
    o_Player.obj_target = mouse_x;
}
