function A=buildGrid(row)
A=zeros(row*row);
for n=1:row*row
    ind=[];
    rem=mod(n,row);
    intp=floor((n-1)/row);
    if rem==1 %left col
        ind=[ind n+1];
    elseif rem==0 %right col
        ind=[n-1 ind];
    else %middle col
        ind=[n-1 ind n+1];
    end
    if intp==0 %top row
        ind=[ind n+row];
    elseif intp==row-1 %end row
        ind=[n-row ind];
    else %middle row
        ind=[n-row ind n+row];
    end
    A(n,ind)=1;
end