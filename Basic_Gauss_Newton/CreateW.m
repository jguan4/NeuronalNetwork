function W=CreateW(varNum,p,R,Q)
Wdiag=ones(1,varNum+p);
factor=sqrt(R/Q);
Wdiag(1:varNum)=factor*Wdiag(1:varNum);
W=diag(Wdiag);