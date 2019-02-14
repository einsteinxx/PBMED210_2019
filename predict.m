function pout=predict(row, weights)
    
    activation = weights(1);
    for ii =1:(length(row) - 1)
       activation = activation + weights(ii+1) * row(ii); 
    end
    
    if (activation >= 0.0)
       pout = 1.0; 
    else
        pout = 0.0;
    end
    
end