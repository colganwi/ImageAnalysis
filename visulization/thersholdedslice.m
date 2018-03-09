%This script saves a specific slice of the thresholded image. Select the
%image file with you want and then select the slice. The images will be
%saved in the data folder. There must be a mask in the same folder as the
%image.
%
%
%Author: William Colgan
%Date: 9/15/17
%Contact: colgan.william@gmail.com

%get list of images to analyze
path = uigetfile('*.tif');
[filepath,name,ext] = fileparts(path);

slice = inputdlg('What slice?');
slice = str2num(cell2mat(slice));

[C1,C2,C3,voxelSize] = loadtif3(path);
cellMask = loadtif1(strcat(filepath,'mask_',name,ext));
[region1,region2,region3] = makeregions(cellMask,1,3,voxelSize);

%Threshold red
C1 = imgaussfilt(C1,.1/voxelSize(1));
thresh = getthresh(C1,cellMask,95);
tC1 = double(C1>thresh);
tC1 = tC1.*cellMask;
%Threshold green
C2 = imgaussfilt(C2,.1/voxelSize(1));
thresh = getthresh(C2,cellMask,95);
tC2 = double(C2>thresh);
tC2 = tC2.*cellMask;

savetif1(tC1(:,:,slice),strcat('data/C1_',name,ext))
savetif1(tC2(:,:,slice),strcat('data/C2_',name,ext))
regions = bwperim(region1(:,:,slice))+bwperim(region3(:,:,slice));
savetif1(regions,strcat('data/regions_',name,ext))



