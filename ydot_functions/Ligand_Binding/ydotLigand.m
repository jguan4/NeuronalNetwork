%        1  2  3   4   5   6   7   8
% Ks - [kon kD kt Bmax ke kex kdi kde]
%       1   2      3        4         5      6
% y - [Epo EpoR Epo_EpoR Epo_EpoR_i dEpo_i dEpo_e]

function z=ydotLigand(Ks,varNum,t,y)
N=size(y,1);
z=zeros(N,6*varNum);

preEpo=y(:,1:varNum);
preEpoR=y(:,varNum+1:2*varNum);
preEpo_EpoR=y(:,2*varNum+1:3*varNum);
preEpo_EpoR_i=y(:,3*varNum+1:4*varNum);
predEpo_i=y(:,4*varNum+1:5*varNum);
predEpo_e=y(:,5*varNum+1:6*varNum);

kon=repmat(Ks(:,1)',N,1);
kD=repmat(Ks(:,2)',N,1);
kt=repmat(Ks(:,3)',N,1);
Bmax=repmat(Ks(:,4)',N,1);
ke=repmat(Ks(:,5)',N,1);
kex=repmat(Ks(:,6)',N,1);
kdi=repmat(Ks(:,7)',N,1);
kde=repmat(Ks(:,8)',N,1);

v1=kon.*preEpo.*preEpoR;
v2=kon.*kD.*preEpo_EpoR;
v3=kt.*Bmax;
v4=kt.*preEpoR;
v5=ke.*preEpo_EpoR;
v6=kex.*preEpo_EpoR_i;
v7=kdi.*preEpo_EpoR_i;
v8=kde.*preEpo_EpoR_i;

z(:,1:varNum)=-v1+v2+v6;
z(:,varNum+1:2*varNum)=-v1+v2+v3-v4+v6;
z(:,2*varNum+1:3*varNum)=v1-v2-v5;
z(:,3*varNum+1:4*varNum)=v5-v6-v7-v8;
z(:,4*varNum+1:5*varNum)=v7;
z(:,5*varNum+1:6*varNum)=v8;