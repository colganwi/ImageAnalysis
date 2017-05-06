function result = analyzeregions(C1,C2,cellMask,region1,region2,region3)
%This function calculates the pearson value intensity of 4 regions,
%
%   colocalization = pearson(C1,C2,cellMask)
%
%Author: William Colgan
%Date: 2/14/17
%Contact: colgan.william@gmail.com

regions = {'whole';'region1';'region2';'region3'};
volume = [0;0;0;0];
colocalization = [0;0;0;0];
averageIntensity1 = [0;0;0;0];
averageIntensity2 = [0;0;0;0];
totalIntensity1 = [0;0;0;0];
totalIntensity2 = [0;0;0;0];

%Analyze whole:
v = sum(sum(sum(cellMask)));
volume(1) = round(v);
colocalization(1)= pearson(C1,C2,cellMask);
averageIntensity1(1) = sum(sum(sum(C1.*cellMask)))/v;
averageIntensity2(1) = sum(sum(sum(C2.*cellMask)))/v;
totalIntensity1(1) = sum(sum(sum(C1.*cellMask)));
totalIntensity2(1) = sum(sum(sum(C2.*cellMask)));

%Analyze region 1:
v = sum(sum(sum(region1)));
volume(2) = round(v);
colocalization(2)= pearson(C1,C2,region1);
averageIntensity1(2) = sum(sum(sum(C1.*region1)))/v;
averageIntensity2(2) = sum(sum(sum(C2.*region1)))/v;
totalIntensity1(2) = sum(sum(sum(C1.*region1)));
totalIntensity2(2) = sum(sum(sum(C2.*region1)));

%Analyze region 2:
v = sum(sum(sum(region2)));
volume(3) = round(v);
colocalization(3)= pearson(C1,C2,region2);
averageIntensity1(3) = sum(sum(sum(C1.*region2)))/v;
averageIntensity2(3) = sum(sum(sum(C2.*region2)))/v;
totalIntensity1(3) = sum(sum(sum(C1.*region2)));
totalIntensity2(3) = sum(sum(sum(C2.*region2)));

%Analyze region 3:
v = sum(sum(sum(region3)));
volume(4) = round(v);
colocalization(4)= pearson(C1,C2,region3);
averageIntensity1(4) = sum(sum(sum(C1.*region3)))/v;
averageIntensity2(4) = sum(sum(sum(C2.*region3)))/v;
totalIntensity1(4) = sum(sum(sum(C1.*region3)));
totalIntensity2(4) = sum(sum(sum(C2.*region3)));

result = table(regions,volume,colocalization,averageIntensity1,averageIntensity2,totalIntensity1,totalIntensity2);
end