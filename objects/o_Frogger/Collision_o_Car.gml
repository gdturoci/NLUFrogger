///@desc Die and respawn
--p_lives;
if (p_lives)
	y = lanes[13];
else {
	sprite_index = s_FroggerDead;
	depth = 101;
}