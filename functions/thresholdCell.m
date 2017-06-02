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
cellMask = zeros(size(C1),'double'); %make a new image
thresh = multithresh(C1)*thresh*2; %set threshold
numplanes = size(C1,3);

%normalize the intensity in the z plane
Y = reshape(mean(mean(C1)),[numplanes,1]);
X = reshape(linspace(1,numplanes,numplanes),[numplanes,1]);
b = X\Y;

%for threshold each plane
for i = 1:numplanes
    P = C1(:,:,i)*(1-i*b);
    %P = C1(:,:,i);
    if(sigma > 0)
    P = imgaussfilt(P,sigma); %apply gaussfilt
    end
    P = double(P>thresh); %threshold
    SE = strel('diamond',10);
    P = imdilate(P, SE); %dilate to close gaps
    [x,y] = size(P);
    P(1,:) = 0;
    P(:,1) = 0;
    P(:,y) = 0;
    P(x,:) = 0;
    P = imfill(P, 'holes'); %fill holes
    P = imerode(P,SE); %undo dilation
    cellMask(:,:,i) = P;
end
SE = strel('sphere',5);
cellMask = imerode(cellMask,SE);
cellMask = bwareaopen(cellMask,10000);
cellMask  = imdilate(cellMask, SE);
cellMask = double(cellMask);

%visualize cell mask
% figure;
% p = patch(isosurface(cellMask));
% p.FaceColor = 'red';
% p.EdgeColor = 'none';
% p.FaceAlpha = .5;
% camlight;
% lighting phong;


end