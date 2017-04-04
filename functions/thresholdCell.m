function cellMask = thresholdcell(C1,varargin)
%This function thresholds a 3D image to segment the cell. It returns a
%binary mask of type double where 1 is in the cell and 0 is outside of 
%the cell. The threshLevel can go from 0 to 2.
%
%   cellMask = thresholdcell(C1)
%   cellMask = thresholdcell(C1,1.5) 
%
%Author: William Colgan
%Date: 4/4/17
%Contact: colgan.william@gmail.com

%set peramiters
if size(varargin) == 1
    threshLevel = varargin{1};
else
    threshLevel = .5;
end

%make new channel and set threshold
[x,y,z] = size(C1); %get the size of the image
C2 = zeros(x,y,z,'double'); %make a new image
thresh = multithresh(C1)*threshLevel*2; %set threshold

%for threshold each plane
for i = 1:z
    P = C1(:,:,i); %get plane i
    P = imgaussfilt(P,[5 5]); %apply gaussfilt
    P = im2bw(P,thresh); %threshold
    SE = strel('diamond',10);
    P = imdilate(P, SE); %dilate to close gaps
    P = imfill(P, 'holes'); %fill holes
    P = imerode(P,SE); %undo dilation
    C2(:,:,i) = P;
end

%select largest region
L = bwlabeln(C2); %label regions
stats = regionprops(L); %get region properties
[M,i] = max(cat(1,stats.Area)); %find largest region
cellMask = (L == i); %include only largest region

end