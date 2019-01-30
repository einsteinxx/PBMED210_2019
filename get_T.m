
close all;


data_dir = '/home/kgonzalez/LIDC/LIDC-IDRI/LIDC-IDRI-0001/01-01-2000-30178/3000566-03192';


file_list = dir(fullfile(data_dir,'*.dc*'));


if(length(file_list)  > 1)
    
   data=dicomread(fullfile(data_dir,file_list(100).name)); 
    
end

figure(1), histogram(data);


figure(2), imshow(data), colormap(gca, jet), colorbar

Tnew = 200;
T0 = 2; %stopping criteria
dt=5;
%%

while (dt > T0)
    
    T = Tnew;
    object = find(data >= T);
    bground = find(data< T);
    
    u2=mean(data(object));
    u1 = mean(data(bground));
    
    Tnew = (0.5) * (u1 + u2);
    
    dt = abs(T-Tnew);
    
end



%new image
new_data = ones(512,512);
new_data(bground) =0;
figure, imshow(new_data);



%%

