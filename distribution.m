%This script generates a circle plot for selected folder of image. If the folder does not
%work, run the checkfolder.m script. Select whole to analyze the whole
%cell, ventral for the ventral half, and doral for the dorsal half.
%
%Author: William Colgan
%Date: 2/26/18
%Contact: colgan.william@gmail.com

%get the path for the folder
path = uigetdir('/Users/cionalab/Google Drive/William/Image Analysis');
addpath(path);

%get the region to analyze
types = {'whole','ventral','dorsal'};
[selection,~] = listdlg('ListString',types);

colors = {'green','orange','blue','magenta','fire','firegb','parula','jet',...
    'hsv','hot','cool','gray'};
%get the color for the FGFR enrighmet
[selectionFGFR,~] = listdlg('PromptString','Select FGFR colormap','ListString',colors);
%get the color for the rab overlap
[selectionRab,ok] = listdlg('PromptString','Select Rab colormap','ListString',colors);


%make circle plot for each selected region
for i = 1:size(selection,2)
    r = analyze(path,types{selection(i)});
    overlap = [mean(r.overlap1)/.75,mean(r.overlap2)/.75,mean(r.overlap3)/.75];
    enrichment = [mean(r.enrichgreen1)/1.8,mean(r.enrichgreen2)/1.8,mean(r.enrichgreen3)/1.8];
    cellicon1(enrichment,strcat(types{selection(i)},' FGFR enrichment'),colors{selectionFGFR(1)},1)
    cellicon1(overlap,strcat(types{selection(i)},' Rab overlap'),colors{selectionRab(1)},0)
end
clear; 