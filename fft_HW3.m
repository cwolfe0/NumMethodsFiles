% fft_HW3.m
% this m file computes the Fourier Transform of a given input signal (y), 
% with a sampling rate, fs and N number of data points
%
% MAE 311 Principles of Measurement and Instrumentation
% HW 3 Problem 1

clear all
close all

fs=15;     % ***** sampling rate 
          % Change fs based on your answer to Problem 1a
N=64;     % ***** number of data points in sample
          % Change N based on your answer to Problem 1b

dt=1/fs;      % time between samples
fNyq=fs/2;    % Nyquist frequency
df=fs/N;      % delta f the frequency spacing
t=0:dt:N*dt;  % sampling range
f=0:df:fNyq;  % frequency range


% ***** Modify the y equation based on information supplied in Problem 1
y=5*sin(132*t-4)+7*sin(749*t+1)+6*sin(2*pi*65*t)+3;	% signal equation


% Compute Fourier Transform
Y=fft(y);		          % compute fourier transform
n=size(y,2)/2;		    % second half are complex conjugates
amp_spec = abs(Y)/n;	% takes the absolute value and normalizes fft data


% Figure showing signal and fft
figure
subplot(2,1,1)				% first of two plots in same figure is time domain
set(gca,'fontsize',14)
plot(t,y,'*-'); 
grid on					
xlabel('Time (s)','fontsize',14)
ylabel('Amplitude','fontsize',14)

subplot(2,1,2)				% second plot is frequency domain
set(gca,'fontsize',14)
plot(f,amp_spec(1:(floor(N/2)+1)),'*-'); 
grid on	
xlabel('Frequency (Hz)','fontsize',14)
ylabel('Amplitude','fontsize',14)

