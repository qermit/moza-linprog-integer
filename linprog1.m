function linprog1
%LINPROG1 Summary of this function goes here
%   Detailed explanation goes here
% coś jest nadal źle

f = [-80;-120;-40];
A = [6 10 6;10 6 4;2 2 2];
b = [160;160;160];

lb = [2;2;2];
%lb = [0;0;0];
%ub = [ceil(160/sum(A(:,1)));...
%    ceil(160/sum(A(:,2))); ...
%    ceil(160/sum(A(:,3)))];
ub=[16;16;27];
x0 = [2;2;2];

maxdepth = 4;

[x,fval,exitflag,output,lambda,ok] = ...
    sprawdzanie1(f,A,b,lb,ub,x0,maxdepth,inf);

if ok==1
    fprintf('Znaleziono rozwiazanie: %d, %d, %d\nZysk: %f\n', x(1), x(2), x(3), -fval1(x));
else
    fprintf('Nie znaleziono calkowitoliczbowego minimum\n');
end

end

