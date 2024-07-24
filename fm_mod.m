clear all;
close all;
clc;
%% Frequency MODULATION of Triangular Signal
t = -0.04:1.e-4:0.04;
Ta = 0.01;
fc = 200;                                                           % Frequency of carrier
msg = msg1(t,Ta);                                            % Calling Function to Generate Msg Signal
%% MODULATION
kf = 160*pi;
m_int = kf*1.e-4*cumsum(msg);              % Integrating Msg
fm = cos(2*fc*pi*t + m_int);                   % fm = cos(2*pi*fc*t + integral(msg))
%% DEMODULATION (Using Differentiator)
dem = diff(fm);                 
dem = [0,dem];
rect_dem = abs(dem);
%% Filtering out High Frequencies
N = 80;                                                             % Order of Filter
Wn = 1.e-2;                                                    % Pass Band Edge Frequency.
a = fir1(N,Wn);                                             % Return Numerator of Low Pass FIR filter
b = 1;                                                                % Denominator of Low Pass FIR Filter
rec = filter(a,b,rect_dem);
%% Plotting signal in time domain
figure;
subplot(2,1,1);
plot(t,msg);
title('Message Signal');
xlabel('{\it t} (sec)');
ylabel('m(t)');
grid;
subplot(2,1,2);
plot(t,fm);
title('FM');
xlabel('{\it t} (sec)');
ylabel('FM');
grid;
figure;
subplot(2,1,1);
plot(t,rect_dem);
title('Rectified FM');
xlabel('{\it t} (sec)');
ylabel('dem')
grid;
subplot(2,1,2);
plot(t,rec);
title('Recovered Signal');
xlabel('{\it t} (sec)');
ylabel('m(t)');
grid;