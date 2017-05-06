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
z = size(info,1)/3;

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
    description = info.ImageDescription;
    i = strfind(description,'spacing');
    zSize = str2double(description(i+8:i+16));
    voxelSize = [xSize,ySize,zSize];
    i = strfind(description,'max');
    if(str2double(description(i+4:i+8)) ~= 4095)
        brightness = 16;
    end 
end

%creat matrices for each channel
C1 = zeros(x,y,z,'double');
C2 = zeros(x,y,z,'double');
C3 = zeros(x,y,z,'double');

%for each plane
for i = 1:z
   C2(:,:,i) = im2double(imread(filename,3*i-2)).*brightness;
   C3(:,:,i) = im2double(imread(filename,3*i-1)).*brightness;
   C1(:,:,i) = im2double(imread(filename,3*i)).*brightness;
end
end