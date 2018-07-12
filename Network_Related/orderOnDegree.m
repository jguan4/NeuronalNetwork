function AdjSorted=orderOnDegree(Adj)
des=sum(Adj,2);
[B,I]=sort(des,'descend');
AdjSorted=Adj(I,I);