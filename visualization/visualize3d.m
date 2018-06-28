[C1,C2,C3,voxelSize] = loadtif3('new.tif');	
cellMask = loadtif1('mask_new.tif');	
	
cellMask = flip(cellMask,3);	
cellMask = flip(cellMask,2);	
[region1,region2,region3] = makeregions(cellMask,1,3,voxelSize);	
D = ones(size(cellMask));	
D((150:end),(10:150),(40:end)) = 0;	
D = flip(D,3);	
D = flip(D,2);	
region1 = region1.*D;	
region2 = region2.*D;	
region3 = region3.*D;	
p = patch(isosurface(region1));	
p.FaceColor = 'cyan';	
p.EdgeColor = 'none';	
p.FaceAlpha = 1;	
hold on	
p1 = patch(isosurface(region2));	
p1.FaceColor = [.6 0 1];	
p1.EdgeColor = 'none';	
p1.FaceAlpha = 1;	
hold on	
p2 = patch(isosurface(region3));	
p2.FaceColor = [0.5 0.5 0.5];	
p2.EdgeColor = 'none';	
p2.FaceAlpha = 1;	
	
% C1 = C1.*cellMask;	
% C2 = C2.*cellMask;	
% C3 = C3.*cellMask;
% C4 = imgaussfilt(C1,1);	
% thresh = getthresh(C4,cellMask,95);	
% C4 = double(C4>thresh);	
% C5 = imgaussfilt(C2,1);	
% thresh = getthresh(C5,cellMask,95);	
% C5 = double(C5>thresh);			
% C4 = C4.*cellMask;	
% C5 = C5.*cellMask;
% C6 = C5.*C4;
% C4 = C4-C6;
% C5 = C5-C6;
% cellMask = flip(cellMask,3);	
% cellMask = flip(cellMask,2);	
% p = patch(isosurface(cellMask));	
% p.FaceColor = 'white';	
% p.EdgeColor = 'none';	
% p.FaceAlpha = .1;	
% hold on	
% C4 = flip(C4,3);	
% C4 = flip(C4,2);	
% p1 = patch(isosurface(C4));	
% p1.FaceColor = 'magenta';	
% p1.EdgeColor = 'none';	
% p1.FaceAlpha = .3;	
% hold on	
% C5 = flip(C5,3);	
% C5 = flip(C5,2);	
% p2 = patch(isosurface(C5));	
% p2.FaceColor = 'green';	
% p2.EdgeColor = 'none';	
% p2.FaceAlpha = .3;	
% C6 = flip(C6,3);	
% C6 = flip(C6,2);	
% p3 = patch(isosurface(C6));	
% p3.FaceColor = 'white';	
% p3.EdgeColor = 'none';	
% p3.FaceAlpha = 1;	

% C3 = imgaussfilt(C3,1);	
% thresh = getthresh(C3,cellMask,98);	
% C3 = double(C3>thresh);			
% C3 = C3.*cellMask;	
% C3 = flip(C3,3);	
% C3 = flip(C3,2);	
% p4 = patch(isosurface(C3));	
% p4.FaceColor = 'blue';	
% p4.EdgeColor = 'none';	
% p4.FaceAlpha = 1;	


	

ax = gca;
%ax.Visible = 'off';
ax.XAxis.Color = 'black';	
ax.YAxis.Color = 'black';	
ax.ZAxis.Color = 'black';	
ax.LineWidth = .1;
ax.XTick = [];
ax.YTick = [];
ax.ZTick = [];
ax.XTickLabel = {};	
ax.YTickLabel = {};	
ax.ZTickLabel = {};	
ax.XGrid = 'off';	
ax.YGrid = 'off';	
ax.ZGrid = 'off';	
ax.View = [116 -67];	
ax.Box = 'on';	
	
set(gca,'color','white');	
set(gcf,'color','white');	
lighting phong;	
camlight;	
h = light;	
h.Position = [.9,1,.2];
set(gcf,'pos',[10,10,900,1000]);

