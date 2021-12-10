clc;
clear all;
close all;

pf = 0:0.01:0.1;
pf = [pf, 0.15:.1/2:1];

M = 4;                  % modulation index for psk
hpsk = comm.PSKModulator('ModulationOrder',M,...
    'BitInput',false,...
    'PhaseOffset',0);   % M-psk modulator

nSample = 1000;         % samples in signal
pde = zeros(1,numel(pf)); % array for Pd



%hWait = waitbar(0,'please wait...');

%NORMALUSER
snrdb =   [-9.6,-10.8,-9,-7.9,-8,-9.5,-10.2,-10.3,-8.6,-9.1,-9.9,-8.5,-10.1,-8.2];
%L = numel(snrdb);
for m = 1:numel(pf)
    fd = 0;
    for user = 1:numel(snrdb)
        d = 0;
        for j = 1:1000
            infoSignal = randi(M,nSample,1)-1;
            txSignal = step(hpsk, infoSignal);
             rxSignal = awgn(txSignal,snrdb(user));
             snr = 10^(snrdb(user)./20);
             nvar = 1/snr ;
             N = length(rxSignal);
             noise = sqrt(0.1)*(randn(1,N)+user*randn(1,N));
             eSum = sum(abs(rxSignal).^2);
             thresh = sqrt(2*nSample*nvar^4)*qfuncinv(pf(m))+nSample*nvar^2;
             %thresh = (qfuncinv(pf(m))./sqrt(nSample))+2;
             if eSum > thresh
                d = d+1;
             end
        end
        fd = fd + d/1000;
    end
    pde(m) = fd/numel(snrdb);
end
%close(hWait);


figure()
plot(pf, pde,'-*','MarkerSize',4.5,'LineWidth',1.5)
hold on;



%ANMUs
snrdb = [-9.6,-7.8,-9,-14.1,-7.9,-15.2,-8,-17,-9.5,-10.2,-14.5,-8.3,-8.6,-9.1,-7.9,-8.5,-16,-15.4,-10.1,-8.2];
for m = 1:numel(pf)
    fd = 0;
    for user = 1:numel(snrdb)
        d = 0;
        for j = 1:1000
            infoSignal = randi(M,nSample,1)-1;
            txSignal = step(hpsk, infoSignal);
             rxSignal = awgn(txSignal,snrdb(user));
             snr = 10^(snrdb(user)./20);
             nvar = 1/snr ;
             N = length(rxSignal);
             noise = sqrt(0.1)*(randn(1,N)+user*randn(1,N));
             eSum = sum(abs(rxSignal).^2);
             thresh = sqrt(2*nSample*nvar^4)*qfuncinv(pf(m))+nSample*nvar^2;
             %thresh = (qfuncinv(pf(m))./sqrt(nSample))+2;
             if eSum > thresh
                d = d+1;
             end
        end
        fd = fd + d/1000;
    end
    pde(m) = fd/numel(snrdb);
end
%close(hWait);

plot(pf, pde,'-^','MarkerSize',4.5,'LineWidth',1.5)
hold on;



%AYMUS
snrdb = [-9.6,-7.8,-9,-4.1,-7.9,-5.2,-8,-3,-9.5,-10.2,-4.5,-8.3,-8.6,-9.1,-7.9,-8.5,-3.9,-4.4,-10.1,-8.2];

for m = 1:numel(pf)
    fd = 0;
    for user = 1:numel(snrdb)
        d = 0;
        for j = 1:1000
            infoSignal = randi(M,nSample,1)-1;
            txSignal = step(hpsk, infoSignal);
             rxSignal = awgn(txSignal,snrdb(user));
             snr = 10^(snrdb(user)./20);
             nvar = 1/snr ;
             N = length(rxSignal);
             noise = sqrt(0.1)*(randn(1,N)+user*randn(1,N));
             eSum = sum(abs(rxSignal).^2);
             thresh = sqrt(2*nSample*nvar^4)*qfuncinv(pf(m))+nSample*nvar^2;
             %thresh = (qfuncinv(pf(m))./sqrt(nSample)) +2 ;
             if eSum > thresh
                d = d+1;
             end
        end
        fd = fd + d/1000;
    end
    pde(m) = fd/numel(snrdb);
end
plot(pf, pde,'-o','MarkerSize',4.5,'LineWidth',1.5)
hold on;


%RMUS
snrdb = [-9.6,-7.8,-9,-4.1,-7.9,-5.1,-8,-17,-9.5,-10.2,-4.5,-8.3,-8.6,-9.1,-7.9,-8.5,-16.9,-16.4,-10.1,-8.2];
for m = 1:numel(pf)
    fd = 0;
    for user = 1:numel(snrdb)
        d = 0;
        for j = 1:1000
            infoSignal = randi(M,nSample,1)-1;
            txSignal = step(hpsk, infoSignal);
             rxSignal = awgn(txSignal,snrdb(user));
             snr = 10^(snrdb(user)./20);
             nvar = 1/snr ;
             N = length(rxSignal);
             noise = sqrt(0.1)*(randn(1,N)+user*randn(1,N));
             eSum = sum(abs(rxSignal).^2);
             thresh = sqrt(2*nSample*nvar^4)*qfuncinv(pf(m))+nSample*nvar^2;
             %thresh = (qfuncinv(pf(m))./sqrt(nSample)) +2 ;
             if eSum > thresh
                d = d+1;
             end
        end
        fd = fd + d/1000;
    end
    pde(m) = fd/numel(snrdb);
end
plot(pf, pde,'-s','MarkerSize',4.5,'LineWidth',1.5)

xlabel 'P_{FC}^f :: Probability of False Alarm'
ylabel 'P_{FC}^d :: Probability of Detection'
grid 'on'
legend('Proposed SVM Algorithm Scheme','with ANMUs',' with AYMUs','with RMUs');
grid on
