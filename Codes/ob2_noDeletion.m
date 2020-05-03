n_fluxes = 249;
n_reactants = 198;

st_mat = xlsread("matrix.xlsx");
beq = zeros(n_reactants,1);
A = [];
b = [];
ub = ones(n_fluxes,1);
lb = zeros(n_fluxes,1);
for i = 220:242
    lb(i,1) = -1 ;
end

f = zeros(n_fluxes,1);
f(249,1) = -1;

[x,fval] = linprog(f,A,b,st_mat,beq,lb,ub);
x,-1*fval

y = x(1:247);
x_axis = 1:247;
plot(x_axis,y);

