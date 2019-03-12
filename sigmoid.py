#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Mar  6 19:08:31 2019

@author: kgonzalez
"""
from matplotlib import *
import numpy as np
from math import *

def sigmoid():
    a = 1
    data = range(-10,10)
    print(data)
    s = np.array(10,1)
    counter = 0
    for x in data:
        s[idx] = 1/(1 + exp(-x))
        counter = counter + 1
    print(s)