


clear all; close all;fclose all;


data_dir = '/home/kgonzalez/LIDC/LIDC-IDRI/LIDC-IDRI-0001/01-01-2000-30178/3000566-03192';


file_list = dir(fullfile(data_dir,'*.dc*'));


if(length(file_list)  > 1)
    
   %data=dicomread(fullfile(data_dir,file_list(100).name)); 
    
end


RGB = imread('pillsetc.png');
imshow(RGB);

%%



%%



I = rgb2gray(RGB);
bw = imbinarize(I);
imshow(bw)