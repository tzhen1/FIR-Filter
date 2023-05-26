% fs = 10000;
% Ftype = 3; % BPF
% Wtype = 4; % Hamming window = 4, 5 = blackman
% WnL = (21/80)*pi; % cuttoff in rads for LPF
% WnH = (29/40)*pi; % cuttoff in rads for HPF
% N = 25; %25 ham, 41 for blackman
% 
% B = firwd(N, Ftype, WnL, WnH, Wtype); % use function script to create filter
% freqz(B,1,512,fs); % plot mag and phase resp
% axis([0 fs/2 -130 10]); % f=0 to fs/2, mag = -130dB to +10dB

fs = 0.005;
Ftype = 3; % BPF
Wtype = 4; % Hamming window = 4, 5 = blackman
WnL = pi; % cuttoff in rads for LPF
WnH = (90)*pi; % cuttoff in rads for HPF
N = 25; %25 ham, 41 for blackman

B = firwd(N, Ftype, WnL, WnH, Wtype) % use function script to create filter
freqz(B,1,512,fs); % plot mag and phase resp
axis([0 fs/2 -130 10]); % f=0 to fs/2, mag = -130dB to +10dB