function [  x, k, X, FX  ] = sekanta_nelinNK(R, J, x0, n, m, epsilon, delta, N)

    X(:,1)=x0; %spremam početni
    f = @(x) 1/2*R(x)'*R(x);
    df = @(x) J(x)'*R(x);
    FX(:,1)=f(x0);
    J_0=J(x0);
    R_0=R(x0);
    
    if(norm(df(x0))<delta) %nije nužno da ovo provjerim
        return
    end
    
    k=1; %prvu iteraciju radim izvan petlje da mogu odmah provjeriti kriterije zaustavljanja
    A0 = 0;
    [Q_j, R_j] = qr(J_0'*J_0+A0);
    s=-Q_j'*(J_0'*R_0);
    s=R_j\s;
    x=x0+s;
    X(:,k+1)=x;
    FX(:,k+1)=f(x);
    
    J_1=J(x);
    R_1=R(x);
    
    while((max(abs((x-x0)./x0)) >= epsilon) && (norm(df(x))>=delta) && (k<=N)) %kriteriji zaustavljanja
        k=k+1;
        y_tmp = J_1'*R_1-J_0'*R_1;
        y_k = J_1'*R_1-J_0'*R_0;
        diff = y_tmp-A0*s; %razlika  koju spremam posebno
        umn = y_k'*s; %umnozak!!
        
        A0 = A0 + (diff*y_k'+y_k*diff')/umn- (diff'*s*(y_k*y_k'))/(umn^2);
        
        [Q_j, R_j] = qr(J_1'*J_1+A0);
        s=-Q_j'*(J_1'*R_1);
        s=R_j\s;
        x0=x;
        x=x0+s;
        X(:,k+1)=x;
        FX(:,k+1)=f(x);
        
        J_0=J_1;
        R_0=R_1;
        J_1=J(x);
        R_1=R(x);
    end


end