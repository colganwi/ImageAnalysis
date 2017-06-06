function [region1,region2,region3] = makeregions(cellMask,d1,d2,voxelSize)
%This function calculates the pearson value intensity of 4 regions,
%
%   colocalization = pearson(C1,C2,cellMask)
%
%Author: William Colgan
%Date: 2/14/17
%Contact: colgan.william@gmail.com

[x,y,z] = size(cellMask);
scale = voxelSize(3)/voxelSize(1);
s = voxelSize(1);
C = imresize3(cellMask,[x,y,round(z*scale)],'nearest');

%find regions
D = bwdist(~C);
C1 = double(D > d1/s);
C2 = double(D > d2/s);
region1 = C - C1;
region2 = C1 - C2;
region3 = C2;

region1 = imresize3(region1,[x,y,z],'nearest');
region2 = imresize3(region2,[x,y,z],'nearest');
region3 = imresize3(region3,[x,y,z],'nearest');

end