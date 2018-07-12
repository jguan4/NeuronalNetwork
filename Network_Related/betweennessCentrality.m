function p=betweennessCentrality(Adj)
n=size(Adj,1);
p=zeros(n,1);
for v=1:n
    allv=1:n;
    allv(v)=[];
    st=nchoosek(allv,2);
    sig_stv=0;
    sig_st=0;
    for i=1:size(st,1)
        sti=st(i,:);
        paths=findShortestPaths(Adj,sti(1),sti(2));
        sig_st=sig_st+size(paths,1);
        sig_stv=sig_stv+size(find(ismember(v,paths)),1);
    end
    p(v,1)=sig_stv/sig_st;
end