function [Ks]=cellCycleParameters
k1=0.015;
k3 = 0.09375;
k2p = 0.05;
k4 =0.1875; 
k5 = 0.00175; 
k7 = 100; 
k7r = 0.1; 
k6p = 0; 
k8 = 10; 
k8r =0.1; 
kp = 3.25;
ki = 0.4; 
kir = 0.1; 
kur = 0.1;
ku = 0.2;
kur2 = 0.3;
ku2 = 1; 
kwr = 0.25; 
kw = 1; 
kcr = 0.25; 
kc = 1; 
V2 = 0.25; 
V2p = 0.0075;
V25 = 0.5; 
V25p = 0.025;
V6 = 7.5; 
V6p = 0.0375;
Vw = 0.35;
Vwp = 0.035; 
Kmcr = 0.1;
Kmc = 0.1;
Kmir = 0.01;
Kmi = 0.01; 
Kmp = 0.001;
Kmur = 0.01;
Kmu = 0.01; 
Kmur2 = 0.05;
Kmu2 = 0.05;
Kmwr = 0.1;
Kmw = 0.1; 
alpha = 0.25;
beta = 0.05;
mu = 0.00495; 
Cig1 = 0;
Ks=[k1,k2p,k3,k4,k5,k6p,k7,k7r,k8,k8r,kp,ki,kir,kur,ku,kur2,ku2,kwr,kw,...
    kcr,kc,V2,V2p,V25,V25p,V6,V6p,Vw,Vwp,Kmc,Kmcr,Kmi,Kmir,Kmp,Kmu,...
    Kmur,Kmu2,Kmur2,Kmw,Kmwr,alpha,beta,mu,Cig1];
%       1     2   3   4   5  6   7    8   9  10 11  12   13
% y - [Cdc25 G1K G1R G2K G2R IE mass PG2 PG2R R UbE UbE2 Wee1]
%    1 2 3 4 5 6 7 8 9 10 11 12 13
Adj=[1 0 0 1 0 0 0 1 0  0  0  0  0; % Cdc25
     0 1 1 0 0 0 0 0 0  1  0  1  0; % G1K
     0 1 1 0 0 0 0 0 0  1  0  0  0; % G1R
     1 0 0 1 1 0 0 1 0  1  1  0  1; % G2K
     0 0 0 1 1 0 0 0 0  1  1  0  0; % G2R
     0 1 0 1 0 1 0 1 0  0  0  0  0; % IE
     0 0 0 0 0 0 1 0 0  0  0  0  0; % mass
     1 0 0 1 0 0 0 1 1  1  1  0  1; % PG2
     0 0 0 0 0 0 0 1 1  1  1  0  0; % PG2R
     0 1 1 1 1 0 1 1 1  1  1  0  0; % R
     0 0 0 0 0 1 0 0 0  0  1  0  0; % UbE
     0 0 0 1 0 0 0 1 0  0  0  1  0; % UbE2
     0 0 0 1 0 0 0 1 0  0  0  0  1]; % Wee1
