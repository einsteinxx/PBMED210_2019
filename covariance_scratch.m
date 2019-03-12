

x = floor(rand(1,6)*100);
y = floor(rand(1,6)*100);
xs = x;
ys = y;


mx = mean(x);
my = mean(y);
n = length(x);
sumval = 0;
for ii = 1:length(x)
   sumval = sumval + ((x(ii) - mx) * (y(ii) - my));
    
    
end

sigma = (1/(n-1)) * sumval;


%% matrix form
C=[];
x=xs(1:2);
y=ys(1:2);
n= length(x);
for ii = 1:2
    for jj = 1:2
        C(ii,jj) = (1/(n-1)) * (x(ii) - mean(x)) * ...
            (y(jj) - mean(y));
        
    end
   
end
C
cov(x,y)
