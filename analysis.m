%This script analyzes a selected folder of image. If the folder does not
%work, run the checkfolder.m script. Select whole to analyze the whole
%cell, ventral for the ventral half, and doral for the dorsal half. Excel
%files are saved in the folder you select.
%
%Author: William Colgan
%Date: 2/26/18
%Contact: colgan.william@gmail.com

%get the path for the folder
path = uigetdir('/Users/cionalab/Google Drive/William/Image Analysis');
addpath(path);
[~,name,~] = fileparts(path);

%get the region to analyze
types = {'whole','ventral','dorsal'};
[selection,ok] = listdlg('ListString',types);

%analyze each selected region.
for i = 1:size(selection,2)
    results = analyze(path,types{selection(i)});
    writetable(struct2table(results),strcat(path,'/',...
        types{selection(i)},'_analysis_',name,'.xls'));
end
clear;