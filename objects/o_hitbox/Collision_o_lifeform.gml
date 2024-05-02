if (creator == noone || creator.type == other.type || (creator == other && creator.id == other.id) || ds_list_find_index(hit_objects, other) != -1) exit;
	var offset = 50;
	var is_SLOW_MODE = o_Player.SLOW_MODE ? 0.1 : 1;

	if (hitbox_id == "Spinning Sword" or hitbox_id == "judgement_cut" or hitbox_id == "hightime_loop" or hitbox_id == "SummonSwords" or hitbox_id == "attk1" or hitbox_id == "attk2" or hitbox_id == "dash") and other.on_air {
		// show_debug_message("lifted by " + string(hitbox_id));
		other.speed = 0;
		other.vspeed = -1.0 * other.jump_mod ;//default = 0.6

	}

	if hitbox_id == "Spinning Sword" {
		other.speed = 0;
		sword_throw_hit = instance_create_layer(x, y-23, layer+1, o_player_sword_melee_hit);
		sword_throw_hit.sprite_index = s_hit_vfx_with_red_outline_Sheet_strip6;
		sword_throw_hit.image_speed = is_SLOW_MODE;
		sword_throw_hit.x = other.x;
		sword_throw_hit.y = other.y-23;
		sword_throw_hit.image_angle = other.image_angle;
		sword_throw_hit.image_index = 0;
		sword_throw_hit.depth = other.depth - 1;
	}

	if hitbox_id == "hightime"{
		other.speed = 0;
		hightime_hit = instance_create_layer(x, y-23, layer+1, o_player_sword_melee_hit);
		hightime_hit.image_speed = is_SLOW_MODE;
		hightime_hit.x = other.x+(offset * -creator.image_xscale);
		hightime_hit.y = other.y+46;
		hightime_hit.image_angle = other.image_xscale < 0 ? 45 : -240;
		hightime_hit.image_index = 0;
		hightime_hit.depth = other.depth - 1;
		other.vspeed = other.jump + 2; //TODO: need not to double the execute of this code
	}

	if hitbox_id == "judgement_cut"{
		other.speed = 0;
		judgement_cut_hit = instance_create_layer(x, y-23, layer+1, o_player_sword_melee_hit);
		judgement_cut_hit.sprite_index = s_hit_vfx_with_red_outline_Sheet_strip6;
		judgement_cut_hit.image_speed = is_SLOW_MODE;
		judgement_cut_hit.x = other.x;
		judgement_cut_hit.y = other.y-23;
		randomize();
		judgement_cut_hit.image_angle = random(360);
		judgement_cut_hit.image_index = 0;
		judgement_cut_hit.depth = other.depth - 1;
		judgement_cut_hit2 = instance_create_layer(x, y-23, layer+1, death_hit_sprite);
		judgement_cut_hit2.image_xscale = 5;
		judgement_cut_hit2.image_speed = is_SLOW_MODE;
		judgement_cut_hit2.x = other.x;
		judgement_cut_hit2.y = other.y-23;
		randomize();
		judgement_cut_hit2.image_angle = random(360);
		judgement_cut_hit2.image_index = 0;
		judgement_cut_hit2.depth = other.depth - 1;
	}

	if hitbox_id == "hightime_loop"{
		other.speed = 0;
		hightime_loop = instance_create_layer(x, y-23, layer+1, o_player_sword_melee_hit);
		hightime_loop.image_speed = is_SLOW_MODE;
		hightime_loop.x = other.x+(offset * -creator.image_xscale);
		hightime_loop.y = other.y+46;
		hightime_loop.image_angle = other.image_xscale < 0 ? 45 : -240;
		hightime_loop.image_index = 0;
		hightime_loop.depth = other.depth - 1;
		other.vspeed = -0.6 * other.jump_mod;
	}

	if hitbox_id == "lowtime"{
		other.speed = 0;
		lowtime_hit = instance_create_layer(x, y-23, layer+1, o_player_sword_melee_hit);
		lowtime_hit.image_speed = is_SLOW_MODE;
		lowtime_hit.x = other.x+((offset-30) * -creator.image_xscale);
		lowtime_hit.y = other.y-50;
		lowtime_hit.image_angle = other.image_xscale < 0 ? -45 : 240;
		lowtime_hit.image_index = 0;
		lowtime_hit.depth = other.depth - 1;
		with(other){
			// vspeed = -jump; //TODO: need not to double the execute of this code
			move_and_collide(0, vspeed-jump, obj_wall);
		}
	}

	if hitbox_id == "attk2"{
		other.speed = 0;
		attk2_hit = instance_create_layer(x, y-23, layer+1, o_player_sword_melee_hit);
		attk2_hit.image_speed = is_SLOW_MODE;
		attk2_hit.x = other.x+((offset-30) * -creator.image_xscale);
		attk2_hit.y = other.y-70;
		attk2_hit.image_angle = other.image_xscale < 0 ? -45 : 240;
		attk2_hit.image_index = 0;
		attk2_hit.depth = other.depth - 1;
	}

	if hitbox_id == "attk1" or hitbox_id == "attk3"{
		other.speed = 0;
		attack1_hit = instance_create_layer(x, y-23, layer+1, o_player_sword_melee_hit);
		attack1_hit.image_speed = is_SLOW_MODE;
		attack1_hit.x = other.x+(offset * -creator.image_xscale);
		attack1_hit.y = other.y-20;
		attack1_hit.image_angle = other.image_xscale < 0 ? -360 : 180;
		attack1_hit.depth = other.depth - 1;	
	}	

	// var bs = instance_create_layer(x, y-23, layer, o_blood_splatter);
	// with(bs){
	// 	image_xscale = other.image_xscale;
	// 	direction = other.direction;
	// }

	other.knockback_speed = knockback;

	if other.state == "parry" {
		if other.image_index < 2  { //default = 2
				audio_play_sound(player_parry, 1, false);
				death_sprite = instance_create_layer(x, y, "projectiles",death_hit_sprite);
				death_sprite.image_speed = is_SLOW_MODE;
				death_sprite.x = other.x - (10 * image_xscale);
				death_sprite.y = other.y-23;
				death_sprite.image_angle = irandom(360)	;
				show_debug_message("mob attack prefectly parried");
		} else {
			with(o_Player){
				//TODO: add another parry sound for non-perfect parry
				randomize();
				// audio_play_sound(choose(_1,_2,_3,_4,_5,_6,_7,_8,_9,_10,_11,_12), 1, false);
				audio_play_sound(_10, 1, false);
				knockback_state(s_idle, "idle");
			}
			other.hp -= damage/2;
		}

	} else {
		other.hp -= damage;
		other.state = "knockback";

		hit_instance = instance_create_layer(x, y-23, layer+1, o_hit_sprite);
		hit_instance.image_speed = is_SLOW_MODE;
		hit_instance.x = other.x;
		hit_instance.y = other.y-23;
		hit_instance.direction = random(360);
		hit_instance.image_index = 0;
		hit_instance.depth = other.depth - 1;

		randomize();
		// audio_play_sound(choose(_1,_2,_3,_4,_5,_6,_7,_8,_9,_10,_11,_12), 1, false);
		audio_play_sound(_10, 1, false);

		if o_Player.GORE_MODE {
			repeat(2){
				randomize();
				blud = instance_create_layer(x, y, layer,oBlood);
				blud.image_speed = is_SLOW_MODE;
				blud.x = other.x
				blud.y = other.y  //default 0,48
				blud.direction = irandom(180); //default 360
			}
		}
	}

	if o_Player.CONTRAST_HIT_MODE {
		var effect2 = fx_create("_filter_contrast");
		fx_set_parameter(effect2, "g_ContrastIntensity", 2);
		layer_set_fx("Instances", effect2);
	}
			// var bs = instance_create_layer(other.x, other.y-23, layer, o_blood_splatter);
			// with(bs){
			// 	image_xscale = o_Player.image_xscale;
			// 	direction = o_Player.direction;
			// }

if instance_exists(oCamera) oCamera._xyshake = true;

//TODO: uncomment this shit to add damage text
// dmg_text = instance_create_layer(other.x, other.y-50, layer, o_dmg_text);
// with(dmg_text){
// 	x = other.x + (23 * other.image_xscale);
// 	y = other.y-50;
// 	active = true;
// 	dmg_text = other.damage;
// }	

ds_list_add(hit_objects, other);

if instance_exists(o_Player) and creator.object_index == o_Player and other.hp <= 0 {

	if o_Player.GORE_MODE {
		repeat(10){
			randomize();
			blud = instance_create_layer(x, y, layer,oBlood);
			blud.image_speed = is_SLOW_MODE;
			blud.x = other.x;
			blud.y = other.y;   //default 0,48
			blud.direction = irandom(360); //default 360
		}
	}

	o_Player.kills += 1;
    o_Player.consecutiveKills += 1;

    if o_Player.ANNOUNCER_MODE {
		audio_stop_all();
		switch (o_Player.consecutiveKills) {
		    case 2:
		        audio_play_sound(Double_Kill, 1, false);
		        break;
		    case 3:
		        audio_play_sound(triple_kill, 1, false);
		        break;
		    case 4:
		        audio_play_sound(UltraKill, 1, false);
		        break;
		    case 5:
		        audio_play_sound(Rampage, 1, false);
		        break;
		    default:
		        // If there are no consecutive kills, play based on total kills
		        if (o_Player.consecutiveKills >= 6) {
		            audio_play_sound(Rampage, 1, false); // Play Rampage sound for 6 or more consecutive kills
		        } else {
			        switch (o_Player.kills) {
			            case 1:
			                if (!o_Player.firstBloodPlayed) {
			                    audio_play_sound(firstblood, 1, false);
			                    o_Player.firstBloodPlayed = true;
			                }
			                break;
			            case 2:
			                //do nothing
			                break;    
			            case 3:
			                audio_play_sound(Killing_Spree, 1, false);
			                break;
			            case 4:
			                audio_play_sound(Dominating, 1, false);
			                break;
			            case 5:
			                audio_play_sound(Unstoppable, 1, false);
			                break;
			            case 6:
			                audio_play_sound(MonsterKill, 1, false);
			                break;
			            case 7:
			                audio_play_sound(MegaKill, 1, false);
			                break;
			            case 8:
			                audio_play_sound(WhickedSick, 1, false);
			                break;
			            case 9:
			                audio_play_sound(GodLike, 1, false);
			                break;
			            case 10:
			                audio_play_sound(Ownage, 1, false);
			                break;
			            default:
			                audio_play_sound(Ownage, 1, false);
			                break;
			        }
			        break;
			     }
		}
		o_Player.timer = o_Player.timer_max;
	}
}
