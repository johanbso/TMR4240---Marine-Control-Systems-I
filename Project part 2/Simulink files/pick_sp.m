%sim_choice = 1;
ref_model_on = 1;
observer_on = 1;
use_kalman = 1;
constant_dp = 0;

corners = [0,0,0;50,0,0;50,-50,0;50,-50,-pi/4;0,-50,-pi/4;0,0,0];
corner_test = 0;
setpoint=[0,0,0];

% Environmentals. Default values equal to sim1
wind_mean_dir = 180;
wind_mean_vel = 10;
curr_mean_dir = 270;
curr_mean_vel = 0.2;
wave_mean_dir = 225;
wave_height = 2.5;
wave_peak_T = 9;


if (sim_choice == 1)
    %Zero controller action for this sim
    assignin('base','Kp', zeros(1,3));
    assignin('base','Ki', zeros(1,3));
    assignin('base','Kd', zeros(1,3));    
    assignin('base','setpoint', [0,0,0])
elseif (sim_choice == 2)
    assignin('base','corner_test',1);
elseif (sim_choice == 3)
    assignin('base','corner_test',1);
elseif (sim_choice == 4)
    assignin('base','corner_test',0);
    assignin('base','constant_dp',1);
elseif (sim_choice == 5)
    assignin('base','corner_test',1);
elseif (sim_choice == 6)
    % Environmentals 
    wind_mean_vel = 15;
    curr_mean_vel = 0.2;
    wave_height = 5;
    wave_peak_T = 10;
    assignin('base','corner_test',0); 
elseif (sim_choice == 7)
    % Environmentals 
    wave_height = 8;
    wave_peak_T = 13;
    assignin('base','corner_test',0); 
end


disp('Reference set')

