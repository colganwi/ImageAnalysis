%This program checks a folder of image to ensure that they are compatible
%with the analyze.m. It automatically fixes depth, if teh depth of the 
%mask does not match the depth of the image.
%
%Author: William Colgan
%Date: 2/23/18
%Contact: colgan.william@gmail.com

path = uigetdir('/Users/cionalab/Google Drive/William/Image Analysis');
addpath(path);
filenames = dir(path);
names = {filenames(:).name};
image = {};
for i = 1:size(names,2)
    name = names{i};
    [~,title,ext] = fileparts(name); 
    if(strcmp(ext,'.tif') &&  title(1) ~= 'm')
        image = {image{:},name};
    end
end
n = size(image,2);
for i = 1:n
    [C1,C2,C3,voxelSize] = loadtif3(image{i});
    try
    cellMask = loadtif1(strcat('mask_',image{i}));
    if sum(size(cellMask)-size(C1)) ~= 0
        if size(cellMask,3) ~= size(C1,3)
            cellMask = cellMask(:,:,(1:size(C1,3)));
            savetif1(cellMask,strcat(path,'/mask_',image{i}));
            disp(strcat("Automatically fixed the depth for ",image{i}));
        else
            disp(strcat("The mask width or hight does not agree for ",image{i}));
        end
    end
    catch
        disp(strcat("Missing mask for  ",image{i}));
    end
end