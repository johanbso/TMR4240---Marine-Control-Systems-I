%%%% Observer initialization %%%%

%%% Sea state %%%
% wave_peak_T = 9; % set in pick_sp
omega_p = 2*pi/wave_peak_T; % Wave peak frequency [rad/s]
% Depend on sea state so must be declared here!
zeta_i = 0.05; % Relative damping ratio.

%%% Constant matrices %%%
% Bias time constant matrix(Fossen)
T_b = diag([1000 1000 1000]); 
% Frequency matrix
Omega = omega_p * eye(3);
% Relative damping ratio matrix
Lambda = zeta_i * eye(3); 
% WF system matrix
A_w = [zeros(3) eye(3);
    -(Omega^2) -2*Lambda*Omega]; 
% WF measurement matrix
C_w = [zeros(3) eye(3)]; 
% Mass(including added mass)+intertia matrix
M = [ 6.8177*10^6 0 0;
    0 7.8784*10^6 -2.5955*10^6;
    0 -2.5955*10^6 3.5710^9]; 
% Damping matrix
D = [2.648*10^5 0 0;
    0 8.8164*10^5 0;
    0 0 3.3774*10^8]; 


%%% Nonlinear Passive Observer %%%
%%% Tuning parameters %%%
zeta_i_nop = 0.1;
zeta_ni_nop = 1;
omega_ci_nop  = 1.2*omega_p; % cutoff frequency
%%% Gain matrices %%%

% Fossens proposed tuning method:
K1 = [-2*(zeta_ni_nop - zeta_i_nop)*(omega_ci_nop/omega_p)*eye(3); 
    2*omega_p*(zeta_ni_nop - zeta_i_nop)*eye(3)];
K2 = diag([omega_ci_nop omega_ci_nop omega_ci_nop]);
K4 = diag([0.1 0.1 0.01]);
K3 = 0.1*K4;

