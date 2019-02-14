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






%% EXAMPLE FROM NOTES

data = [0 0 0 1 2;1 1 0 1 1; 2 2 1 0 0 ; ...
    1 1 0 2 0; 0 0 1 0 1];

%for p operator of down and to the right of 1 (diag)
z = [0,1,2];

A = zeros(3,3);
for ii = 1:3
   for jj = 1:3
       for xx = 2:size(data,1)
           for yy = 2:size(data,2)
               if (data(xx,yy) == z(ii) && ...
                       (data(xx-1,yy-1) == z(jj)))
                   fprintf(1,'found value\n');
                   A(ii,jj) = A(ii,jj) + 1;
               else
                   
                   fprintf(1,'ii=%d,jj=%d   z = %d,yy=%d,xx=%d, TL=%d pt=%d \n', ...
                       ii,jj,z(ii),yy,xx, ...
                       data(xx-1,yy-1), ...
                       data(xx,yy));
               end
           end
       end
       
       
   end
end

A
n = sum(A); %number of points that satisfy P

%C is A/n, giving the gray-level co-occurance matrix,
%which is the joint probability that a pair of points 
%satisfying P will have values (zi,zj)
C = A./n;
C



%useful descriptors
max_prob = max(C)


%% Element difference moment of k

value = 0;
uniformity =0;
entropy_val = 0;
k=3;
for ii = 1:size(C,1)
   
    for jj = 1:size(C,2)
       holder = (ii -jj)^k * C(ii,jj) ;
       value = value + holder;
       
       uhold = pow2(C(ii,jj));
       uniformity = uniformity + uhold;
       
       ehold = C(ii,jj) *log2(C(ii,jj));
       entropy_val = entropy_val + ehold;
       
    end
end
value
uniformity
-entropy_val



%% second example
data = [ 2 2 2 2 2; ...
    0 2 1 0 1; ...
    1 1 1 1 1; ...
    1 2 0 2 0; ...
    2 2 2 2 2];

z = [0,1,2];

A = zeros(length(z),length(z));
%find Co-Occurrence matrix for one pixel below
%and one pixel to the right

%one below
for ii = 1:3
   for jj = 1:3
       for xx = 1:size(data,1)
           for yy = 1:size(data,2)-1
               if (data(xx,yy) == z(ii) && ...
                       (data(xx,yy+1) == z(jj)))
                   fprintf(1,'found value\n');
                   A(ii,jj) = A(ii,jj) + 1;
               else
                   
                   fprintf(1,'ii=%d,jj=%d   z = %d,yy=%d,xx=%d, TL=%d pt=%d \n', ...
                       ii,jj,z(ii),yy,xx, ...
                       data(xx,yy+1), ...
                       data(xx,yy));
               end
           end
       end
       
       
   end
end

A
n = sum(A); %number of points that satisfy P

%C is A/n, giving the gray-level co-occurance matrix,
%which is the joint probability that a pair of points 
%satisfying P will have values (zi,zj)
C = A./n;
C



%useful descriptors
max_prob = max(C)

%% Element difference moment of k

value = 0;
uniformity =0;
entropy_val = 0;
k=2;
for ii = 1:size(C,1)
   
    for jj = 1:size(C,2)
       holder = (ii -jj)^k * C(ii,jj) ;
       value = value + holder;
       
       uhold = pow2(C(ii,jj));
       uniformity = uniformity + uhold;
       
       ehold = C(ii,jj) *log2(C(ii,jj));
       entropy_val = entropy_val + ehold;
       
    end
end
value
uniformity
-entropy_val