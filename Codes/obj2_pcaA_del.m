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

ub_valu-+e = 0.026315789473684 ;
% ub_value = 0;
% del_reactions = 69:6:189;
del_reactions = 194:1:194;
for i = 1:length(del_reactions)
    ub(del_reactions(i),1) = ub_value;
end


f = zeros(n_fluxes,1);
f(249,1) = -1;

[x,fval] = linprog(f,A,b,st_mat,beq,lb,ub);
x,-1*fval

y = x(1:247);
x_axis = 1:247;
plot(x_axis,y);

