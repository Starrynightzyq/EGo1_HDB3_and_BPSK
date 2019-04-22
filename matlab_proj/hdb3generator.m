clc;
clear all;
close all;
%产生随机的[0，1]范围的整数
len = 800;
A = round(1*rand(1,800));                   % 随机生成一个长度为800，[0,1]范围的数列（均匀分布）
dlmwrite ('data.txt',A,'delimiter',' ');     % 写文件，用空格作为分隔符