function [C1,C2,C3,voxelSize] = loadtif3(filename)
%This funciton loads a 3 channel tif image given a filename. It returns the
%channels as 3D double matrices and return the voxel size if the image has 
%resolution data.
%
%   [C1,C2,C3,voxelSize] = loadtif(filename)
%
%Author: William Colgan
%Date: 4/4/17
%Contact: colgan.william@gmail.com

%get the info
info = imfinfo(filename);

%get dimensions
x = info.Height;
y = info.Width;
description = info.ImageDescription;
i = strfind(description,'channels');
c = str2double(description(i+9:i+10));
z = size(info,1)/c;

%brightness
brightness = 16;
%get voxel size
xRes = info.XResolution;
if isempty(xRes) %if it does not have resolution
    voxelSize = [];
else
    xSize = 1/xRes;
    yRes = info.YResolution;
    ySize = 1/yRes;
    i = strfind(description,'spacing');
    zSize = str2double(description(i+8:i+16));
    voxelSize = [xSize,ySize,zSize];
end
%creat matrices for each channel
C1 = zeros(x,y,z,'double');
C2 = zeros(x,y,z,'double');
C3 = zeros(x,y,z,'double');

%for each plane
if c == 3
    for i = 1:z
       C2(:,:,i) = im2double(imread(filename,3*i-2));
       C3(:,:,i) = im2double(imread(filename,3*i-1));
       C1(:,:,i) = im2double(imread(filename,3*i));
    end
    
elseif c == 2
    for i = 1:z
       C2(:,:,i) = im2double(imread(filename,2*i-1));
       C3(:,:,i) = im2double(imread(filename,2*i));
    end
end

if max(max(max(C3)))>.1
    brightness = 1;
end

C1 = C1.*brightness;
C2 = C2.*brightness;
C3 = C3.*brightness;


end