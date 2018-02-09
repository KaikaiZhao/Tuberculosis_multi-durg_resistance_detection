% % load_pic.m
% clc;clear;
% load_mask.m
% clc;clear;
% comMask.m;
% clc;clear;
% feature_extractor
feature_extractor
clc;clear;
load v36.mat
load v37.mat
[newX,T,meanValue] = mypca(v37,0.99);
svm
save result37

feature_extractor
clc;clear;
[newX,T,meanValue] = mypca(v36,0.995);
svm
save result36 