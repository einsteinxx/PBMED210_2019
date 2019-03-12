close all;

%BW = imread('text.png');
BW = imread('cameraman.tif');
grad = imread('gradient.png');
grad = grad(:,:,1);
orig= BW;

a = find(BW > 128);
b = find(BW <=128);
BW(a) = 1;
BW(b) = 0;

imshow(BW); colormap(gca,jet);
caxis([0 1]);colorbar;


sel = [0 1 0; 1 1 1; 0 1 0;];




%% EROSION
%run this over each pixel, looking for an exact FIT (not HIT)

BW2 = uint8(zeros(256,256));
match_count = 0;
for xx = 1:size(BW,1)
    for yy = 1:size(BW,2)
        if ( (xx == 13) && (yy == 65))
           fprintf(1,'found') ;
        end
        if (BW(xx,yy) == sel(2,2))
            %origin matches, now check the surrounding pixels
            if ((yy > 1) && (yy < size(BW,2)) && ...
                    (xx >1) && (xx < size(BW,1)))
                fprintf(1,'\n\n\n\t%d\n%d\t%d\t%d\n\t%d\n', ...
                    BW(xx,yy+1), ...
                    BW(xx-1, yy), ...
                    BW(xx,yy), ...
                    BW(xx+1,yy), ...
                    BW(xx,yy-1));   
                %not at the top or bottom border
                if ( (BW(xx,yy+1) == sel(3,2)) && ...
                        (BW(xx,yy-1) == sel(1,2)))
                    %top and bottom match
                    middle_match = 1;
                else
                    middle_match = 0;
                end
                
                if ( (BW(xx+1,yy) == sel(2,3)) && ...
                        (BW(xx-1,yy) == sel(2,1)))
                    %top and bottom match
                    side_match = 1;
                else
                    side_match =0;
                end
                
            else
                middle_match =0;
                side_match = 0;
            end
            
            
            if((middle_match == 1) && (side_match == 1))
                BW2(xx,yy) = sel(2,2);
                match_count = match_count + 1;
            else
                %leave as-is
            end
        end
        
    end
end

figure, imshow(BW); title('BW original');
caxis([0 1]);

figure,
imshow(BW2); title('BW EROSION');caxis([0 1]);

g = BW - BW2;
figure, imshow(g), caxis([0 1]);
title('f(x) - f(erosion)');

% -- this seems to work for getting edges



%% 
se = strel('square',3);
erodedBW = imerode(BW,se);
figure, 
imshow(erodedBW);
caxis([0 1]);
g2 = BW - erodedBW;
figure, imshow(g2); caxis([ 0 1]);

%% FIRST DERIVATIVE
%take a slice
s = grad(128,:);
d1 = diff(s);
d2 = diff(d1);

figure, plot(s,'k.-');grid on;
hold on;
plot(d1,'ro-');
plot(d2,'b*-');


figure, mesh(BW);




%% GAUSSIAN FILTERING

sd =1.0;
%G = (1/(sqrt(2 * pi) *sd^2)) * exp(-((pow(x,2) + (pow(y,2)))/(2* pow(sd,2))));
x = -1:0.01:1;
Gx = (1/(sqrt(2 * pi) *sd)) * ...
    exp(-(pow2(x))/(2* pow2(sd)));
figure, plot(x,Gx)


%% DILATION WITH HIT CRITERIA
match_count = 0;
for xx = 1:size(BW,1)
    for yy = 1:size(BW,2)
        if ( (xx == 13) && (yy == 65))
           fprintf(1,'found') ;
        end
        
        
        if ((yy > 3) && (yy < (size(BW,2)-3)) && ...
                (xx > 3) && (xx < (size(BW,1) -3)))
            fprintf(1,'\n\n\n\t%d\n%d\t%d\t%d\n\t%d\n', ...
                BW(xx,yy+1), ...
                BW(xx-1, yy), ...
                BW(xx,yy), ...
                BW(xx+1,yy), ...
                BW(xx,yy-1));
            %not at the top or bottom border
            
            
            for ii = -1:1
                for jj = -1:1
                    BW(xx-1:xx+1,yy+jj) == sel(:,jj)
                end
            end
            
            if ( (BW(xx,yy+1) == sel(3,2)) && ...
                    (BW(xx,yy-1) == sel(1,2)))
                %top and bottom match
                middle_match = 1;
            else
                middle_match = 0;
            end
            
            if ( (BW(xx+1,yy) == sel(2,3)) && ...
                    (BW(xx-1,yy) == sel(2,1)))
                %top and bottom match
                side_match = 1;
            else
                side_match =0;
            end
            
        else
            middle_match =0;
            side_match = 0;
        end
        
        %at a point, scan from L to R 1:3, check for any overlapping 1s
        for ii = 1:3
           for jj = 1:3
               
           end
        end
        
        
        if (BW(xx,yy) == sel(2,2))
            %origin matches, now check the surrounding pixels
            
            
            
            if((middle_match == 1) && (side_match == 1))
                BW2(xx,yy) = sel(2,2);
                match_count = match_count + 1;
            else
                %leave as-is
            end
        end
        
    end
end

