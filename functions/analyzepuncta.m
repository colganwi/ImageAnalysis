function analysis = analyze(path,type)
%This function analyzes a folder of images. It returns a struct of lists
%containing the value for each image.
%
%   analysis = analyze(path,type)
%
%Author: William Colgan
%Date: 9/15/17
%Contact: colgan.william@gmail.com

%get list of images to analyze
filenames = dir(path);
names = {filenames(:).name};
image = {};
for i = 1:size(names,2)
    name = names{i};
    [~,title,ext] = fileparts(name); 
    if(strcmp(ext,'.tif') &&  title(1) ~= 'm')
        image = {image{:},name};
    end
end

%make lists
n = size(image,2);
names = string(zeros(n,1));
areared = zeros(n,20);


%for each image
for i = 1:n
    disp(image{i});
    [C1,C2,C3,voxelSize] = loadtif3(image{i});
    names(i) = image{i};
    cellMask = loadtif1(strcat('mask_',image{i}));
    [region1,region2,region3] = makeregions(cellMask,1,3,voxelSize);
    %split DV
    l = sum(sum(cellMask));
    l = reshape(l,[size(l,3),1]);
    k = round(COG(l));
    D = zeros(size(cellMask));
    D(:,:,(1:k)) = 1;
    V = zeros(size(cellMask));
    V(:,:,(k+1:end)) = 1;
    cellMaskD = cellMask.*D;
    cellMaskV = cellMask.*V;
    %select region to analyze
    if strcmp(type,'ventral')
        region1 = region1.*V;
        region2 = region2.*V;
        region3 = region3.*V;
        cellMaskA = cellMaskV;
    elseif strcmp(type,'dorsal')
        region1 = region1.*D;
        region2 = region2.*D;
        region3 = region3.*D;
        cellMaskA = cellMaskD;
    elseif strcmp(type,'whole')
        cellMaskA = cellMask;
    else
        disp('Invalid Type')
    end
    %Threshold red
    C1 = imgaussfilt(C1,.1/voxelSize(1));
    thresh = getthresh(C1,cellMask,95);
    tC1 = double(C1>thresh);
    %Threshold green
    C2 = imgaussfilt(C2,.1/voxelSize(1));
    thresh = getthresh(C2,cellMask,95);
    tC2 = double(C2>thresh);
    %get areas
    I = tC1.*cellMaskA;
    D = bwdist(~I);
    D = -D;
    D(~I) = Inf;
    L = watershed(D);
    L(~I) = 0;
    stats = regionprops(L,'Area');
    areas = [stats(:).Area];
    areas = areas.*(voxelSize(1)*voxelSize(2)*voxelSize(3));
    Y = discretize(areas,0:1:20);
    a = zeros(1,20);
    for j = 1:20
        a(j) = sum(areas(Y==j));
    end
    areared(i,:) = a;
 
end
analysis = cell2table(num2cell(areared));