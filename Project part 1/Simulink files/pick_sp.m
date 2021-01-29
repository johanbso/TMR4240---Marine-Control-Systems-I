sim_choice = 4;
ref_model_on = 1;


corner_test = 0;
if (sim_choice == 1)
    curr_const = 1;
    curr_vel = 0.5;
    setpoint = [0,0,0];
elseif (sim_choice == 2)
    curr_const = 0;
    curr_vel = 0.5;
    setpoint = [0,0,0];
elseif (sim_choice == 3)
    curr_const = 1;
    curr_vel = 0;
    setpoint = [10,10,1.5*pi];
elseif (sim_choice == 4)
    curr_const = 1;
    curr_vel = 0;
    corner_test = 1;
    corners = [0,0,0;50,0,0;50,-50,0;50,-50,-pi/4;0,-50,-pi/4;0,0,0];
end

disp('Reference set')