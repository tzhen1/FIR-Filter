function B = firwd(N, Ftype, WnL, WnH, Wtype)
% B = firwd(N, Ftype, WnL, WnH, Wtype)
% FIR filter design using the window function method.

% Input parameters:
% N: num of the FIR filter taps (odd number)
% Ftype: the filter type. 1=Lowpass, 2=Highpass, 3=Bandpass, 4=Band reject
% WnL: lower cutoff freq in rads/sample. Set WnL=0 for the HPF
% WnH: upper cutoff freq in rads/sample. Set WnH=0 for the LPF
% Wtype: window type: 1=Rectangular, 2=Triangular, 3=Hanning, 4=Hamming, 5=Blackman
% Output:
% B: FIR filter coefficients

M = (N - 1)/2; % Filter size, N = 2M+1

% Filter coefficients for upper filter
hH = sin(WnH* [-M:1:-1])./([-M:1:-1]*pi);
hH(M + 1) = WnH/pi;
hH(M + 2:1:N) = hH(M:-1:1);
% Filter coefficients for lower filter
hL = sin(WnL*[-M:1:-1])./([-M:1:-1]*pi);
hL(M + 1) = WnL/pi;
hL(M + 2:1:N) = hL(M:-1:1);

% Choose filter type
if Ftype == 1 % Lowpass
h(1: N) = hL(1: N);
end

if Ftype == 2 % Highpass
h(1: N) = -hH(1:N);
h(M + 1) = 1 + h(M + 1);
end

if Ftype ==3 % Bandpass
h(1: N) = hH(1: N) - hL(1: N);
end

if Ftype == 4 % Band reject (band stop)
h(1: N) = hL(1: N) - hH(1: N);
h(M + 1) = 1 + h(M + 1);
end

% window functions;
if Wtype ==1 % Rectangular window
w(1:N)=ones(1,N);
end

if Wtype==2 % Triangular window;
w = 1 - abs([-M:1:M])/M;
end

if Wtype==3 % Hanning window;
w = 0.5 + 0.5*cos([-M:1:M]*pi/M);
end

if Wtype==4 % Hamming window;
w = 0.54 + 0.46*cos([-M:1:M]*pi/M);
end

if Wtype==5 % Blackman window;
w = 0.42 + 0.5*cos([-M:1:M]*pi/M) + 0.08*cos(2*[-M:1:M]* pi/M);
end

% Return filter h multiplied by window w
B = h.*w;