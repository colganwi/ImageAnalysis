function result = loadlif()
% This funciton return a n by 3 cell where n is the number of series in the
% lif file. The red, green, and blue channels are stored in {i,1}, {i,2},
% and {i,3} as an x by y by x double array.
%
%Author: William Colgan
%Date: 9/2/17
%Contact: colgan.william@gmail.com

%load the lif file
data = bfopen();
%get the number of series
numseries = size(data, 1);
%make result
result = cell(numseries,3);
%interate through series
for i = 1:numseries
   %get series
   series = data{i,1};
   %get dimensions
   x = size(series{1,1},1);
   y = size(series{1,1},2);
   z = size(series,1)/2;
   %create cell for each channel
   result{i,1} = zeros(x,y,z,'double');
   result{i,2} = zeros(x,y,z,'double');
   %get channel properties
   result{i,3} = struct('sizex',double(data{i,4}.getPixelsPhysicalSizeX(0).value(ome.units.UNITS.MICROMETER)),'sizey',double(data{i,4}.getPixelsPhysicalSizeY(0).value(ome.units.UNITS.MICROMETER)),'sizez',double(data{i,4}.getPixelsPhysicalSizeZ(0).value(ome.units.UNITS.MICROMETER)));
   %interate through planes
   for j = 1:z
       %add each channel to the result
       result{i,1}(:,:,j) = im2double(series{j*2-1,1}*30);
       result{i,2}(:,:,j) = im2double(series{j*2,1}*30);
   end
end
end

