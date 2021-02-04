function d = qpsk(b)
% d = qpsk(b)
%
% Map the bits to be transmitted into QPSK symbols using Gray coding. The
% resulting QPSK symbol is complex-valued, where one of the two bits in each
% QPSK symbol affects the real part (I channel) of the symbol and the other
% bit the imaginary part (Q channel). Each part is subsequently PAM
% modulated to form the complex-valued QPSK symbol. The energy per QPSK
% symbol is normalized to unity.
%
% The mapping resulting from the two PAM branches are:
%
% complex part (Q channel)
%         ^
%         |
%  10 x   |   x 00   (odd bit, even bit)
%         |
%  -------+------->  real part (I channel)
%         |
%  11 x   |   x 01
%         |
%
%
%
% Input:
%   b = bits {0, 1} to be mapped into QPSK symbols
%
% Output:
%   d = complex-valued QPSK symbols
%b=randi([0,1],[1,20]);
d=zeros(1,length(b)/2);
for i=1:(length(d))
    if b(2*i-1)== 0
        if b(2*i)==0
            d(i)=sqrt(2)/2+sqrt(2)/2*1i;
        else d(i)=sqrt(2)/2-sqrt(2)/2*1i;
        end
    else if b(2*i)==0
            d(i)=-sqrt(2)/2+sqrt(2)/2*1i;
        else d(i)=-sqrt(2)/2-sqrt(2)/2*1i;
        end
    end
end

