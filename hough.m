x = 1:100;
y = 2:102;


theta = atan(y./x);
for ii = 1:length(x)
r(ii) = x(ii) * cos(theta(ii)) + y(ii) * sin(theta(ii));
end

figure, plot(r,theta,'r.-')

%%

data = zeros(256,256);

for ii = 40:90
    data(ii,ii) = 1;
    
end

figure, imshow(data); colormap(gca,jet); colorbar

index = find(data == 1);
[I,J] = ind2sub([256, 256],index);

clear r;



for ii = 1:length(I)
   for jj = 1:length(J)
       %this is the xy location of the line
       for theta = 0:180
           
           
       end
             theta(ii,jj) = atan((J(jj))/I(ii));
      r(ii,jj) = I(ii) * cos(theta(ii,jj)) + J(jj) * sin(theta(ii,jj));
       
   end
end



for ii = index
    
    
end


for ii = 1:256
   for jj = 1:256
      theta = atan(jj/ii);
      r(ii,jj) = ii * cos(theta) + jj * sin(theta);
       
   end
    
    
end




%%  
close all;
T=100;
f=zeros(128,128);
f(32:96,32:96)=255;
[g1, t1]=edge(f, 'sobel', 'vertical');
imshow(g1);
t1



sigma=1;
f=zeros(128,128);
f(32:96,32:96)=255;
[g3, t3]=edge(f, 'canny', [0.04 0.10], sigma);
figure,imshow(g3);
t3

f=zeros(101,101);
f(1,1)=1;
f(101,1)=1;
f(1,101)=1;
f(101,101)=1;
f(51,51)=1;
figure, imshow(f); colormap(gca,jet); colorbar



[H,THETA,RHO]=hough(f);
imshow(H,[])

%% DATA
[H,THETA,RHO] =hough(data);
figure, imshow(H,[])

theta = -90:90;
nrows = size(data,1) * 2;
ncols = length(-90:90);


index = find(data == 1);
[I,J] = ind2sub([256, 256],index);

clear r;

%% Try with a small image -- this works

sample = zeros(11,11);
for ii = 3:9
    sample(ii,ii) = 1; %set diagonal at -45 degrees CW from x axis
    
end

data = sample; %move into default variable
N= size(data,1);
index = find(data == 1);
[I,J] = ind2sub([N, N],index);


num_rho = length(index) * ncols;
diagonal = round(sqrt(N^2 + N^2));
rhos = -diagonal:(diagonal); % * 2.0); %also could be +- N*sqrt(2)

accumulator = zeros(2*diagonal,ncols);
for ii = 1:length(index)
    %go over each edge point x,y
    x = I(ii);
    y = J(ii);
    
   for jj = 1:ncols
       %for every xy point, test out the full range
       %of theta angles (-90 :90) and calculate the 
       %rho values. Add this rho value to the accumulator
       %with a 1 added everytime that rho,theta (jj) pair 
       %hits. You will end up with a rho,theta that piles
       %up for lines

       rho = round(x * cosd (theta(jj)) + y * sind(theta(jj))) + diagonal;
       accumulator(rho,jj) = accumulator(rho,jj) + 1;
       
   end
    
    
end


figure, imshow(accumulator);
h = gca;
h.Visible = 'On'; %show axis ticks
xlabel('theta (deg)');
ylabel('rho');

% t = 16-90;
% counter = 1;
% for ii = 1:11
%    for jj = 1:11
%       rr(counter) = ii* cosd(t) + jj * sind(t);
%       counter = counter + 1;
%    end
% end
% 
% id = find(accumulator == 19);





[H,THETA,RHO]=hough(data);
figure, imshow(H,[]);title('Hough for data');colormap(gca,jet);
h = gca;
h.Visible = 'On'; %show axis ticks

%the above for 11x11 and the matlab hough() produce the same accumulator