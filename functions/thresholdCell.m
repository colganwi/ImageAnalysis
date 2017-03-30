function cellMask = thresholdCell(C1,varargin)
% This function efficiently segments a 3D image. It returns a bianry mask
% where 1 is in the cell and 0 is outside of the cell. It uses
% thresholding.
%
%Author: William Colgan
%Date: 14/2/17
%Contact: colgan.william@gmail.com

%get peramiters
if size(varargin) == 1
    threshLevel = varargin{1};
else
    threshLevel = .5;
end
%get the size of the image
x = size(C1,1);
y = size(C1,2);
z = size(C1,3);
%make a new image
C2 = zeros(x,y,z,'double');
%iterate through the planes of the image
thresh = multithresh(C1)*threshLevel*2;

for i = 1:z
    %get plane j
    I1 = C1(:,:,i);
    %apply a 
    I2 = imgaussfilt(I1,[5 5]);
    I3 = im2bw(I2,thresh);
    SE = strel('diamond',10);
    I4 = imdilate(I3, SE);
    I5 = imfill(I4, 'holes');
    I6 = imerode(I5,SE);
    I8 = bwareaopen(I6,200);
    C2(:,:,i) = I8;
end
L = bwlabeln(C2);
stats = regionprops(L);
[M,i] = max(cat(1,stats.Area));
cellMask = (L == i);
end