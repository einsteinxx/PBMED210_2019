#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Mar  6 21:50:13 2019

@author: kgonzalez
"""


from keras.models import Sequential
from keras.layers import Dense
import numpy
import pdb
# fix random seed for reproducibility
def keras_example():
    numpy.random.seed(7)
    
    
        # load pima indians dataset
    dataset = numpy.loadtxt("/home/kgonzalez/python_code/pima-indians-diabetes.data.csv", delimiter=",")
    # split into input (X) and output (Y) variables
    #pdb.set_trace()
    X = dataset[:,0:8]
    Y = dataset[:,8]
    
    
    # create model
    model = Sequential()
    model.add(Dense(12, input_dim=8, activation='relu'))
    model.add(Dense(8, activation='relu'))
    model.add(Dense(1, activation='sigmoid'))


# Compile model
    model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])
    
    
    # Fit the model
    model.fit(X, Y, epochs=300, batch_size=10) #epochs was 150
    
    
    # evaluate the model
    scores = model.evaluate(X, Y)
    print("\n%s: %.2f%%" % (model.metrics_names[1], scores[1]*100))
    
    
    
    
    
    
    