%This program can be used to automate analysis of mutiple image files
path = uigetdir('/Users/cionalab/Google Drive/William/Image Analysis');
filenames = dir(path);
names = {filenames(:).name};
image = string(zeros(42,1));
volume = zeros(42,1);
averagered = zeros(42,1);
averagegreen = zeros(42,1);
t90overlap = zeros(42,1);
t95overlap = zeros(42,1);
t90t95overlap = zeros(42,1);
t90enrichred1 = zeros(42,1);
t90enrichred2 = zeros(42,1);
t90enrichred3 = zeros(42,1);
t95enrichred1 = zeros(42,1);
t95enrichred2 = zeros(42,1);
t95enrichred3 = zeros(42,1);
t90enrichgreen1 = zeros(42,1);
t90enrichgreen2 = zeros(42,1);
t90enrichgreen3 = zeros(42,1);
t95enrichgreen1 = zeros(42,1);
t95enrichgreen2 = zeros(42,1);
t95enrichgreen3 = zeros(42,1);
t90overlap1 = zeros(42,1);
t90overlap2 = zeros(42,1);
t90overlap3 = zeros(42,1);
t95overlap1 = zeros(42,1);
t95overlap2 = zeros(42,1);
t95overlap3 = zeros(42,1);
t90t95overlap1 = zeros(42,1);
t90t95overlap2 = zeros(42,1);
t90t95overlap3 = zeros(42,1);
num = 0;
for i = 1:size(names,2)
    name = names{i};
    [pathstr,title,ext] = fileparts(name); 
    if(strcmp(ext,'.tif') &&  title(1) ~= 'm')
        num = num + 1;
        image(num) = name;
        [C1,C2,C3,voxelSize] = loadtif3(name);
        cellMask = loadtif1(strcat('mask_',name));
        [region1,region2,region3] = makeregions(cellMask,1,2,voxelSize);
        %Get Volumes
        vCellMask = sum(sum(sum(cellMask)));
        volume(num) = vCellMask;
        vRegion1 = sum(sum(sum(region1)));
        vRegion2 = sum(sum(sum(region2)));
        vRegion3 = sum(sum(sum(region3)));
        %Get average intensities
        averagered(num) = sum(sum(sum(C1.*cellMask)))/vCellMask;
        averagegreen(num) = sum(sum(sum(C2.*cellMask)))/vCellMask;
        %Threshold red 90
        C1 = imgaussfilt(C1,1);
        thresh = getthresh(C1,cellMask,90);
        maximum = max(max(max(C1)));
        t90C1 = double(C1>thresh);
        %Threshold red 95
        thresh = getthresh(C1,cellMask,95);
        t95C1 = double(C1>thresh);
        %Threshold green 90
        C2 = imgaussfilt(C2,1);
        thresh = getthresh(C2,cellMask,90);
        maximum = max(max(max(C2)));
        t90C2 = double(C2>thresh);
        %Threshold green 95
        thresh = getthresh(C2,cellMask,95);
        t95C2 = double(C2>thresh);
        %enrichment red 90
        red = sum(sum(sum(t90C1.*cellMask)))/vCellMask;
        t90enrichred1(num) = sum(sum(sum(t90C1.*region1)))/vRegion1/red;
        t90enrichred2(num) = sum(sum(sum(t90C1.*region2)))/vRegion2/red;
        t90enrichred3(num) = sum(sum(sum(t90C1.*region3)))/vRegion3/red;
        %enrichment red 95
        red = sum(sum(sum(t95C1.*cellMask)))/vCellMask;
        t95enrichred1(num) = sum(sum(sum(t95C1.*region1)))/vRegion1/red;
        t95enrichred2(num) = sum(sum(sum(t95C1.*region2)))/vRegion2/red;
        t95enrichred3(num) = sum(sum(sum(t95C1.*region3)))/vRegion3/red;
        %enrichment green 90
        green = sum(sum(sum(t90C2.*cellMask)))/vCellMask;
        t90enrichgreen1(num) = sum(sum(sum(t90C2.*region1)))/vRegion1/green;
        t90enrichgreen2(num) = sum(sum(sum(t90C2.*region2)))/vRegion2/green;
        t90enrichgreen3(num) = sum(sum(sum(t90C2.*region3)))/vRegion3/green;
        %enrichment green 95
        green = sum(sum(sum(t95C2.*cellMask)))/vCellMask;
        t95enrichgreen1(num) = sum(sum(sum(t95C2.*region1)))/vRegion1/green;
        t95enrichgreen2(num) = sum(sum(sum(t95C2.*region2)))/vRegion2/green;
        t95enrichgreen3(num) = sum(sum(sum(t95C2.*region3)))/vRegion3/green;
        %Get t90overlap
        O = t90C1.*t90C2;
        t90overlap(num) = sum(sum(sum(O.*cellMask)))/sum(sum(sum(t90C2.*cellMask)));
        t90overlap1(num) = sum(sum(sum(O.*region1)))/sum(sum(sum(t90C2.*region1)));
        t90overlap2(num) = sum(sum(sum(O.*region2)))/sum(sum(sum(t90C2.*region2)));
        t90overlap3(num) = sum(sum(sum(O.*region3)))/sum(sum(sum(t90C2.*region3)));
        %Get t95overlap
        O = t95C1.*t95C2;
        t95overlap(num) = sum(sum(sum(O.*cellMask)))/sum(sum(sum(t95C2.*cellMask)));
        t95overlap1(num) = sum(sum(sum(O.*region1)))/sum(sum(sum(t95C2.*region1)));
        t95overlap2(num) = sum(sum(sum(O.*region2)))/sum(sum(sum(t95C2.*region2)));
        t95overlap3(num) = sum(sum(sum(O.*region3)))/sum(sum(sum(t95C2.*region3)));
        %Get t90t95overlap
        O = t90C1.*t95C2;
        t90t95overlap(num) = sum(sum(sum(O.*cellMask)))/sum(sum(sum(t95C2.*cellMask)));
        t90t95overlap1(num) = sum(sum(sum(O.*region1)))/sum(sum(sum(t95C2.*region1)));
        t90t95overlap2(num) = sum(sum(sum(O.*region2)))/sum(sum(sum(t95C2.*region2)));
        t90t95overlap3(num) = sum(sum(sum(O.*region3)))/sum(sum(sum(t95C2.*region3)));
    end
end
image(41) = 'average';
volume(41) = sum(volume(1:num))/num;
averagered(41) = sum(averagered(1:num))/num;
averagegreen(41) = sum(averagegreen(1:num))/num;
t90overlap(41) = sum(t90overlap(1:num))/num;
t95overlap(41) = sum(t95overlap(1:num))/num;
t90t95overlap(41) = sum(t90t95overlap(1:num))/num;
t90enrichred1(41) = sum(t90enrichred1(1:num))/num;
t90enrichred2(41) = sum(t90enrichred2(1:num))/num;
t90enrichred3(41) = sum(t90enrichred3(1:num))/num;
t95enrichred1(41) = sum(t95enrichred1(1:num))/num;
t95enrichred2(41) = sum(t95enrichred2(1:num))/num;
t95enrichred3(41) = sum(t95enrichred3(1:num))/num;
t90enrichgreen1(41) = sum(t90enrichgreen1(1:num))/num;
t90enrichgreen2(41) = sum(t90enrichgreen2(1:num))/num;
t90enrichgreen3(41) = sum(t90enrichgreen3(1:num))/num;
t95enrichgreen1(41) = sum(t95enrichgreen1(1:num))/num;
t95enrichgreen2(41) = sum(t95enrichgreen2(1:num))/num;
t95enrichgreen3(41) = sum(t95enrichgreen3(1:num))/num;
t90overlap1(41) = sum(t90overlap1(1:num))/num;
t90overlap2(41) = sum(t90overlap2(1:num))/num;
t90overlap3(41) = sum(t90overlap3(1:num))/num;
t95overlap1(41) = sum(t95overlap1(1:num))/num;
t95overlap2(41) = sum(t95overlap2(1:num))/num;
t95overlap3(41) = sum(t95overlap3(1:num))/num;
t90t95overlap1(41) = sum(t90t95overlap1(1:num))/num;
t90t95overlap2(41) = sum(t90t95overlap2(1:num))/num;
t90t95overlap3(41) = sum(t90t95overlap3(1:num))/num;

image(42) = 'standard error';
volume(42) = std(volume(1:num))/sqrt(num);
averagered(42) = std(averagered(1:num))/sqrt(num);
averagegreen(42) = std(averagegreen(1:num))/sqrt(num);
t90overlap(42) = std(t90overlap(1:num))/sqrt(num);
t95overlap(42) = std(t95overlap(1:num))/sqrt(num);
t90t95overlap(42) = std(t90t95overlap(1:num))/sqrt(num);
t90enrichred1(42) = std(t90enrichred1(1:num))/sqrt(num);
t90enrichred2(42) = std(t90enrichred2(1:num))/sqrt(num);
t90enrichred3(42) = std(t90enrichred3(1:num))/sqrt(num);
t95enrichred1(42) = std(t95enrichred1(1:num))/sqrt(num);
t95enrichred2(42) = std(t95enrichred2(1:num))/sqrt(num);
t95enrichred3(42) = std(t95enrichred3(1:num))/sqrt(num);
t90enrichgreen1(42) = std(t90enrichgreen1(1:num))/sqrt(num);
t90enrichgreen2(42) = std(t90enrichgreen2(1:num))/sqrt(num);
t90enrichgreen3(42) = std(t90enrichgreen3(1:num))/sqrt(num);
t95enrichgreen1(42) = std(t95enrichgreen1(1:num))/sqrt(num);
t95enrichgreen2(42) = std(t95enrichgreen2(1:num))/sqrt(num);
t95enrichgreen3(42) = std(t95enrichgreen3(1:num))/sqrt(num);
t90overlap1(42) = std(t90overlap1(1:num))/sqrt(num);
t90overlap2(42) = std(t90overlap2(1:num))/sqrt(num);
t90overlap3(42) = std(t90overlap3(1:num))/sqrt(num);
t95overlap1(42) = std(t95overlap1(1:num))/sqrt(num);
t95overlap2(42) = std(t95overlap2(1:num))/sqrt(num);
t95overlap3(42) = std(t95overlap3(1:num))/sqrt(num);
t90t95overlap1(42) = std(t90t95overlap1(1:num))/sqrt(num);
t90t95overlap2(42) = std(t90t95overlap2(1:num))/sqrt(num);
t90t95overlap3(42) = std(t90t95overlap3(1:num))/sqrt(num);

result = table(image,volume,averagered,averagegreen,t90overlap,t95overlap,t90t95overlap,t90enrichred1,t90enrichred2,t90enrichred3,t95enrichred1,t95enrichred2,t95enrichred3,t90enrichgreen1,t90enrichgreen2,t90enrichgreen3,t95enrichgreen1,t95enrichgreen2,t95enrichgreen3,t90overlap1,t90overlap2,t90overlap3,t95overlap1,t95overlap2,t95overlap3,t90t95overlap1,t90t95overlap2,t90t95overlap3);
writetable(result,strcat(path,'/results.xls'));
clear;
