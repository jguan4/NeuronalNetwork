clear

%% Initial constants setup
times=5000;

substep=2;      %Define step size
substeph=0.005;
h=substep*substeph;

varNum=1;   %Number of nodes in a network
dimNum=13;   %Number of variables in each node

measureds=nchoosek(1:13,1);
numRealizations=5;

%% Choose System Dynamic and Fill in constatns
[Ks]=cellCycleParameters;
ydot=@(t,y) ydotCellCycle(Ks,varNum,t,y);
func=@(t,x) rk4step(t,x,h,substep,ydot);

rt=3;
% path=strcat('Realization',num2str(rt),'Trajectory_RestrictMass0.2');
% if (exist(path,'dir')==0)
%     mkdir(path);
% end
rng(rt);
initn=rand([1, dimNum*varNum]);
initn(7)=rand*0.2;
[t,correctValue]=BuildNetwork_Demo(varNum*dimNum,initn,times,h,func);

%% Define Rs
ms=max(correctValue);
R=1e-10;
Q=1e-4*R;
Rs=R.*ms;
Rs=diag(Rs);
Qs=diag(Q.*ms);

% runt=[];
numRcount=1;
% c = clock;
% dayl=7;
% hourl=6;
% while (c(3)<=dayl)
%     if (c(3)==dayl && c(4)>hourl)
%         break;
%     else
        tic;
        numRstart=(numRcount-1)*numRealizations;
        for m=1:size(measureds,1)
            measured=measureds(m,:);
            %% run different cases
            condNum_struct=struct('R',{},'Q',{},'condNums',{},'correctValue',{});
            condNums=zeros(numRealizations,varNum*dimNum);
            for realization=1:numRealizations
                rn=realization+numRstart;
                rng(rn);
                
                initmulti=1e-5.*ms;
                init=correctValue+repmat(initmulti,times,1).*randn(size(correctValue));
                
                condNum=computeConditionNumber_diagR(varNum*dimNum,correctValue,Rs,Qs,t,measured,func,init);
                condNums(realization,:)=condNum;
            end
            avecondNum=sqrt(mean(condNums.^2));
            stdcondNum=std(condNums,0,1);
            
            condNum_struct(1).Rs=Rs;
            condNum_struct(1).Qs=Qs;
            condNum_struct(1).condNums=condNums;
            condNum_struct(1).correctValue=correctValue;
            save(strcat(path,'/condNum',num2str(times),'_CellCycle_RME_',num2str(R),'_',num2str(Q),'_',num2str(measured),'_',num2str(numRcount),'.mat'),'condNum_struct')
        end
        runt(numRcount)=toc;
%     end
%     c = clock;
%     numRcount=numRcount+1;
% end