% k_means_code()
  
close all;
X= rand(100,4);
size(X)
K = 5; %three exemplars
indices = kmeans(X,K,'distance','city');


figure,
[silh3,h] =  silhouette(X,indices,'city');
xlabel('Silhouette Value');
ylabel('Cluster');