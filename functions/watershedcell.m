function cellMask = watershedcell(C1,cellMask,sigma)
%This function watersheds an image in 3D to refine the cell mask. It
%assumes the cell is in the center of the image. A good sigma is [2,2,.5]
%
%   cellMask = thresholdcell(C1)
%   cellMask = thresholdcell(C1,1.5) 
%
%Author: William Colgan
%Date: 4/4/17
%Contact: colgan.william@gmail.com

SE = strel('sphere', 5);
inside = imerode(cellMask,SE); %set the inside to 5 pixels less than mask
%SE = strel('sphere', 10);
%outside = 1 - imdilate(cellMask,SE); %set the outside to 10 pixels larger than mask
outside = zeros(size(cellMask));

%set the edges to 1
[x,y,z] = size(outside);
outside(1,:,:) = 1;
outside(:,1,:) = 1;
outside(:,:,1) = 1;
outside(x,:,:) = 1;
outside(:,y,:) = 1;
outside(:,:,z) = 1;

if(sigma > 0)
C1 = imgaussfilt3(C1,[sigma,sigma,1]); %apply gaussian filter
end
R = inside + outside; %set R to inside and outside
R = imimposemin(C1,R); %make R local minimum for watershed
L = watershed(R); %watershed
i = L(round(x/2),round(y/2),round(z/2)); %find value at center
cellMask = double(L==i); %return L equal to value

end

