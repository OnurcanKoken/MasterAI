% AI2 Exercise 6
% 10.12.2021

x1 = [-3:0.05:3];
x2 = [-3:0.05:3];

% lecturer solution
%x1 = -3.25:0.01:3.25;
%x2 = -3.25:0.01:3.25;

z = meshgrid(x1,x2);
 
f = zeros(size(z));
for i =1:length(x1)
    for j = 1:length(x2)
        f(i,j) = -x1(i)^2-2*(x2(j)^2)+7.5;
    end
end
 
figure
set(gcf,'color','w')
colormap(hot(64))
plot(0,0,'.y')
hold on
contour(x1,x2,f,1:10,'Linewidth',2)
plot(x1,1.5-x1,'b', 'Linewidth',2)
 
xlabel('x_1')
ylabel('x_2')
legend('f(x_1,x_2)=b')
axis equal
 
ax = gca;
ax.FontSize = 10;
 