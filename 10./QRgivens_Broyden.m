function [Q,R]=QRgivens_Broyden(R0,u,v)
% Givens QR
% Q'*A=R
[m,n]=size(R0);
Q=eye(m);
%A=R0+u'*v;
for i=m:-1:2
    [c,s]=givens2(u(i-1),u(i));
    u=givensnamatricu(c,s,u',i-1,i)';
    R0=givensnamatricu(c,s,R0,i-1,i);
    Q=givensnamatricu(c,s,Q,i-1,i);
end
A=R0+u'*v;
for i=2:n
    [c,s]=givens2(A(i-1,i-1),A(i,i-1));
    A=givensnamatricu(c,s,A,i-1,i);
    Q=givensnamatricu(c,s,Q,i-1,i);
end    
Q=Q';
R=A;