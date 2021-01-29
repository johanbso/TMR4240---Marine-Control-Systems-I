%--------Thrust allocation algorithms-------%
B_u = [0 0 1 0 1 0 1 0 1;
       1 1 0 1 0 1 0 1 0;
       39.3 35.3 0 31.3 0 -28.5 5 -28.5 -5]; %Extended B matrix
 
 
 
W = diag([1 10 10 10 10 10 10 10 10]); %Weight-matrix
epsilon = 0.1; %regulation parameter
B_pseudo = inv(W)*B_u'*inv(B_u*inv(W)*B_u' + epsilon.*eye(3)); %Damped least squares inverse
%B_pseudo = pinv(B_u);
