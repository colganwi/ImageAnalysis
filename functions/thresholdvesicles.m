function [vesicles, vesstats] = thresholdvesicles(C1,cellMask,threshLevel,vesSize,sigma)
%This function returns a 3D binary matrix where the vesicles are ones and 
%the statistics for the vesicles that have been found. It only finds
%vesicles in the cell mask and the threshold level and size can be specified.
%thresLevel can be between 0 and 1, vesSize must be greater than 0. 
% 
%   [vesicles, vesstats] = thresholdvesicles(C1,cellMask,threshLevel,vesSize,sigma)
%
%Author: William Colgan
%Date: 4/5/17
%Contact: colgan.william@gmail.com

vesicles = C1.*cellMask; %select only mask
thresh = threshLevel; %set thresh
vesicles = imgaussfilt3(vesicles,[sigma,sigma,1]); %apply guassian filter
vesicles = double(vesicles > thresh); %threshold image
vesicles = imfill(vesicles); %fill in holes
vesicles = bwareaopen(vesicles,round(vesSize)); %delete small vesicles
L = bwlabeln(vesicles);
vesstats = regionprops(L); %get properties
end