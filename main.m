%This program can be used to automate analysis of mutiple image files
%
%Author: William Colgan
%Date: 3/21/17
%Contact: colgan.william@gmail.com

[C1,C2,C3,voxelSize] = loadtif3('test1.tif');
cellMask = approximatecell(C1);
cellMask = watershedcell(C1,cellMask);
[vesicles, vesstats] = thresholdvesicles(C1,cellMask,.5,.5,2);
figure;
p = patch(isosurface(cellMask));
p.FaceColor = 'red';
p.EdgeColor = 'none';
camlight;
lighting phong;







