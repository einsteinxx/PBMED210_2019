close all;
format long;

load accidents

x = hwydata(:,14);  %pop of states
y = hwydata(:,4);   %accidents per state
X = [ones(length(x),1) x]; %padded with intercept


b1 =x\y;
b = X\y;

yCalc1 = b1 * x;
scatter(x,y);
hold on;
plot(x,yCalc1);
xlabel('Pop State');
ylabel('Fatal Traffic Accidents per state');
title('Linear Regression Relation bw accidents and states');
grid on


yCalc2 = X*b;
plot(x,yCalc2,'--');
legend('Data','Slope','Slope & Intercept','Location','best');

