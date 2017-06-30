%This program can be used to automate analysis of mutiple image files
path = uigetdir('/Users/cionalab/Google Drive/William/Image Analysis');
filenames = dir(path);
names = {filenames(:).name};
image = string(zeros(32,1));
coloc = zeros(32,1);
overlapgreen = zeros(32,1);
averagered = zeros(32,1);
averagegreen = zeros(32,1);
coloc1 = zeros(32,1);
coloc2 = zeros(32,1);
coloc3 = zeros(32,1);
overlapgreen1 = zeros(32,1);
overlapgreen2 = zeros(32,1);
overlapgreen3 = zeros(32,1);
relativered1 = zeros(32,1);
relativered2 = zeros(32,1);
relativered3 = zeros(32,1);
relativegreen1 = zeros(32,1);
relativegreen2 = zeros(32,1);
relativegreen3 = zeros(32,1);
threshred1 = zeros(32,1);
threshred2 = zeros(32,1);
threshred3 = zeros(32,1);
threshgreen1 = zeros(32,1);
threshgreen2 = zeros(32,1);
threshgreen3 = zeros(32,1);
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
        %Get Pearson
        coloc(num) = pearson(C1,C2,cellMask);
        coloc1(num) = pearson(C1,C2,region1);
        coloc2(num) = pearson(C1,C2,region2);
        coloc3(num) = pearson(C1,C2,region3);
        %Get Volumes
        vCellMask = sum(sum(sum(cellMask)));
        vRegion1 = sum(sum(sum(region1)));
        vRegion2 = sum(sum(sum(region2)));
        vRegion3 = sum(sum(sum(region3)));
        %Threshold
        C4 = imgaussfilt(C1,1);
        thresh = getthresh(C4,cellMask,90);
        C4 = double(C4>thresh);
        C5 = imgaussfilt(C2,1);
        thresh = getthresh(C5,cellMask,95);
        C5 = double(C5>thresh);
        %Get Overlapgreen
        C6 = C4.*C5;
        overlapgreen(num) = sum(sum(sum(C6.*cellMask)))/sum(sum(sum(C5.*cellMask)));
        overlapgreen1(num) = sum(sum(sum(C6.*region1)))/sum(sum(sum(C5.*region1)));
        overlapgreen2(num) = sum(sum(sum(C6.*region2)))/sum(sum(sum(C5.*region2)));
        overlapgreen3(num) = sum(sum(sum(C6.*region3)))/sum(sum(sum(C5.*region3)));
        %Red
        red = sum(sum(sum(C1.*cellMask)))/vCellMask;
        averagered(num) = red;
        relativered1(num) = sum(sum(sum(C1.*region1)))/vRegion1/red;
        relativered2(num) = sum(sum(sum(C1.*region2)))/vRegion2/red;
        relativered3(num) = sum(sum(sum(C1.*region3)))/vRegion3/red;
        %Green
        green = sum(sum(sum(C2.*cellMask)))/vCellMask;
        averagegreen(num) = green;
        relativegreen1(num) = sum(sum(sum(C2.*region1)))/vRegion1/green;
        relativegreen2(num) = sum(sum(sum(C2.*region2)))/vRegion2/green;
        relativegreen3(num) = sum(sum(sum(C2.*region3)))/vRegion3/green;
        %Thresholded Red
        red = sum(sum(sum(C4.*cellMask)))/vCellMask;
        threshred1(num) = sum(sum(sum(C4.*region1)))/vRegion1/red;
        threshred2(num) = sum(sum(sum(C4.*region2)))/vRegion2/red;
        threshred3(num) = sum(sum(sum(C4.*region3)))/vRegion3/red;
        %Thresholded Green
        green = sum(sum(sum(C5.*cellMask)))/vCellMask;
        threshgreen1(num) = sum(sum(sum(C5.*region1)))/vRegion1/green;
        threshgreen2(num) = sum(sum(sum(C5.*region2)))/vRegion2/green;
        threshgreen3(num) = sum(sum(sum(C5.*region3)))/vRegion3/green;
    end
end
image(31) = 'average';
coloc(31) = sum(coloc(1:num))/num;
overlapgreen(31) = sum(overlapgreen(1:num))/num;
averagered(31) = sum(averagered(1:num))/num;
averagegreen(31) = sum(averagegreen(1:num))/num;
coloc1(31) = sum(coloc1(1:num))/num;
coloc2(31) = sum(coloc2(1:num))/num;
coloc3(31) = sum(coloc3(1:num))/num;
overlapgreen1(31) = sum(overlapgreen1(1:num))/num;
overlapgreen2(31) = sum(overlapgreen2(1:num))/num;
overlapgreen3(31) = sum(overlapgreen3(1:num))/num;
relativered1(31) = sum(relativered1(1:num))/num;
relativered2(31) = sum(relativered2(1:num))/num;
relativered3(31) = sum(relativered3(1:num))/num;
relativegreen1(31) = sum(relativegreen1(1:num))/num;
relativegreen2(31) = sum(relativegreen2(1:num))/num;
relativegreen3(31) = sum(relativegreen3(1:num))/num;
threshred1(31) = sum(threshred1(1:num))/num;
threshred2(31) = sum(threshred2(1:num))/num;
threshred3(31) = sum(threshred3(1:num))/num;
threshgreen1(31) = sum(threshgreen1(1:num))/num;
threshgreen2(31) = sum(threshgreen2(1:num))/num;
threshgreen3(31) = sum(threshgreen3(1:num))/num;
image(32) = 'standard error';
coloc(32) = std(coloc(1:num))/sqrt(num);
overlapgreen(32) = std(overlapgreen(1:num))/sqrt(num);
averagered(32) = std(averagered(1:num))/sqrt(num);
averagegreen(32) = std(averagegreen(1:num))/sqrt(num);
coloc1(32) = std(coloc1(1:num))/sqrt(num);
coloc2(32) = std(coloc2(1:num))/sqrt(num);
coloc3(32) = std(coloc3(1:num))/sqrt(num);
overlapgreen1(32) = std(overlapgreen1(1:num))/sqrt(num);
overlapgreen2(32) = std(overlapgreen2(1:num))/sqrt(num);
overlapgreen3(32) = std(overlapgreen3(1:num))/sqrt(num);
relativered1(32) = std(relativered1(1:num))/sqrt(num);
relativered2(32) = std(relativered2(1:num))/sqrt(num);
relativered3(32) = std(relativered3(1:num))/sqrt(num);
relativegreen1(32) = std(relativegreen1(1:num))/sqrt(num);
relativegreen2(32) = std(relativegreen2(1:num))/sqrt(num);
relativegreen3(32) = std(relativegreen3(1:num))/sqrt(num);
threshred1(32) = std(threshred1(1:num))/sqrt(num);
threshred2(32) = std(threshred2(1:num))/sqrt(num);
threshred3(32) = std(threshred3(1:num))/sqrt(num);
threshgreen1(32) = std(threshgreen1(1:num))/sqrt(num);
threshgreen2(32) = std(threshgreen2(1:num))/sqrt(num);
threshgreen3(32) = std(threshgreen3(1:num))/sqrt(num);
result = table(image,coloc,overlapgreen,averagered,averagegreen,coloc1,coloc2,coloc3,overlapgreen1,overlapgreen2,overlapgreen3,relativered1,relativered2,relativered3,relativegreen1,relativegreen2,relativegreen3,threshred1,threshred2,threshred3,threshgreen1,threshgreen2,threshgreen3);
writetable(result,strcat(path,'/analysis.xls'));
clear;

