%This program can be used to automate analysis of mutiple image files

% [C1,C2,C3,voxelSize] = loadtif3('1_FGFR-Venus and Rab4-CLIP + CLIP-Cell TMR-Star with Truncated Cyclin B (MD 04-23-2017).lif - E4-1.tif');
% cellMask = thresholdcell(C1,.25,5);
% cellMask1 = separatecells(cellMask,.5,voxelSize);
% 
% %visualize results
% figure;
% p = patch(isosurface(cellMask));
% p.FaceColor = 'red';
% p.EdgeColor = 'none';
% p.FaceAlpha = .5;
% % hold on;
% % p1 = patch(isosurface(region2));
% % p1.FaceColor = 'blue';
% % p1.EdgeColor = 'none';
% % p1.FaceAlpha = .5;
% camlight;
% lighting phong;

C1 = zeros(500,500,500);
clippingPlane = makeplane(C1,2,3,5,300000);
implay(clippingPlane);








