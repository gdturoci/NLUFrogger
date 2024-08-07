///@desc Init

//Our velocity depends on our direction and placement
if (144 < y and y < 176)
	vel = random_range(4.25, 5);
else
	vel = random_range(3.5, 4.5);

//Going left when dir(ection) = -1
vel *= dir;

//Randomly decide between regular or long cars
sprite_index = irandom(1) ? s_Car : s_LongCar;
image_xscale = dir ? -1 : 1;