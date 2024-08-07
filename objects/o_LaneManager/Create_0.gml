///@desc Init
randomize();
//Lanes - an array containing the y coordinates of each lane
lanes = array_create(NUM_LANES);
for (var i=0; i<NUM_LANES; ++i)
	lanes[i] = 24+(i*16);
	
//Lane timers - how long each lane should go before spawning another obstacle
lane_timers = array_create(NUM_LANES);
for (var i=0; i<NUM_LANES; ++i) {
	if (1 < i and i < 7)
		lane_timers[i] = irandom(SEC);
	else if (7 < i and i < 13)
		lane_timers[i] = irandom(10);
}
	
creation = -1;