function C1 = loadtif1(filename)
%This funciton loads a 1 channel tif image given a filename.
%
%   C1 = loadtif('test.tif')
%
%Author: William Colgan
%Date: 4/4/17
%Contact: colgan.william@gmail.com

%get the info
info = imfinfo(filename);

%get dimensions
x = info.Height;
y = info.Width;
z = size(info,1);

%create matrices for channel
C1 = zeros(x,y,z,'double');

%for each plane
for i = 1:z
   C1(:,:,i) = im2double(imread(filename,i));
end

end
