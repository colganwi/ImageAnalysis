[C1,C2,C3,voxelSize] = loadtif3('image.tif');
cellMask = loadtif1('mask.tif');

% cellMask = flip(cellMask,3);
% cellMask = flip(cellMask,2);


% [region1,region2,region3] = makeregions(cellMask,1,3,voxelSize);
% D = ones(size(cellMask));
% D((115:end),(115:end),(1:31)) = 0;
% D = flip(D,3);
% D = flip(D,2);
% savetif1(region1(:,:,31),'Region1.tif');
% savetif1(region2(:,:,31),'Region2.tif');
% savetif1(region3(:,:,31),'Region3.tif');
% savetif1(bwperim(region1(:,:,31)),'Perim Region1.tif');
% savetif1(bwperim(region2(:,:,31)),'Perim Region2.tif');
% savetif1(bwperim(region3(:,:,31)),'Perim Region3.tif');
% region1 = region1.*D;
% region2 = region2.*D;
% region3 = region3.*D;
% p = patch(isosurface(region1));
% p.FaceColor = 'cyan';
% p.EdgeColor = 'none';
% p.FaceAlpha = 1;
% hold on
% p1 = patch(isosurface(region2));
% p1.FaceColor = [.6 0 1];
% p1.EdgeColor = 'none';
% p1.FaceAlpha = 1;
% hold on
% p2 = patch(isosurface(region3));
% p2.FaceColor = [0.5 0.5 0.5];
% p2.EdgeColor = 'none';
% p2.FaceAlpha = 1;


C1 = C1.*cellMask;
C2 = C2.*cellMask;
C4 = imgaussfilt(C1,1);
thresh = getthresh(C4,cellMask,95);
C4 = double(C4>thresh);
savetif1(C4(:,:,94),'2D Rab.tif');
C5 = imgaussfilt(C2,1);
thresh = getthresh(C5,cellMask,95);
C5 = double(C5>thresh);
savetif1(C5(:,:,94),'2D FGF.tif');
% C6 = C5.*C4;
% C4 = C4.*cellMask;
% C5 = C5.*cellMask;
% cellMask = flip(cellMask,3);
% cellMask = flip(cellMask,2);
% p = patch(isosurface(cellMask));
% p.FaceColor = 'white';
% p.EdgeColor = 'none';
% p.FaceAlpha = .3;
% hold on
% C4 = flip(C4,3);
% C4 = flip(C4,2);
% p1 = patch(isosurface(C4));
% p1.FaceColor = 'magenta';
% p1.EdgeColor = 'none';
% p1.FaceAlpha = 1;
% hold on
% C5 = flip(C5,3);
% C5 = flip(C5,2);
% p2 = patch(isosurface(C5));
% p2.FaceColor = 'green';
% p2.EdgeColor = 'none';
% p2.FaceAlpha = 1;





% camlight;
% ax = gca;
% ax.XAxis.Color = 'white';
% ax.YAxis.Color = 'white';
% ax.ZAxis.Color = 'white';
% ax.LineWidth = 1.5;
% ax.XTickLabel = {};
% ax.YTickLabel = {};
% ax.ZTickLabel = {};
% ax.XGrid = 'on';
% ax.YGrid = 'on';
% ax.ZGrid = 'on';
% ax.View = [225 20];
% ax.Box = 'on';
% 
% set(gca,'color','black');
% set(gcf,'color','black');
% lighting phong;
% camlight;
%h = light;
%h.Position = [-.9,1,.2];


