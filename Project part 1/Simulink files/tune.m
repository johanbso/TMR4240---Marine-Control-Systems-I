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

%Controller (self tuned, Fossen based)
Kp = [5e+05,5e+05,2e+07];
Kd = [1e+07,1e+07,2e+08];
Ki = [1e+02,3e+03,1e+02];

disp('System tuned');
