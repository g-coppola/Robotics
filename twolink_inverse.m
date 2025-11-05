function Q=twolink_inverse(L,P)
L1=L(1);
L2=L(2);
x=P(1);
y=P(2);
Q=[0;0];
%test spazio di lavoro ?
%
%
c2=(x^2+y^2-L1^2-L2^2)/2/L1/L2;
if abs(c2)>1 
    fprintf(' punto fuori dal WS')
else

s2=sqrt(1-c2^2);
if c2==-1
    s2=1;
end
q2=atan2(s2,c2);
A=[L1+L2*c2 -L2*s2; 
    L2*s2 (L1+L2*c2)];
Q1=inv(A)*P;
c1=Q1(1);
s1=Q1(2);
q1=atan2(s1,c1);
Q=[q1;q2];
end

end

