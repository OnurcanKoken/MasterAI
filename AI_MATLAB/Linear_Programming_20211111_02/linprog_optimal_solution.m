%Date 11.11.2021
%AI2 - Exercise 2

% Task 1d
A = [ 4 5; 1 1; 1 0; 0 1]
b = [40; 20; 8; 5]
f = [-25 -30]
Aeq = []
beq = []
lb = [0 0]
ub = []
[x,z] = linprog(f,A,b,Aeq,beq,lb,ub)

% z is calculated as negative, but this is because of MATLAB
% implementation, it computes the minimum instead of maximum, therefore
% f function is also assigned with negative numbers
% so the actual result is z = 248 as maximized 
% with respect to target function
