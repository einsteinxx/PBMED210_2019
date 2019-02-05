%gray level co-occurence matrix
close all
BW = imread('cameraman.tif');
data = BW;


found = ismember(data,[2 10]);
index = find(found == 1);
[I,J] = ind2sub([256, 256],index);



N = size(BW,1);

for ii = 1:N-1
    
    for jj = 1:N-1
        %this gives us the starting xy point, now find matches
        
        pt1 = data(ii,jj);
        pt2 = data(ii+1,jj);
        
        for xx = 1:N-1
            
           for jj = 1:N-1
               
               
           end
            
        end
        
        
    end
    
end