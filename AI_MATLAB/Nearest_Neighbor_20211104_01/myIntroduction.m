%Date 04.11.2021
%AI2 - Exercise 1

%Task1
%a) Create the vectors a, b with uniformly distributed random numbers
a = [rand(1,5)]
b = [rand(1,5)]

%b) Multiply the vectors a and b to get c and A
c = [a*transpose(b)]
A = [transpose(a)*b]

%c) Perform element-wise multiplication with a and b to get vector e
e = [a.*b]

%d) Extract the elements at locations (1,2) and (2,3) from A
A(1,2)
A(2,3)

%e) Extract and concatenate the elements in the upper and lower rows from A
ext1 = A(1,1:5)
ext2 = A(5,1:5)
Aprime  = cat(2,ext1,ext2)

%f) Set every value < 0.5 in A to 0 using logical indexing
A(A<0.5)=0
% A = A.*(A>=0.5) % another solution for this calculation

%g) Create B using magic()
B = magic(3)
 
%h) Solve Bx=f
f = transpose([1,2,3])
x = B\f

%i) Compute eigenvalues of B
B_eigenvalues = eig(B)

%Task2
%a)
x1 = [2, 2, 2, 3, 3, 4, 4, 5, 7, 7, 8, 9]
x2 = [5 ,6 ,8 ,4 ,6 ,5 ,9 ,9 ,7 ,9 ,8 ,7]
y = [0, 0 ,0 ,0 ,0 ,0 ,1 ,1 ,1 ,1 ,1 ,1]

%s = scatter(x1,x2,'red')
%s
figure()
g = gscatter(x1,x2,y,'br');
legend('class 0','class 1');
g;
%title('');
%xlabel('');
%ylabel('');

%b)
U = [4, 7; 7, 5];
X = [transpose(x1), transpose(x2)];
[v, pred] = bruteForce( X, y, U )
% function [v, pred] = bruteForce( X, y, U )
% 
%     pred = [];
%     v = [];
%     for i = 1:length(U)
%         sub_v = [];
%         % find the nearest point
%         for j = 1:length(X)
%             % calculate Euclidean distance between U and X row by row
%             sub_v = [sub_v, pdist([U(i,:);X(j,:)])];
%         end
%         % nearest distance and index of that neighbor
%         [~, neighbor] = min(sub_v);
%         % get the class of nearest point for each U point
%         pred = [pred, y(neighbor)];
%         % save the distances
%         v = [v; sub_v];
%     end
% 
% end

%c)
% our new points
U = [4, 7; 7, 5];
% actual data that we have
X = [transpose(x1), transpose(x2)];
% use kd-tree
Mdl = KDTreeSearcher(X);
% get indices of nearest neighbors for each new points in U
Idx = knnsearch(Mdl,U);
% get the class of nearest point for each U point
kd_pred = y(Idx)

%d)
% Computation of brute-Force is higher than using knnsearch approach.
% So, for a larger dataset, it is better to use kd-tree instead of calculating all distances for all points.

%references:
%https://uk.mathworks.com/help/stats/kdtreesearcher.html
%https://uk.mathworks.com/help/stats/knnsearch.html   