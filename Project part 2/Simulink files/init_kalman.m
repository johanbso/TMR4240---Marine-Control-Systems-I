%Kalman filter initialization

omega_peak = 2*pi/wave_peak_T;
% Frequency matrix
Omega = diag([omega_peak,omega_peak,omega_peak]);
% Damping. Said to be in range 0.05-0.1 (Sørensen, 2018)
Lambda= diag([0.07,0.07,0.07]); 
% Disturbance 
Kw = diag([0.01,0.01,0.01]);

% Wave SS-model
Aw = [zeros(3,3),eye(3);-(Omega^2),-2*Lambda*Omega];
Ew = [zeros(3,3);Kw];
Cw = [zeros(3,3), eye(3)];

% Tunable weight matrices
% Bias time constants. 
Tb = diag([1000,1000,1000]);
% White noise matrix. Yaw seems most affected
Eb = diag([1e2,1e5,1e5]);
% Covariance for wave-induced force
Q1 = [1 1 1];
% Covariance for current&wind forces
Q2 = [1 1 1].*10^4;
% Q - How good is the model?
Q = diag([Q1 Q2]);
% R - How good are the measurements?
R_KF = diag([0 0 0]);

% Constant SS-matrices
B_KF = [zeros(12,3);inv(M)];
E = [Ew, zeros(6,3); zeros(3,6); zeros(3,3) Eb; zeros(3,6)];
H = [Cw, eye(3),zeros(3,6)];

Phi_stack = zeros(15,15,360);
Delta_stack = zeros(15,3,360);
Gamma_stack = zeros(15,6,360);

% Linearize rotation matrix around every whole degree
for ang_deg = 0:1:359
    ang = ang_deg*pi/180;
    R = [cos(ang), -sin(ang) 0; sin(ang) cos(ang) 0; 0 0 1];
    A = [Aw, zeros(6,9); 
        zeros(3,12), R; 
        zeros(3,9), -inv(Tb), zeros(3,3); 
        zeros(3,9), inv(M)*(R'), -inv(M)*D]; 
    
    % Discretize with 0.1s sample time (same as simulink time step)
    [~,Delta]   = c2d(A,B_KF,0.1);
    [Phi,Gamma] = c2d(A,E,0.1);
    
    % Save to 15x15x360 arrays for use by EKF during sim
    Phi_stack(:,:,ang_deg+1) = Phi;
    Delta_stack(:,:,ang_deg+1) = Delta;
    Gamma_stack(:,:,ang_deg+1) = Gamma;
end