n_fluxes = 247;
n_reactants = 197;

st_mat = xlsread("matrix_2.xlsx");
Aeq = [st_mat, zeros(n_reactants,1)];
beq = zeros(n_reactants,1);

del_reactions = 69:6:189;
A = zeros(length(del_reactions),n_fluxes+1);
b = zeros(length(del_reactions),1);
nodel_value = 0.026315789473684 ;
for i = 1:length(del_reactions)
    A(i,del_reactions(i)) = 1;
    A(i,n_fluxes+1) = -nodel_value ;
end

ub = ones(n_fluxes+1,1);
lb = zeros(n_fluxes+1,1);
for i = 220:247
    lb(i,1) = -1 ;
end
% lb(100,1) = 0.0026;
% lb(4,1) = 0.9474;
lb(4,1) = 0.3 ;

f = zeros(n_fluxes+1,1);
f(n_fluxes+1,1) = 1;

[x,fval] = linprog(f,A,b,Aeq,beq,lb,ub);
x,1-fval 

y = x(1:247);
x_axis = 1:247;
plot(x_axis,y);

