fs = 8000;
Ftype = 3; % BPF
Wtype = 4; % Hamming window
WnL = (500/1903)*pi; % cuttoff in rads for LPF
WnH = (1000/1379)*pi; % cuttoff in rads for HPF
N = 25;

B = firwd(N, Ftype, WnL, WnH, Wtype); % use function script to create filter
freqz(B,1,512,fs); % plot mag and phase resp
axis([0 fs/2 -130 10]); % f=0 to fs/2, mag = -130dB to +10dB