function result = loadtif(filename)
% This funciton return a n by 3 cell where n is the number of series in the
% lif file. The red, green, and blue channels are stored in {i,1}, {i,2},
% and {i,3} as an x by y by x double array.
%
%Author: William Colgan
%Date: 9/2/17
%Contact: colgan.william@gmail.com

%load the tif file
info = imfinfo(filename);
x = info.Height;
y = info.Width;
z = size(info,1)/3;
result = cell(1,3);
result{1,1} = zeros(x,y,z,'double');
result{1,2} = zeros(x,y,z,'double');
result{1,3} = zeros(x,y,z,'double');
for i = 1:z
   %add each channel to the result
   result{1,1}(:,:,i) = im2double(imread(filename,3*i-2));
   result{1,2}(:,:,i) = im2double(imread(filename,3*i-1));
   result{1,3}(:,:,i) = im2double(imread(filename,3*i));
end
end