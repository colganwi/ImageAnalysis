function show3d(cellMask)
%This function seperates attached cells
figure;

p = patch(isosurface(cellMask));
p.FaceColor = 'red';
p.EdgeColor = 'none';
p.FaceAlpha = .5;
camlight;
lighting phong;