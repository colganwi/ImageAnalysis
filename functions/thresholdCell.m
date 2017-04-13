function cellMask = thresholdcell(C1,thresh,sigma)
%This function thresholds a 3D image to segment the cell. It returns a
%binary mask of type double where 1 is in the cell and 0 is outside of 
%the cell. The threshLevel can go from 0 to 2.
%
%   cellMask = thresholdcell(C1,thresh,sigma) 
%
%Author: William Colgan
%Date: 4/4/17
%Contact: colgan.william@gmail.com

%make new channel and set threshold
C2 = zeros(size(C1),'double'); %make a new image
thresh = multithresh(C1)*thresh*2; %set threshold

%for threshold each plane
for i = 1:size(C1,3)
    P = C1(:,:,i); %get plane i
    P = imgaussfilt(P,sigma); %apply gaussfilt
    P = double(P>thresh); %threshold
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