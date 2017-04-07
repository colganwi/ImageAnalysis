function cellMask = watershedcell(C1,cellMask)
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

SE = strel('sphere', 5);
inside = imerode(cellMask,SE);
SE = strel('sphere', 10);
outside = 1 - imdilate(cellMask,SE);
[x,y,z] = size(outside);
outside(1,:,:) = 1;
outside(:,1,:) = 1;
outside(:,:,1) = 1;
outside(x,:,:) = 1;
outside(:,y,:) = 1;
outside(:,:,z) = 1;
cellMask = inside + outside;
C1 = imgaussfilt3(C1,[2,2,.5]);
R = imimposemin(C1,cellMask);
L = watershed(R);
i = L(round(x/2),round(y/2),round(z/2));
cellMask = double(L==i);
SE = strel('disk', 5);
cellMask = imdilate(cellMask,SE);

end

