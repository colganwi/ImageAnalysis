function [vesicles, vesstats] = thresholdvesicles(C1,cellMask,varargin)
% This function efficiently segments a 2D image. It returns a bianry mask
% where 1 is in the cell and 0 is outside of the cell. It uses
% thresholding.
%
%Author: William Colgan
%Date: 2/14/17
%Contact: colgan.william@gmail.com

%get peramiters
if size(varargin) == 1
    threshLevel = varargin{1};
    vesSize = .5;
elseif size(varargin) == 2
    threshLevel = varargin{1};
    vesSize = varargin{2};
else
    threshLevel = .5;
    vesSize = .5;
end

x = size(C1,1);
y = size(C1,2);
z = size(C1,3);
vesicles = zeros(x,y,z,'double');
C2 = C1.*cellMask;

thresh = multithresh(C2)*threshLevel;

for i = 1:z
    I = C2(:,:,i);
    I2 = imgaussfilt(I,[1 1]);
    I3 = im2bw(I2,10*thresh);
    I4 = imfill(I3, 'holes');
    I5 = bwareaopen(I4,round(10*vesSize));
    vesicles(:,:,i) = I5;
end
L = bwlabeln(C2);
vesstats = regionprops(L);
end