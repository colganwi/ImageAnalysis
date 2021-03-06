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
averagered = zeros(n,1);
averagegreen = zeros(n,1);
enrichgreen1 = zeros(n,1);
enrichgreen2 = zeros(n,1);
enrichgreen3 = zeros(n,1);
vdratiogreen = zeros(n,1);
enrichred1 = zeros(n,1);
enrichred2 = zeros(n,1);
enrichred3 = zeros(n,1);
vdratiored = zeros(n,1);
overlap = zeros(n,1);
overlap1 = zeros(n,1);
overlap2 = zeros(n,1);
overlap3 = zeros(n,1);

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
    %Get Volumes
    vCellMask = sum(sum(sum(cellMaskA)));
    vRegion1 = sum(sum(sum(region1)));
    vRegion2 = sum(sum(sum(region2)));
    vRegion3 = sum(sum(sum(region3)));
    %Get average intensities
    averagered(i) = sum(sum(sum(C1.*cellMaskA)))/vCellMask;
    averagegreen(i) = sum(sum(sum(C2.*cellMaskA)))/vCellMask;
    %Threshold red
    C1 = imgaussfilt(C1,.1/voxelSize(1));
    thresh = getthresh(C1,cellMask,95);
    tC1 = double(C1>thresh);
    %Threshold green
    C2 = imgaussfilt(C2,.1/voxelSize(1));
    thresh = getthresh(C2,cellMask,95);
    tC2 = double(C2>thresh);
    %enrichment green
    g = sum(sum(sum(tC2.*cellMaskA)))/vCellMask;
    enrichgreen1(i) = sum(sum(sum(tC2.*region1)))/vRegion1/g;
    enrichgreen2(i) = sum(sum(sum(tC2.*region2)))/vRegion2/g;
    enrichgreen3(i) = sum(sum(sum(tC2.*region3)))/vRegion3/g;
    vdratiogreen(i) = sum(sum(sum(tC2.*cellMaskV)))/sum(sum(sum(tC2.*cellMaskD)));
    %enrichment red
    r = sum(sum(sum(tC1.*cellMaskA)))/vCellMask;
    enrichred1(i) = sum(sum(sum(tC1.*region1)))/vRegion1/r;
    enrichred2(i) = sum(sum(sum(tC1.*region2)))/vRegion2/r;
    enrichred3(i) = sum(sum(sum(tC1.*region3)))/vRegion3/r;
    vdratiored(i) = sum(sum(sum(tC1.*cellMaskV)))/sum(sum(sum(tC1.*cellMaskD)));
    %Get fractional overlap
    O = tC1.*tC2;
    overlap(i) = sum(sum(sum(O.*cellMaskA)))/sum(sum(sum(tC2.*cellMaskA)));
    overlap1(i) = sum(sum(sum(O.*region1)))/sum(sum(sum(tC2.*region1)));
    overlap2(i) = sum(sum(sum(O.*region2)))/sum(sum(sum(tC2.*region2)));
    overlap3(i) = sum(sum(sum(O.*region3)))/sum(sum(sum(tC2.*region3)));
    
end
analysis = struct('image',names,'averagered',averagered,'averagegreen', ...
    averagegreen,'vdratiored',vdratiored,'enrichred1',enrichred1, ...
    'enrichred2',enrichred2,'enrichred3',enrichred3,'vdratiogreen', ...
        vdratiogreen,'enrichgreen1',enrichgreen1, ...
    'enrichgreen2',enrichgreen2,'enrichgreen3',enrichgreen3,'overlap', ...
    overlap,'overlap1',overlap1,'overlap2',overlap2,'overlap3',overlap3);
