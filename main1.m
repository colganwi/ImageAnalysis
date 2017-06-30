%This program can be used to automate analysis of mutiple image files
filenames = dir('data');
names = {filenames(:).name};
num = 0;

image = string(zeros(32,1));
volume = zeros(32,1);
averagered = zeros(32,1);
averagegreen = zeros(32,1);
numberred = zeros(32,1);
numbergreen = zeros(32,1);
fractionoverlap = zeros(32,1);


for i = 1:size(names,2)
    name = names{i};
    if(name(1) ~= 'm' && name(1) ~= '.' && name(1) ~= 'a')
        num = num + 1;
        image(num) = name;
        [C1,C2,C3,voxelSize] = loadtif3(name);
        cellMask = loadtif1(strcat('mask_',name));
        [region1,region2,region3] = makeregions(cellMask,.2,.5,voxelSize);
        %Analyze whole:
        v = sum(sum(sum(cellMask)));
        volume(num) = round(v);
        C1 = C1.*cellMask.*region3;
        C2 = C2.*cellMask.*region3;
        ared = sum(sum(sum(C1)))/v;
        averagered(num) = ared;
        agreen = sum(sum(sum(C2)))/v;
        averagegreen(num) = agreen;
        C1 = double(C1>ared*2.5);
        C2 = double(C2>agreen*3);
        C2 = bwareaopen(C2,1000);
        numberred(num) = sum(sum(sum(C1)));
        numbergreen(num) = sum(sum(sum(C2)));
        overlap = double(C1+C2>1.5);
        fractionoverlap(num) = sum(sum(sum(overlap)))/sum(sum(sum(C2)));
    end
end

image(31) = 'average';
volume(31) = sum(volume(1:num))/num;
averagered(31) = sum(averagered(1:num))/num;
averagegreen(31) = sum(averagegreen(1:num))/num;
numberred(31) = sum(numberred(1:num))/num;
numbergreen(31) = sum(numberred(1:num))/num;
fractionoverlap(31) = sum(fractionoverlap(1:num))/num;

image(32) = 'standard error';
volume(32) = std(volume(1:num))/sqrt(num);
averagered(32) = std(averagered(1:num))/sqrt(num);
averagegreen(32) = std(averagegreen(1:num))/sqrt(num);
numberred(32) = std(numberred(1:num))/sqrt(num);
numbergreen(32) = std(numberred(1:num))/sqrt(num);
fractionoverlap(32) = std(fractionoverlap(1:num))/sqrt(num);

result = table(image,volume,averagered,averagegreen,numberred,numbergreen,fractionoverlap);
writetable(result,'data/analysis.xls');
clear;

