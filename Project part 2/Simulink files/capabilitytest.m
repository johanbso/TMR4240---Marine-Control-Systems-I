% Simulate and plot thrust capability
% Initial mean directions. 

wave_mean_dir = 0; % rad
wind_mean_dir = 0; % rad
curr_mean_dir = 0; % deg


thrust_perc = zeros(36,1);


for i = 1:length(thrust_perc)
    
    % Simulate and save thrust data
    sim('part2',[0 1200],simset('SrcWorkspace','current','DstWorkspace','current'));
    
    % Evaluate mean total thrust and add to list
    thrust_mean =  mean(u_c(:,1:5));
    thrust_util = sum(thrust_mean)/(1090*1e3);
    thrust_perc(i) = thrust_util*100;
    
    % Increment angles and repeat
    wave_mean_dir = wave_mean_dir + (10*pi/180);
    wind_mean_dir = wind_mean_dir + (10*pi/180);
    curr_mean_dir = curr_mean_dir + 10;  
    
    disp(i);
end

figure(1)
polarplot(0:10:350,thrust_perc);
title('Thrust Capability Plot for varying environmental forces');

