///@desc Manage the lanes

//Every timer is always counting down
for (var i=0; i<NUM_LANES; ++i) {
	lane_timers[i]--;
	//Spawn obstacles
	if (!lane_timers[i]) {
		if (i==2 or i==3)
			lane_timers[i] = round(random_range(3, 4)*SEC);
		else if (3 < i and i < 7)
			lane_timers[i] = round(random_range(2, 3)*SEC);
		else if (i==8 or i==9)
			lane_timers[i] = round(random_range(.5, 1)*SEC);
		else if (9 < i and i < 13)
			lane_timers[i] = round(random_range(1, 1.5)*SEC);
	
		//Lanes 0, 1, 7, and 13 do nothing
		switch (i) {
			#region Water
			case 2:
			case 4:
			case 6: {
				//Spawn a log or turtles moving left
				creation = irandom(1) ? o_Turtle : o_Log;
				
				var max_spawns = irandom_range(2, 5);
				for (var j=0; j<max_spawns; ++j) {
					if (creation == o_Log) {
						if (!j)
							instance_create_depth(room_width+32+(j*16), lanes[i], depth, creation, { dir : -1, sprite_index : s_LogLeftEnd });
						else if (j==max_spawns-1)
							instance_create_depth(room_width+32+(j*16), lanes[i], depth, creation, { dir : -1, sprite_index : s_LogRightEnd });
						else
							instance_create_depth(room_width+32+(j*16), lanes[i], depth, creation, { dir : -1 });
					} else
						instance_create_depth(room_width+32+(j*16), lanes[i], depth, creation, { dir : -1 });
				}
			} break;
			
			case 3:
			case 5: {
				//Spawn a log or turtles moving right
				creation = irandom(1) ? o_Turtle : o_Log;
				var max_spawns = irandom_range(2, 5);
				for (var j=0; j<max_spawns; ++j) {
					if (creation == o_Log) {
						if (!j)
							instance_create_depth(-32-(j*16), lanes[i], depth, creation, { dir : 1, sprite_index : s_LogLeftEnd });
						else if (j==max_spawns-1)
							instance_create_depth(-32-(j*16), lanes[i], depth, creation, { dir : 1, sprite_index : s_LogRightEnd });
						else
							instance_create_depth(-32-(j*16), lanes[i], depth, creation, { dir : 1 });
					} else
						instance_create_depth(-32-(j*16), lanes[i], depth, creation, { dir : 1 });
				}
			} break;
			#endregion eo Water
			
			#region Road
			case 8:
			case 10:
			case 12:
				//Spawn a car or long car moving left
				instance_create_depth(room_width+32, lanes[i], depth, o_Car, { dir : -1 });
			break;
			
			case 9:
			case 11:
				//Spawn a car or long car moving right
				instance_create_depth(-32, lanes[i], depth, o_Car, { dir : 1 });
			break;
			#endregion eo Road
		}
	}
}
			
