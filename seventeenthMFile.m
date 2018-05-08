clear all
clc

% weird spline stuff. 

t = [0 10 15 20];
v = [0 227.04 362.78 517.35];

A(1,:) = [t(1)^3 t(1)^2 t(1) 1 0 0 0 0 0 0 0 0];
A(2,:) = [t(2)^3 t(2)^2 t(2) 1 0 0 0 0 0 0 0 0];
A(3,:) = [0 0 0 0 t(2)^3 t(2)^2 t(2) 1 0 0 0 0];
A(4,:) = [0 0 0 0 t(3)^3 t(3)^2 t(3) 1 0 0 0 0];
A(5,:) = [0 0 0 0 0 0 0 0 t(3)^3 t(3)^2 t(3) 1];
A(6,:) = [0 0 0 0 0 0 0 0 t(4)^3 t(4)^2 t(4) 1];
A(7,:) = [3*t(2)^2 2*t(2) 1 0 -3*t(2)^2 -2*t(2) -1 0 0 0 0 0];
A(8,:) = [0 0 0 0 3*t(3)^2 2*t(3) 1 0 -3*t(3)^2 -2*t(3) -1 0];
A(9,:) = [6*t(2) 2*1 0 0 -6*t(2) -2*1 0 0 0 0 0 0];
A(10,:) = [0 0 0 0 6*t(3) 2*1 0 0 -6*t(3) -2*1 0 0];
A(11,:) = [3*t(1)^2 2*t(1) 1 0 0 0 0 0 0 0 0 0];
A(12,:) = [0 0 0 0 0 0 0 0 3*t(4)^2 2*t(4) 1 0];

B = [0;227.04;227.04;362.78;362.78;517.34;0;0;0;0;0;0];


gaussianElimination(A,B);



%% 
clear all
clc

x = [2 4.5 5.25 7.81 9.2 10.6];
y = [7.2 7.1 6 5 3.5 5];

%plot(x,y,'o')

% Quadratic Spline

A(1,:) = [x(1)^2 x(1) 1 0 0 0 0 0 0 0 0 0 0 0 0];
A(2,:) = [x(2)^2 x(2) 1 0 0 0 0 0 0 0 0 0 0 0 0];
A(3,:) = [0 0 0 x(2)^2 x(2) 1 0 0 0 0 0 0 0 0 0];
A(4,:) = [0 0 0 x(3)^2 x(3) 1 0 0 0 0 0 0 0 0 0];
A(5,:) = [0 0 0 0 0 0 x(3)^2 x(3) 1 0 0 0 0 0 0];
A(6,:) = [0 0 0 0 0 0 x(4)^2 x(4) 1 0 0 0 0 0 0];
A(7,:) = [0 0 0 0 0 0 0 0 0 x(4)^2 x(4) 1 0 0 0];
A(8,:) = [0 0 0 0 0 0 0 0 0 x(5)^2 x(5) 1 0 0 0];
A(9,:) = [0 0 0 0 0 0 0 0 0 0 0 0 x(5)^2 x(5) 1];
A(10,:) = [0 0 0 0 0 0 0 0 0 0 0 0 x(6)^2 x(6) 1];
A(11,:) = [2*x(2) 1 0 -2*x(2) -1 0 0 0 0 0 0 0 0 0 0];
A(12,:) = [0 0 0 2*x(3) 1 0 -2*x(3) -1 0 0 0 0 0 0 0];
A(13,:) = [0 0 0 0 0 0 2*x(4) 1 0 -2*x(4) -1 0 0 0 0];
A(14,:) = [0 0 0 0 0 0 0 0 0 2*x(5) 1 0 -2*x(5) -1 0];
A(15,:) = [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

B = [y(1);y(2);y(2);y(3);y(3);y(4);y(4);y(5);y(5); y(6);0;0;0;0;0]

soln = gaussianElimination(A,B)

syms X

y1 = vpa((soln(1)*X^2 + soln(2)*X + soln(3)),3)
y2 = vpa((soln(4)*X^2 + soln(5)*X + soln(6)),3)
y3 = vpa((soln(7)*X^2 + soln(8)*X + soln(9)),3)
y4 = vpa((soln(10)*X^2 + soln(11)*X + soln(12)),3)
y5 = vpa((soln(13)*X^2 + soln(14)*X + soln(15)),3)

xx1 = linspace(x(1),x(2),1000);
xx2 = linspace(x(2),x(3),1000);
xx3 = linspace(x(3),x(4),1000);
xx4 = linspace(x(4),x(5),1000);
xx5 = linspace(x(5),x(6),1000);

yy1 = subs(y1,X,xx1);
yy2 = subs(y2,X,xx2);
yy3 = subs(y3,X,xx3);
yy4 = subs(y4,X,xx4);
yy5 = subs(y5,X,xx5);

plot(xx1,yy1,xx2,yy2,xx3,yy3,xx4,yy4,xx5,yy5,x,y,'o')

L1 = myarchlength(xx1,yy1);
L2 = myarchlength(xx2,yy2);
L3 = myarchlength(xx3,yy3);
L4 = myarchlength(xx4,yy4);
L5 = myarchlength(xx5,yy5);
LTotal = L1 + L2 + L3 + L4 + L5;






%% HW 11 Stuff that you don't need to turn in matlab code for

clear all
clc


A = [1 1 0 0 0 0 0 0;2 1 0 0 0 0 0 0;0 0 2 1 0 0 0 0;0 0 3 1 0 0 0 0;0 0 0 0 3 1 0 0;0 0 0 0 5 1 0 0;0 0 0 0 0 0 5 1;0 0 0 0 0 0 8 1];
B = [3.7;1.2;1.2;4.3;4.3;8;8;3.1];

A\B

V(1,:) = [1 1 1 0 0 0 0 0 0 0 0 0];
V(2,:) = [4 2 1 0 0 0 0 0 0 0 0 0];
V(3,:) = [0 0 0 4 2 1 0 0 0 0 0 0];
V(4,:) = [0 0 0 9 3 1 0 0 0 0 0 0];
V(5,:) = [0 0 0 0 0 0 9 3 1 0 0 0];
V(6,:) = [0 0 0 0 0 0 25 5 1 0 0 0];
V(7,:) = [0 0 0 0 0 0 0 0 0 25 5 1];
V(8,:) = [0 0 0 0 0 0 0 0 0 64 8 1];
V(9,:) = [4 1 0 -4 -1 0 0 0 0 0 0 0];
V(10,:) = [0 0 0 6 1 0 -6 -1 0 0 0 0];
V(11,:) = [0 0 0 0 0 0 10 1 0 -10 -1 0];
V(12,:) = [1 0 0 0 0 0 0 0 0 0 0 0];

B = [3.7;1.2;1.2;4.3;4.3;8;8;3.1;0;0;0;0];

V\B









