function cellMask = approximatecell(C1)
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

[x,y,z] = size(C1);
radius = min(x,y);
radius = double(round(radius*.45));
cellMask = zeros(x,y,z);
for i = 2:z-2
    P = zeros(x,y);
    P(round(x/2),round(y/2)) = 1; 
    r = radius * sqrt(1 - ((z/2-i)/(z/2))^2);
    SE = strel('disk',double(round(r)),8);
    P = imdilate(P, SE);
    cellMask(:,:,i) = P;
end

end

