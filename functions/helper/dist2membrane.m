function [index dist] = dist2membrane(stats, edge)
% This function efficiently segments a 2D image. It returns a bianry mask
% where 1 is in the cell and 0 is outside of the cell. It uses
% thresholding.
%
%Author: William Colgan
%Date: 14/2/17
%Contact: colgan.william@gmail.com
centroids = cat(1, stats.Centroid);
[X Y Z] = ind2sub(size(edge), find(edge>0));
points = [X,Y,Z];
[index,dist] = knnsearch(points,centroids);
end