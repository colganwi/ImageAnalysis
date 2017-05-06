%This program can be used to automate analysis of mutiple image files

[C1,C2,C3,voxelSize] = loadtif3('1_FGFR-Venus and Rab4-CLIP + CLIP-Cell TMR-Star with Truncated Cyclin B (MD 04-23-2017).lif - E2 Take 2-1.tif');
cellMask = thresholdcell(C1,.3,1);
cellMask = separatecells(cellMask,.5,voxelSize);
cellMask = refinemask(cellMask,-3);
[region1,region2,region3] = makeregions(cellMask,1,3,voxelSize);
result = analyzeregions(C1,C2,cellMask,region1,region2,region3)

%visualize results
figure;
p = patch(isosurface(cellMask));
p.FaceColor = 'red';
p.EdgeColor = 'none';
p.FaceAlpha = .5;
hold on;
p1 = patch(isosurface(region2));
p1.FaceColor = 'blue';
p1.EdgeColor = 'none';
p1.FaceAlpha = .5;
camlight;
lighting phong;

% cellMask = watershedcell(C1,cellMask);
% [vesicles, vesstats] = thresholdvesicles(C1,cellMask,.5,.5,2);
% figure;
% p = patch(isosurface(cellMask));
% p.FaceColor = 'red';
% p.EdgeColor = 'none';







