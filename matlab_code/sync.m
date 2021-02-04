function t_samp = sync(mf, b_train, Q, t_start, t_end)
% t_samp = sync(mf, b_train, Q, t_start, t_end)
%
% Determines when to sample the matched filter outputs. The synchronization
% algorithm is based on cross-correlating a replica of the (known)
% transmitted training sequence with the output from the matched filter
% (before sampling). Different starting points in the matched filter output
% are tried and the shift yielding the largest value of the absolute value
% of the cross-correlation is chosen as the sampling instant for the first
% symbol.
%
% Input:
%   mf            = matched filter output, complex baseband, I+jQ
%   b_train       = the training sequence bits
%   Q             = number of samples per symbol
%   t_start       = start of search window
%   t_end         = end of search window
%
% Output:
%   t_samp = sampling instant for first symbol

temp=zeros(1,t_end-t_start+1);
b_train=qpsk(b_train);
for i=1:length(temp)
    temp_v=0;
    for k=0:length(b_train)-1
        temp_v=temp_v+conj(mf(k*Q+i+t_start-1))*b_train(k+1);
    end
    temp(i)=abs(temp_v);
end

[max_v,max_i]=max(temp);
t_samp=max_i+t_start-1;

