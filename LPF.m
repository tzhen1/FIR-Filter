fs = 8000;
Ftype = 1; % LPF
Wtype = 1; % Rect window
WnL = pi/2; % cuttoff in rads
WnH = 0;
N = 25;

B = firwd(N, Ftype, WnL, WnH, Wtype); % use function script to create filter
freqz(B,1,512,fs); % plot mag and phase resp
axis([0 fs/2 -130 10]); % f=0 to fs/2, mag = -130dB to +10dB