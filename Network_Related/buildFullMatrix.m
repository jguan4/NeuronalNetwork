function mat=buildFullMatrix(col2,rn,option)
cn=size(col2,2)/2;
n=size(col2,1)/rn;
switch option
    case 'fixEnds'
        mat=zeros(n*rn,cn*(n-1));
        for i=1:n-1
            mat((i-1)*rn+1:i*rn,(i-1)*cn+1:(i)*cn)=col2((i-1)*rn+1:i*rn,1:cn);
            mat((i)*rn+1:(i+1)*rn,(i-1)*cn+1:(i)*cn)=col2((i-1)*rn+1:(i)*rn,cn+1:2*cn);
        end
    case 'noFix'
        mat=zeros(n*rn,cn*n);
        for i=1:n
            switch i
                case 1
                    mat((i-1)*rn+1:i*rn,(i-1)*cn+1:i*cn)=col2((i-1)*rn+1:i*rn,1:cn);
                otherwise
                    mat((i-1)*rn+1:i*rn,(i-1)*cn+1:(i)*cn)=col2((i-1)*rn+1:i*rn,1:cn);
                    mat((i-1)*rn+1:i*rn,(i-2)*cn+1:(i-1)*cn)=col2((i-2)*rn+1:(i-1)*rn,cn+1:2*cn);
            end
        end
end