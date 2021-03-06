function Hd = filter_1MHz
%FILTER_1MHZ Returns a discrete-time filter object.

%
% M-File generated by MATLAB(R) 7.10 and the Signal Processing Toolbox 6.13.
%
% Generated on: 04-Oct-2011 21:48:52
%

% Equiripple Bandpass filter designed using the FIRPM function.

% All frequency values are in MHz.
Fs = 51.1;  % Sampling Frequency

Fstop1 = 5.2;             % First Stopband Frequency
Fpass1 = 5.5;             % First Passband Frequency
Fpass2 = 6.5;             % Second Passband Frequency
Fstop2 = 6.7;             % Second Stopband Frequency
Dstop1 = 0.031622776602;  % First Stopband Attenuation
Dpass  = 0.057501127785;  % Passband Ripple
Dstop2 = 0.031622776602;  % Second Stopband Attenuation
dens   = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                          0], [Dstop1 Dpass Dstop2]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
