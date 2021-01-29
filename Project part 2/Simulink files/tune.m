clc

%Reference model parameters
zeta = 1;
w_n = [0.08,0.04,0.03];

%Ship parameters and controller (Fossen)
%m_ship = vessel.main.m;
%wb = 0.1;
%wn = 1.554*wb;
%Kp = m_ship*wn^2;
%Kd = 2*zeta*wn*m_ship;
%Ki = 0.1*wn*Kp;
%---interesting numbers---%
% Kp = [1e+04,5e+05,2e+07];
% Kd = [1e+07,1e+07,2.01e+08];
% Ki = [0.5e+01,2e+02,1e+02];
% -----Best so far-------%
% %Controller (self tuned)
% Kp = [1e+04,5e+05,1e+07];
% Kd = [0.9e+07,1e+07,2.01e+07];
% Ki = [1.5e+02,2e+02,1e+02];


%Controller (self tuned)
Kp = [1e+05,5e+05,1e+07];
Kd = [1e+07,1e+07,2.01e+08];
Ki = [2e+02,2e+02,1e+02];
disp('System tuned');