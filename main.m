%This program can be used to automate analysis of mutiple image files
%
%Author: William Colgan
%Date: 3/21/17
%Contact: colgan.william@gmail.com

%Get image file our specify filename
filename = uigetfile('*.tif');
%Do analysis for the image
[colocalization] = imageAnalysis(filename);
%Save as excel file
filename = string(filename);
T = table(filename,colocalization);
fileout = 'analysis.xlsx';
writetable(T,fileout,'Sheet',1,'Range','A1');





