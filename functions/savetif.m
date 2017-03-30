function savetif(filename,data)
% This funciton return a n by 3 cell where n is the number of series in the
% lif file. The red, green, and blue channels are stored in {i,1}, {i,2},
% and {i,3} as an x by y by x double array.
%
%Author: William Colgan
%Date: 9/2/17
%Contact: colgan.william@gmail.com

%load the tif file
[x,y,z] = size(data{1,1});
numChannels = size(data,2);
result = uint16(zeros(x,y,z*numChannels));
for i = 1:z
    for j = 1:numChannels
    result(:,:,i*numChannels - (numChannels - j)) = uint16(data{1,j}(:,:,i));
    end
obj = Tiff(filename,'w')
write(tiffobj,imageData)
imwrite(result,filename,'Tiff')
end
end