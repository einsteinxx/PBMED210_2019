#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jan 13 01:41:23 2019

@author: kgonzalez
"""

import os
import glob
from shutil import copyfile


def find_file(ext = '.jp'):
    jlist = []
    plisting =[]
    movie_list=[]
    
    out_dir = '/home/kgonzalez/GPHOTO_ARCHIVE_PULL'
    movie_dir= '/home/kgonzalez/GMOVIE_ARCHIVE_PULL'
    
    main_dir = '/'
    main_dir = '/home/kgonzalez/GPHOTO_UNZIP'
    #'/mnt/J/GPHOTOS_ARCHIVE/GDRIVE/Takeout/Google Photos'
    for root, directories, filenames in os.walk(main_dir):
        for directory in directories:
            #print(os.path.join(root, directory))
            file_list = os.listdir(os.path.join(root,directory))
            #print(file_list)
            
            for filename in file_list:
                
                #anything with json will be weeded out first
                if (filename.upper().find('.json'.upper()) >=0):
                  a=1  
                elif(filename.upper().find(ext.upper()) >= 0):
                    jlist.append(os.path.join(root, directory, filename))
#                elif (filename.upper().find('.jpeg'.upper()) >=0):
#                    listing.append(os.path.join(root, directory, filename))

                #elif (filename.upper().find('.JPG'.upper()) >=0):
                #    jlist.append(os.path.join(root, directory, filename))


                    
                elif (filename.upper().find('.PNG'.upper()) >=0):
                    jlist.append(os.path.join(root, directory, filename))
                    
                elif (filename.upper().find('.MOV'.upper()) >=0):
                    movie_list.append(os.path.join(root, directory, filename))
                    #do nothing, leave this out
                    a=1
                elif (filename.upper().find('.MP4'.upper()) >=0):
                    movie_list.append(os.path.join(root, directory, filename))
                    #do nothing, leave this out
                    a=1
                elif (filename.upper().find('.gif'.upper()) >=0):
                    #do nothing, leave this out
                    a=1
                else:
                    print(filename)
                        
                
                
#            for filename in filenames:
#                #print(os.path.join(root, directory, filename))
#                if(filename.upper().find(ext.upper()) >= 0):
#                 #   print('found')
#                    #print(os.path.join(root, directory, filename))
#                    listing.append(os.path.join(root, directory, filename))
#                else:
#                    #print(os.path.join(root, directory, filename))
#                    a=1 #placeholder
#...     for directory in directories:
#...             print os.path.join(root, directory) 
#...     for filename in filenames: 
#...             print os.path.join(root,filename) 
    print("Search phase over!")
    
    copy_image(jlist,out_dir)
    
    #print("Copying movies")
    #copy_image(movie_list,movie_dir)
    return jlist


import shutil
def copy_image(file_list=[],dest_dir='~'):
    print('In copy image')
    print(file_list[0])
    print(dest_dir)
    for fname in file_list:
        print(fname)
        shutil.copy2(fname,dest_dir)
#    shutil.copy2('/src/dir/file.ext', '/dst/dir/newname.ext') # complete target filename given
#shutil.copy2('/src/file.ext', '/dst/dir') # target filename is /dst/dir/file.ext
    a = 1