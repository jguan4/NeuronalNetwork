function C=closenessCentrality(Adj)
n=size(Adj,1);
G=graph(Adj);
shortestpaths=zeros(size(Adj));
for i=1:n-1
    for j=i+1:n
        [P,d]=shortestpath(G,i,j);
        shortestpaths(i,j)=d;
    end
end
shortestpaths=shortestpaths+shortestpaths';
C=(n-1)./sum(shortestpaths,2);