clc
%L=1000;
snr_dB = [-9.6,-7.8,-9,-4.1,-7.9,-3.2,-8,-10,-9.5,-10.2,-4.5,-8.3,-3.6,-9.1,-7.9,-8.5,-3,-4.4,-10.1,-8.2]; % SNR in decibels
label = [1,1,1,-1,1,-1,1,1,1,-1,1,1,-1,1,1,1,-1,-1,1,1];
energyvec = zeros(1,L+1);
energySum= label';
energySum = [energySum, snr_dB'];
for k=1:1000   %iteration for 1000 sample
    eSUM=zeros(length(snr_dB),1);
for juser=1:length(snr_dB)
 n = randn(1,L); %AWGN noise with mean 0 and variance 1
 snr = 10.^(snr_dB(juser)./10); 
 s = sqrt(snr).*randn(1,L); % Real valued Gaussina Primary User Signal 
 y = s + n; % Received signal at SU
 energy=(abs(y).^2).*100; % Energy of received signal over N samples
 eSUM(juser) =(1/L).*sum(energy);

end
energySum = [energySum, eSUM];
end
csvwrite('AY1.csv', energySum) 