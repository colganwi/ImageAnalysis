function savetif1(C1,filename)
%This funciton saves a 1 channel tif image.
%
%   savetif1(C1,filename)
%
%Author: William Colgan
%Date: 4/4/17
%Contact: colgan.william@gmail.com

%for each plane
for i = 1:size(C1,3)
   imwrite(C1(:,:,i),filename,'tif', 'WriteMode', 'append','Compression','none');
end

end