


%%
close all; clear all; fclose all;
data = zeros(256,256);


%draw a parallelogram
for ii = 128:148
   data(ii,ii) =1; 

   data(ii,ii-20) =1;
   
   data(128,ii-20) =1;
   data(148,ii)=1;

   
end
figure, imshow(data);colormap(gca,gray); 

index = find(data == 1);

%%
%s(k) is every point

[I,J] = ind2sub([256, 256],index);


for ii =1:length(index)
    s(ii) = I(ii) + 1i * J(ii);
    
end


%% DFT

K = length(index); %u value for a(u)

for uu = 1:K-1
  ktotal =0;
   for kk = 1:K-1
       kpart = s(uu) * exp(-1i * 2* pi * uu *kk/K);
      ktotal = ktotal + kpart;  
       
   end
    a(uu) = (1/K) * kpart;
end
%example plot
b = abs(a)/K;
figure, plot(b);

%% Inverse back to s(k)

for kk = 1:K-1
    a_total = 0;
    for uu = 1:length(a)
        acalc=a(uu) * exp(1i*2*pi*uu*kk/K) ;
        a_total = a_total +acalc; 
    end
    ss(kk) = (1/K) *a_total;
    
end
xval = real(ss);
yval = imag(ss);

figure, plot(xval,yval,'ro');
%