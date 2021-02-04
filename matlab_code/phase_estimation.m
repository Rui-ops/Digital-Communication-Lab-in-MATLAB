snrfunction phihat = phase_estimation(r, b_train)
% phihat = phase_estimation(r, b_train)
%
% Phase estimator using the training sequence. The phase estimate is
% obtained by minimizing the norm of the difference between the known
% transmitted QPSK-modulated training sequence and the received training
% part. NB! There are other ways of estimating the phase, this is just
% one example.
%
% Input:
%   r       = received baseband signal
%   b_train = the training sequence bits
%
% Output:
%   phihat     = estimated phase

b_train_c=qpsk(b_train);
temp_ang=0;
for i=1:length(b_train_c)
    temp_ang=temp_ang+angle(r(i)*conj(b_train_c(i)));
end
phihat=temp_ang/length(b_train_c);
