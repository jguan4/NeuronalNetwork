function anspaths=findShortestPaths(Adj,i,j)
paths=[i];
connected=find(Adj(i,:));
n=1;
if (~ismember(j,connected))
    paths=expandPaths(paths,connected);
    n=n+1;
    while (~ismember(j,connected))
        temp=Adj(connected,:);
        connected=find(sum(temp));
        if ismember(j,connected)
            paths=expandPaths(paths,[j]);
            p=n+1;
            break;
        else
            paths=expandPaths(paths,connected);
            n=n+1;
        end
    end
else
    paths=expandPaths(paths,[j]);
    p=n; 
end
ps=size(paths,1);
anspaths=[];
if p>1
    for m=1:ps
        pa=paths(m,:);
        prod=1;
        for q=1:p-1
            prod=prod*Adj(pa(q),pa(q+1));
        end
        if prod==1
            anspaths=cat(1,anspaths,pa);
        end
    end
else
    anspaths=paths;
end

