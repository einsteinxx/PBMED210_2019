function weights=train_weights(train, l_rate, n_epoch)
    %train is dataset, full
    % Estimate Perceptron weights using stochastic gradient descent
    
    weights =double(zeros(length(train(1))));
    
    
    for epoch = 1:n_epoch
        sum_error = 0.0;
        for ii = 1:length(train)
            prediction = predict(train(ii,end), weights);
            
            error = train(ii,end) - prediction;
            sum_error = sum_error + pow2(error);
            weights(1) = weights(1) + l_rate * error;
            
            for jj =1: length(train(ii))-1
                weights(jj+1) = weights(jj+1) + l_rate * ...
                    error * train(ii,jj);
            end
            fprintf(1,'>epoch=%d, lrate=%f, error=%f\n', ...
                epoch, l_rate, sum_error);
        end
        
        
    end
    
    
end