function [x,fval,exitflag,output,lambda] = sprawdzanie(f,Aineq,bineq,lb,ub,x0)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('linprog');
%% Modify options setting
options = optimoptions(options,'Display', 'off');
%options = optimoptions(options,'Algorithm', 'interior-point');
options = optimoptions(options,'Algorithm', 'active-set');
[x,fval,exitflag,output,lambda] = ...
linprog(f,Aineq,bineq,[],[],lb,ub,x0,options);
