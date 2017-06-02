function cellMask = separatecells(cellMask,radius,voxelSize)
%This function seperates attached cells
scale = voxelSize(3)/voxelSize(1);
[x,y,z] = size(cellMask);
C = imresize3(cellMask,[round(x/scale),round(y/scale),z],'linear');
D = bwdist(~C);
D = -D;
D(~C) = Inf;
R = approximatecell(C,radius);
D(R==1) = -Inf;
F = double(D);
L = watershed(D);
L(~C) = 0;
[x1,y1,z1] = size(L);
i = L(round(x1/2),round(y1/2),round(z1/2));
C = double(L==i);
cellMask = imresize3(C,[x,y,z],'nearest');
SE = strel('sphere',3);
cellMask  = imdilate(cellMask, SE);
SE = strel('sphere',5);
cellMask = imerode(cellMask,SE);
cellMask = double(cellMask);

figure;
p = patch(isosurface(cellMask));
p.FaceColor = 'red';
p.EdgeColor = 'none';
p.FaceAlpha = .5;
camlight;
lighting phong;
end

