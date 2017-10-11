[C1,C2,C3,voxelSize] = loadtif3('prophase1.tif');
cellMask = loadtif1('mask_prophase1.tif');
% cellMask = flip(cellMask,3);
% cellMask = flip(cellMask,2);
%[region1,region2,region3] = makeregions(cellMask,1,2,voxelSize);
% D = ones(size(cellMask));
% D((1:150),(1:175),(1:50)) = 0;
% D = flip(D,3);
% D = flip(D,2);
% region1 = region1.*D;
% region2 = region2.*D;
% region3 = region3.*D;
% p = patch(isosurface(region1));
% p.FaceColor = 'magenta';
% p.EdgeColor = 'none';
% p.FaceAlpha = 1;
% hold on
% p1 = patch(isosurface(region2));
% p1.FaceColor = 'blue';
% p1.EdgeColor = 'none';
% p1.FaceAlpha = 1;
% hold on
% p2 = patch(isosurface(region3));
% p2.FaceColor = 'green';
% p2.EdgeColor = 'none';
% p2.FaceAlpha = 1;
% 
% 
% camlight;
% set(gca,'color','black')
% lighting phong;


C1 = C1.*cellMask;
C2 = C2.*cellMask;
C4 = imgaussfilt(C1,1);
thresh = getthresh(C4,cellMask,90);
C4 = double(C4>thresh);
C5 = imgaussfilt(C2,1);
thresh = getthresh(C5,cellMask,90);
maximum = max(max(max(C5)));
C5(C5<thresh) = 0;
C5 = (C5-thresh).*(1/(maximum-thresh));
disp(max(max(max(C5))));
savetif1(C5(:,:,62),'redtprophase1.tif');
% C6 = C5.*C4;
% C4 = C4.*cellMask;
% C5 = C5.*cellMask;
% disp(sum(sum(sum(C6)))/sum(sum(sum(C5))));
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
% 
% 
% camlight;
% set(gca,'color','black')
% lighting phong;


