function [solution] = cla_variation(cla,m,mu,v)
syms muout mout vout
if m == 0
    eqn1 = cla*(-1) == (2/(1.205*v*v))*((mout*9.81)-((mout*v*v)/(mu*103)));
    solution = solve(eqn1,mout);
elseif mu == 0
    eqn1 = cla*(-1) == (2/(1.205*v*v))*((m*9.81)-((m*v*v)/(muout*103)));
    solution = solve(eqn1,muout);
elseif v == 0
    eqn1 = cla*(-1) == (2/(1.205*vout*vout))*((m*9.81)-((m*vout*vout)/(mu*103)));
    solns = solve(eqn1,vout);
    solution = solns(2);
else
    eqn1 = cla*(-1) == (2/(1.205*v*v))*((m*9.81)-((m*v*v)/(mu*103)));
    solution = solve(eqn1,cla);
end