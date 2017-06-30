[C1,C2,C3,voxelSize] = loadtif3('E4_FGFR-Venus and CLIP-Rab7 + CLIP-Cell TMR-Star with BI2536 Treatment MD 06-20-2017.lif - 7-1.tif');
cellMask = loadtif1('mask_E4_FGFR-Venus and CLIP-Rab7 + CLIP-Cell TMR-Star with BI2536 Treatment MD 06-20-2017.lif - 7-1.tif');
C1 = imgaussfilt(C1.*cellMask,1);
thresh = getthresh(C1,cellMask,90);
C1 = C1.*cellMask;
C1 = imquantize(C1.*cellMask,thresh);
C2 = imgaussfilt(C2.*cellMask,1);
thresh = getthresh(C2,cellMask,95);
C5 = double(zeros(size(C2)));
C5(C2>thresh) = 1;
C5 = bwareaopen(C5,2);
implay(C5);
disp(sum(sum(sum(C4.*C5)))/sum(sum(sum(C5))));

% C1 = C1.*cellMask;
% [x,y,z] = size(C1);
% v1 = sort(reshape(C1,[x*y*z,1]));
% k = find(v1);
% v1 = v1(k(1):end);
% C1(C1<prctile(v1,90)) = 0;
% C2 = C2.*cellMask;
% v2 = sort(reshape(C2,[x*y*z,1]));
% k = find(v2);
% v2 = v2(k(1):end);
% C2(C2<prctile(C2,90)) = 0;


