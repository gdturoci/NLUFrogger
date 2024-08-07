///@desc Gameplay
if (!g_o and !win) {
	#region Movement
	//Up
	if ((keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up)) and y > lanes[0]) {
		y -= 16;
		image_angle = 0;
		++moves;
		if (y < max_y) {
			max_y = y;
			p_score += 100;
		}
	}
	//Down
	if ((keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down)) and y < lanes[13]) {
		y += 16;
		image_angle = 180;
		++moves;
	}
	//Left
	if ((keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left)) and x > 16) {
		x -= 16;
		image_angle = 90;
		++moves;
	}
	//Right
	if ((keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right)) and x < 240) {
		x += 16;
		image_angle = 270;
		++moves;
	}
	#endregion eo Movement

	#region Water
	//If we are in the water and not touching anything, then die
	if (y <= lanes[6] and y >= lanes[2] and !place_meeting(x, y, [o_Log, o_Turtle])) {
		--p_lives;
		if (p_lives) {
			y = lanes[7];
			x = 136;
		}
	}
	if (y == lanes[1] and ((16 < x and x < 48) or (80 < x and x < 112) or (144 < x and x < 176) or (208 < x and x < 240))) {
		--p_lives;
		if (p_lives) {
			y = lanes[7];
			x = 136;
		}
	}
	#endregion eo Water

	//Count the timer down
	--time_remaining;

	//Game over?
	if (!time_remaining or !p_lives)
		g_o = true;
		
	//Win?
	if (y == lanes[0] and !win) {
		win = true;
		//Calculate score
		p_score = time_remaining;
		p_score += p_lives*250;
		p_score -= moves*25;
	}
}

if ((g_o or win) and keyboard_check_released(vk_enter))
	PInit();