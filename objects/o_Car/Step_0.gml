///@desc Nyoom

x+=vel;

if ((dir and x > room_width+32) or (!dir and x < -32))
	instance_destroy(self);