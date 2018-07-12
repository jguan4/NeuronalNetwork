%       1  2  3  4  5  6  7   8  9  10  11 12  13  14 15  16  17  18  19
% Ks - [k1 k2p k3 k4 k5 k6p k7 k7r k8 k8r kp ki kir kur ku kur2 ku2 kwr kw 
%       20  21 22 23  24  25   26 27  28 29  30  31   32  33   34  35
%       kcr kc V2 V2p V25 V25p V6 V6p Vw Vwp Kmc Kmcr Kmi Kmir Kmp Kmu
%       36   37   38    39  40   41    42  43  44
%       Kmur Kmu2 Kmur2 Kmw Kmwr alpha beta mu Cig1]
%       1     2   3   4   5  6   7    8   9  10 11  12   13
% y - [Cdc25 G1K G1R G2K G2R IE mass PG2 PG2R R UbE UbE2 Wee1]

function z=ydotCellCycle(Ks,varNum,t,y)
N=size(y,1);
z=zeros(N,13*varNum);

% Previous trajectories
preCdc25=y(:,1:varNum);
preG1K=y(:,varNum+1:2*varNum);
preG1R=y(:,2*varNum+1:3*varNum);
preG2K=y(:,3*varNum+1:4*varNum);
preG2R=y(:,4*varNum+1:5*varNum);
preIE=y(:,5*varNum+1:6*varNum);
premass=y(:,6*varNum+1:7*varNum);
prePG2=y(:,7*varNum+1:8*varNum);
prePG2R=y(:,8*varNum+1:9*varNum);
preR=y(:,9*varNum+1:10*varNum);
preUbE=y(:,10*varNum+1:11*varNum);
preUbE2=y(:,11*varNum+1:12*varNum);
preWee1=y(:,12*varNum+1:13*varNum);

% Constants
k1=repmat(Ks(:,1)',N,1);
k2p=repmat(Ks(:,2)',N,1);
k3=repmat(Ks(:,3)',N,1);
k4=repmat(Ks(:,4)',N,1);
k5=repmat(Ks(:,5)',N,1);
k6p=repmat(Ks(:,6)',N,1);
k7=repmat(Ks(:,7)',N,1);
k7r=repmat(Ks(:,8)',N,1);
k8=repmat(Ks(:,9)',N,1);
k8r=repmat(Ks(:,10)',N,1);
kp=repmat(Ks(:,11)',N,1);
ki=repmat(Ks(:,12)',N,1);
kir=repmat(Ks(:,13)',N,1);
kur=repmat(Ks(:,14)',N,1);
ku=repmat(Ks(:,15)',N,1);
kur2=repmat(Ks(:,16)',N,1);
ku2=repmat(Ks(:,17)',N,1);
kwr=repmat(Ks(:,18)',N,1);
kw=repmat(Ks(:,19)',N,1);
kcr=repmat(Ks(:,20)',N,1);
kc=repmat(Ks(:,21)',N,1);
V2=repmat(Ks(:,22)',N,1);
V2p=repmat(Ks(:,23)',N,1);
V25=repmat(Ks(:,24)',N,1);
V25p=repmat(Ks(:,25)',N,1);
V6=repmat(Ks(:,26)',N,1);
V6p=repmat(Ks(:,27)',N,1);
Vw=repmat(Ks(:,28)',N,1);
Vwp=repmat(Ks(:,29)',N,1);
Kmc=repmat(Ks(:,30)',N,1);
Kmcr=repmat(Ks(:,31)',N,1);
Kmi=repmat(Ks(:,32)',N,1);
Kmir=repmat(Ks(:,33)',N,1);
Kmp=repmat(Ks(:,34)',N,1);
Kmu=repmat(Ks(:,35)',N,1);
Kmur=repmat(Ks(:,36)',N,1);
Kmu2=repmat(Ks(:,37)',N,1);
Kmur2=repmat(Ks(:,38)',N,1);
Kmw=repmat(Ks(:,39)',N,1);
Kmwr=repmat(Ks(:,40)',N,1);
alpha=repmat(Ks(:,41)',N,1);
beta=repmat(Ks(:,42)',N,1);
mu=repmat(Ks(:,43)',N,1);
Cig1=repmat(Ks(:,44)',N,1);

% Rate functions
k2=V2p.*(1-preUbE)+V2.*preUbE;
k6=V6p.*(1-preUbE2)+V6.*preUbE2;
kwee=Vwp.*(1-preWee1)+Vw.*preWee1;
k25=V25p.*(1-preCdc25)+V25.*preCdc25;

MPF=preG2K+beta.*prePG2;
SPF=MPF+alpha.*preG1K+Cig1;

% d[Cdc25]/dt 
z(:,1:varNum)=(kc.*MPF.*(1-preCdc25))./(Kmc+1-preCdc25)-...
    (kcr.*preCdc25)./(Kmcr+preCdc25);
% d[G1K]/dt
z(:,varNum+1:2*varNum)=k5-(k6+k8.*preR).*preG1K+(k8r+k4).*preG1R;
% d[G1R]/dt
z(:,2*varNum+1:3*varNum)=k8.*preR.*preG1K-(k8r+k4+k6p).*preG1R;
% d[G2K]/dt
z(:,3*varNum+1:4*varNum)=k1-(k2+kwee+k7.*preR).*preG2K+...
    k25.*prePG2+(k7r+k4).*preG2R;
% d[G2R]/dt
z(:,4*varNum+1:5*varNum)=k7.*preR.*preG2K-(k7r+k4+k2+k2p).*preG2R;
% d[IE]/dt
z(:,5*varNum+1:6*varNum)=(ki.*MPF.*(1-preIE))./(Kmi+1-preIE)-...
    (kir.*preIE)./(Kmir+preIE);
% d[mass]/dt
z(:,6*varNum+1:7*varNum)=mu.*premass;
% d[PG2]/dt
z(:,7*varNum+1:8*varNum)=kwee.*preG2K-(k25+k2+k7.*preR).*...
    prePG2+(k7r+k4).*prePG2R;
% d[PG2R]/dt
z(:,8*varNum+1:9*varNum)=k7.*preR.*prePG2-(k7r+k4+k2+k2p).*prePG2R;
% d[R]/dt
z(:,9*varNum+1:10*varNum)=k3-k4.*preR-(kp.*preR.*SPF.*premass)./(Kmp+preR)-...
    k7.*preR.*(preG2K+prePG2)+(k7r+k2+k2p).*(preG2R+prePG2R)-k8.*preR.*preG1K+...
    (k8r+k6p).*preG1R;
% d[UbE]/dt
z(:,10*varNum+1:11*varNum)=(ku.*preIE.*(1-preUbE))./(Kmu+1-preUbE)-...
    (kur.*preUbE)./(Kmur+preUbE);
% d[UbE2]/dt
z(:,11*varNum+1:12*varNum)=(ku2.*MPF.*(1-preUbE2))./(Kmu2+1-preUbE2)-...
    (kur2.*preUbE2)./(Kmur2+preUbE2);
% d[Wee1]/dt
z(:,12*varNum+1:13*varNum)=(kwr.*(1-preWee1))./(Kmwr+1-preWee1)-...
    (kw.*MPF.*preWee1)./(Kmw+preWee1);