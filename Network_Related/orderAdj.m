function AdjSorted=orderAdj(Adj,option)
switch option
    case 'degree'
        p=sum(Adj,2);
    case 'pageRank'
        p=pageRank(Adj);
    case 'closeness'
        p=closenessCentrality(Adj);
    case 'betweenness'
        p=betweennessCentrality(Adj);
end
[B,I]=sort(p,'descend');
AdjSorted=Adj(I,I);