function [x,fval,exitflag,output,lambda,ok] = sprawdzanie1(f,Aineq,bineq,lb,ub,x0,depth,fval_test)
%SPRAWDZENIE1 Summary of this function goes here
%   Detailed explanation goes here

ok=0;
%lb
%ub
%depth

[x,fval,exitflag,output,lambda] = ...
  sprawdzanie(f,Aineq,bineq,lb,ub,x0);


x0_prim = x;
x0_floor = floor(x);
delta = x0_prim - x0_floor;

if delta == 0;
    display 'znalazlem rozwiazanie calkowitoliczbowe'
    fprintf('%d,%d,%d\n %f\n', x(1), x(2), x(3), -fval);
    ok=1;
elseif depth==0;
    display 'maksymalny poziom'
elseif fval > fval_test
    return;
else
    for i=length(x):-1:1
        if delta(i) ~= 0;
            tmp1 =floor(x(i));
            tmp2 = tmp1 + 1;
            
            ub1 = ub;
            ub1(i) = tmp1;
            if ub1(i) >= lb(i)
                [x1,fval1,exitflag,output,lambda,ok1] = sprawdzanie1(f,Aineq,bineq,lb,ub1,x,depth-1,fval_test);
                %fprintf('%d,%d,%d\n %f\n', x(1), x(2), x(3), -fval);
                if ok1==1
                    ok = ok1;
                    fval = fval1;
                    x = x1;
                    fval_test = fval;
                end
            end;
            lb1 = lb;
            lb1(i) = tmp2;
            if lb1(i) <= ub(i)
                [x2,fval2,exitflag,output,lambda,ok2] = sprawdzanie1(f,Aineq,bineq,lb1,ub,x,depth-1,fval_test);
                %fprintf('%d, %d, %d\n %f\n', x(1), x(2), x(3), -fval);
                if ok2 == 1
                    if fval2 < fval
                        if mod(x2,1) == 0
                            ok = ok2;
                            fval = fval2;
                            x = x2;
                        end;
                    end;
                end;
            end;
            
            break;
        end;
    end;
end;
end

