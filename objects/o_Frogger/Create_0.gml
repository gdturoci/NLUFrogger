///@desc Init
function PInit() {
	p_lives = 3;
	p_score = 0;
	moves = 0;
	
	sprite_index = s_Frogger;
	depth = 0;
	
	//Start on the 14th lane
	x = 136;
	y = lanes[13];
	max_y = y;

	//Give the player 60(?) seconds to finish the game
	time_remaining = SEC*60;

	//Game over
	g_o = false;
	win = false;
}

//Lanes - an array containing the y coordinates of each lane
lanes = array_create(NUM_LANES);
for (var i=0; i<NUM_LANES; ++i)
	lanes[i] = 24+(i*16);


PInit();