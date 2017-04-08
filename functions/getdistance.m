function vesstats = getdistance(cellMask,vesstats,voxelSize)
% This function calculates the distance to the cell mask for each vesicle.
%
%Author: William Colgan
%Date: 4/8/17
%Contact: colgan.william@gmail.com
edge = bwperim(cellMask); %get edge of mask
[X, Y, Z] = ind2sub(size(edge),find(edge>0)); %convert to points
points = [X.*voxelSize(1),Y.*voxelSize(2),Z.*voxelSize(3)]; %set to voxel size
centroids = cat(1, vesstats.Centroid); %get centroids
centroids = centroids.*voxelSize; %set to voxel size
[index,dist] = knnsearch(points,centroids); %find nearest point on edge
for i = 1:length(dist)
    vesstats(i).Distance = dist(i); %set Distance field
end

end