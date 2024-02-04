



event_inherited();

image_xscale = -1;

hp = global.knight_hp;

draw_hp = 0;
draw_max_hp = hp;
max_hp = hp;

draw_red_hp = 100;
draw_red_max_hp = hp;

_id = self;

vspeed = 0;
hspeed = 0;
invincibility = false;
move_speed = 0;
jump = -10; // Adjusted for a higher jump
grv = 0.2; // Adjusted for higher gravity
vsp_max = 10;
jump_mod = 1.6
on_ground = 1;
on_air = 0;

state = "idle";
attack_range = 42;
chase_speed = 2;

exp_val = 50;



 //nearest_neighbor = noone;






//THE CODE BELOW IS AN EXPERIMENTAL STATE FOR REFACTORING



randomize();
is_drawing = false;
line_length = 1000000; // Adjust the length of the lines as needed //default = 1000000
random_angle = irandom(360); // Generate a random angle
random_length = irandom_range(20, line_length); // Randomize the length within a range

// #macro SUB_DRAW_HP 0
// #macro SUB_HP 1
// #macro SUB_DRAW_MAX_HP 2
// #macro SUB_MAX_HP 3
// #macro SUB_HP_PERCENT 4
// #macro SUB_DRAW_RED_HP 5
// #macro SUB_DRAW_RED_MAX_HP 6
// #macro SUB_RED_HP_PERCENT 7


// num_sub_hp = findNearestDivisorTo100(hp);
// sub_max_hp = max_hp / num_sub_hp;	
// hp_grid = ds_grid_create(8, num_sub_hp);

// for(var i = 0; i < num_sub_hp; i++){
// 	hp_grid[# SUB_DRAW_HP, i] = 0;
// 	hp_grid[# SUB_HP, i] = sub_max_hp;
// 	hp_grid[# SUB_MAX_HP, i] = hp_grid[# SUB_HP, i];
// }












