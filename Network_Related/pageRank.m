function p=pageRank(Adj)
D=diag(sum(Adj,1));
G=Adj*inv(D);
[eigvec,eigval]=eig(G);
v=eigvec(:,1);
p=v/sum(v);
