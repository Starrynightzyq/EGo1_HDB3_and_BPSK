clc;
clear all;
close all;
%���������[0��1]��Χ������
len = 800;
A = round(1*rand(1,800));                   % �������һ������Ϊ800��[0,1]��Χ�����У����ȷֲ���
dlmwrite ('data.txt',A,'delimiter',' ');     % д�ļ����ÿո���Ϊ�ָ���