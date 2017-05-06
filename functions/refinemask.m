function cellMask = refinemask(cellMask,amount)
%This function calculates the pearson value intensity of 4 regions,
%
%   colocalization = pearson(C1,C2,cellMask)
%
%Author: William Colgan
%Date: 2/14/17
%Contact: colgan.william@gmail.com

SE = strel('diamond',5);
cellMask = imdilate(cellMask, SE);
SE = strel('diamond',round(5-amount));
cellMask = imerode(cellMask, SE);

end