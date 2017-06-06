%This program can be used to automate analysis of mutiple image files
filenames = dir('data');
names = {filenames(:).name};
num = 0;

image = string(zeros(32,1));
volume = zeros(32,1);
coloc = zeros(32,1);
averagered = zeros(32,1);
averagegreen = zeros(32,1);
volume1 = zeros(32,1);
coloc1 = zeros(32,1);
averagered1 = zeros(32,1);
averagegreen1 = zeros(32,1);
volume2 = zeros(32,1);
coloc2 = zeros(32,1);
averagered2 = zeros(32,1);
averagegreen2 = zeros(32,1);
volume3 = zeros(32,1);
coloc3 = zeros(32,1);
averagered3 = zeros(32,1);
averagegreen3 = zeros(32,1);

for i = 1:size(names,2)
    name = names{i};
    if(name(1) ~= 'm' && name(1) ~= '.')
        num = num + 1;
        image(num) = name;
        [C1,C2,C3,voxelSize] = loadtif3(name);
        cellMask = loadtif1(strcat('mask_',name));
%         C1 = removebackground(C1,cellMask,3);
%         C2 = removebackground(C2,cellMask,3);
        [region1,region2,region3] = makeregions(cellMask,1,2,voxelSize);
        %Analyze whole:
        v = sum(sum(sum(cellMask)));
        volume(num) = round(v);
        coloc(num)= pearson(C1,C2,cellMask);
        averagered(num) = sum(sum(sum(C1.*cellMask)))/v;
        averagegreen(num) = sum(sum(sum(C2.*cellMask)))/v;
        %Analyze region 1:
        v = sum(sum(sum(region1)));
        volume1(num) = round(v);
        coloc1(num)= pearson(C1,C2,region1);
        averagered1(num) = sum(sum(sum(C1.*region1)))/v;
        averagegreen1(num) = sum(sum(sum(C2.*region1)))/v;
        %Analyze region 2:
        v = sum(sum(sum(region2)));
        volume2(num) = round(v);
        coloc2(num)= pearson(C1,C2,region2);
        averagered2(num) = sum(sum(sum(C1.*region2)))/v;
        averagegreen2(num) = sum(sum(sum(C2.*region2)))/v;
        %Analyze region 3:
        v = sum(sum(sum(region3)));
        volume3(num) = round(v);
        coloc3(num)= pearson(C1,C2,region3);
        averagered3(num) = sum(sum(sum(C1.*region3)))/v;
        averagegreen3(num) = sum(sum(sum(C2.*region3)))/v;
    end
end

relativered1 = averagered1./averagered;
relativered2 = averagered2./averagered;
relativered3 = averagered3./averagered;
relativegreen1 = averagegreen1./averagegreen;
relativegreen2 = averagegreen2./averagegreen;
relativegreen3 = averagegreen3./averagegreen;

image(31) = 'average';
volume(31) = sum(volume(1:num))/num;
coloc(31) = sum(coloc(1:num))/num;
averagered(31) = sum(averagered(1:num))/num;
averagegreen(31) = sum(averagegreen(1:num))/num;
volume1(31) = sum(volume1(1:num))/num;
coloc1(31) = sum(coloc1(1:num))/num;
averagered1(31) = sum(averagered1(1:num))/num;
averagegreen1(31) = sum(averagegreen1(1:num))/num;
relativered1(31) = sum(relativered1(1:num))/num;
relativegreen1(31) = sum(relativegreen1(1:num))/num;
volume2(31) = sum(volume2(1:num))/num;
coloc2(31) = sum(coloc2(1:num))/num;
averagered2(31) = sum(averagered2(1:num))/num;
averagegreen2(31) = sum(averagegreen2(1:num))/num;
relativered2(31) = sum(relativered2(1:num))/num;
relativegreen2(31) = sum(relativegreen2(1:num))/num;
volume3(31) = sum(volume3(1:num))/num;
coloc3(31) = sum(coloc3(1:num))/num;
averagered3(31) = sum(averagered3(1:num))/num;
averagegreen3(31) = sum(averagegreen3(1:num))/num;
relativered3(31) = sum(relativered3(1:num))/num;
relativegreen3(31) = sum(relativegreen3(1:num))/num;

image(32) = 'standard error';
volume(32) = std(volume(1:num))/sqrt(num);
coloc(32) = std(coloc(1:num))/sqrt(num);
averagered(32) = std(averagered(1:num))/sqrt(num);
averagegreen(32) = std(averagegreen(1:num))/sqrt(num);
volume1(32) = std(volume1(1:num))/sqrt(num);
coloc1(32) = std(coloc1(1:num))/sqrt(num);
averagered1(32) = std(averagered1(1:num))/sqrt(num);
averagegreen1(32) = std(averagegreen1(1:num))/sqrt(num);
relativered1(32) = std(relativered1(1:num))/sqrt(num);
relativegreen1(32) = std(relativegreen1(1:num))/sqrt(num);
volume2(32) = std(volume2(1:num)/sqrt(num));
coloc2(32) = std(coloc2(1:num))/sqrt(num);
averagered2(32) = std(averagered2(1:num))/sqrt(num);
averagegreen2(32) = std(averagegreen2(1:num))/sqrt(num);
relativered2(32) = std(relativered2(1:num))/sqrt(num);
relativegreen2(32) = std(relativegreen2(1:num))/sqrt(num);
volume3(32) = std(volume3(1:num))/sqrt(num);
coloc3(32) = std(coloc3(1:num))/sqrt(num);
averagered3(32) = std(averagered3(1:num))/sqrt(num);
averagegreen3(32) = std(averagegreen3(1:num))/sqrt(num);
relativered3(32) = std(relativered3(1:num))/sqrt(num);
relativegreen3(32) = std(relativegreen3(1:num))/sqrt(num);

result = table(image,volume,coloc,averagered,averagegreen,volume1,volume2,volume3,coloc1,coloc2,coloc3,averagered1,averagered2,averagered3,averagegreen1,averagegreen2,averagegreen3,relativered1,relativered2,relativered3,relativegreen1,relativegreen2,relativegreen3);
writetable(result,'data/analysis.xls');
clear;

% figure;
% p = patch(isosurface(cellMask));
% p.FaceColor = 'red';
% p.EdgeColor = 'none';
% p.FaceAlpha = .5;
% camlight;
% lighting phong;
