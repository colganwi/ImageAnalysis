function cellMask = approximatecell(C1)
%This function returns an approximate cell mask. It is a sphere centered at
%the center of the image.
%
%   cellMask = approcimatecell(C1)
%
%Author: William Colgan
%Date: 4/8/17
%Contact: colgan.william@gmail.com

%calculate radius and make cell mask
[x,y,z] = size(C1);
radius = double(round(min(x,y)*.45));
cellMask = zeros(x,y,z);

%for each plane
for i = 3:z-3
    P = zeros(x,y); 
    P(round(x/2),round(y/2)) = 1; %set center to 1
    r = radius * sqrt(1 - ((z/2-i)/(z/2))^2); %calculate r for the plane
    SE = strel('disk',double(round(r)),8); %create a disk structural element
    P = imdilate(P, SE); %dilate to sphere
    cellMask(:,:,i) = P; %set cell mask plane
end

end

