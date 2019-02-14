

data_dir = '~/BMP210_CVIB_WINTER_2019/ML_FILES';

mine_file = 'sonar.all-data.csv';
fname = fullfile(data_dir, mine_file);

data = csvread(fname);


%% INDEPENDENT EXAMPLE
%https://machinelearningmastery.com/implement-perceptron-algorithm-scratch-python/

dataset = [[2.7810836,2.550537003,0],
	[1.465489372,2.362125076,0],
	[3.396561688,4.400293529,0],
	[1.38807019,1.850220317,0],
	[3.06407232,3.005305973,0],
	[7.627531214,2.759262235,1],
	[5.332441248,2.088626775,1],
	[6.922596716,1.77106367,1],
	[8.675418651,-0.242068655,1],
	[7.673756466,3.508563011,1]];
%weight #1 is the bias, w2 and w3 are weights
weights = [-0.1, 0.20653640140000007, -0.23418117710000003];

%%
for ii = 1:size(dataset,1)
   prediction = predict(dataset(ii,:),weights);
   fprintf(1,'Expected=%d, Predicted=%d\n', ...
       dataset(ii,end),prediction);
    
end

%% 
l_rate = 0.1;
n_epoch = 5;
weights = train_weights(dataset, l_rate, n_epoch);
weights