n_fluxes = 247;
n_reactants = 197;

st_mat = xlsread("matrix_2.xlsx");
beq = zeros(n_reactants,1);
A = [];
b = [];
ub = ones(n_fluxes,1);
lb = zeros(n_fluxes,1);
for i = 220:247
    lb(i,1) = -1 ;
end

f = zeros(n_fluxes,1);
%f(249,1) = -1;
f(243,1) = -0.4926; % alpha
f(244,1) = -0.2334; % cis methoxy
f(245,1) = -0.0327; % trans
f(246,1) = -0.2117; % cis keto
f(247,1) = -0.0297; % trans


[x,fval] = linprog(f,A,b,st_mat,beq,lb,ub);
x,-1*fval

y = x(1:247);
x_axis = 1:247;
plot(x_axis,y);

