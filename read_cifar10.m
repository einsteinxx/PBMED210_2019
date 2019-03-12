

clear all; close all; fclose all;
clc
load('data_batch_1.mat')
im=zeros(32,32,3);
for cpt=1:10000 
    
R=data(cpt,1:1024);
G=data(cpt,1025:2048);
B=data(cpt,2049:3072);
k=1;
for x=1:32
    for i=1:32
        im(x,i,1)=R(k);
        im(x,i,2)=G(k);
        im(x,i,3)=B(k);
        k=k+1;
    end
end
 im=uint8(im);
 imwrite(im,strcat('..\base\',int2str(cpt),'.png'),'png'); 
%  imwrite(im,strcat('..\base\',int2str(cpt),'.jpg'),'jpg','Quality',100); 
end
 
