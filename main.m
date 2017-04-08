%This program can be used to automate analysis of mutiple image files

[C1,C2,C3,voxelSize] = loadtif3('test.tif');
cellMask = thresholdcell(C2,.6,2);
[vesicles, vesstats] = thresholdvesicles(C2,cellMask,.23,10,1);
vesstats = getdistance(cellMask,vesstats,voxelSize);

%visualize results
figure;
p = patch(isosurface(cellMask));
p.FaceColor = 'red';
p.EdgeColor = 'none';
p.FaceAlpha = .3;
hold on;
p1 = patch(isosurface(vesicles));
p1.FaceColor = 'blue';
p1.EdgeColor = 'none';
camlight;
lighting phong;

% cellMask = watershedcell(C1,cellMask);
% [vesicles, vesstats] = thresholdvesicles(C1,cellMask,.5,.5,2);
% figure;
% p = patch(isosurface(cellMask));
% p.FaceColor = 'red';
% p.EdgeColor = 'none';
% camlight;
% lighting phong;







