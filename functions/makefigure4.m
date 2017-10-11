function makefigure4(figuretitle,figurelabels,ylimit,colors,data1,data2,data3,data4)
%This function analyzes a folder of images
%
%Author: William Colgan
%Date: 9/15/17
%Contact: colgan.william@gmail.com
main = figure('pos',[0 600 800 600],'NumberTitle', 'off', 'Name',figuretitle);
means1 = [mean(data1{1}),mean(data1{2})];
ns1 = [size(data1{1},1),size(data1{2},1)];
errors1 = [std(data1{1})/sqrt(ns1(1)),std(data1{2})/sqrt(ns1(2))];
y = cat(1,data1{1},data1{2});
g = cat(1,repmat(["Treatment"],ns1(1),1),repmat(["Control"],ns1(2),1));
[~,~,stats] = anova1(y,g,[],'off');
close;
c = multcompare(stats,'CType','hsd');
close;
uitable('Data',c(:,[1 2 6]),'Position',[110,290,260,40],'ColumnName',{'condition 1','condition 2','p'});
subplot(2,2,1);
hold on
title(figurelabels{1});
bar(means1,colors{1});
ylim(ylimit{1});
xticks(1:2);
xticklabels({"Control";"Treatment"});
errorbar(1:2,means1,errors1,'.','Color','k');

means2 = [mean(data2{1}),mean(data2{2})];
ns2 = [size(data2{1},1),size(data2{2},1)];
errors2 = [std(data2{1})/sqrt(ns2(1)),std(data2{2})/sqrt(ns2(2))];
y = cat(1,data2{1},data2{2});
g = cat(1,repmat(["Treatment"],ns2(1),1),repmat(["Control"],ns2(2),1));
[~,~,stats] = anova1(y,g,[],'off');
close;
c = multcompare(stats,'CType','hsd');
close;
uitable('Data',c(:,[1 2 6]),'Position',[460,290,260,40],'ColumnName',{'condition 1','condition 2','p'});
subplot(2,2,2);
hold on
title(figurelabels{2});
bar(means2,colors{2});
ylim(ylimit{2});
xticks(1:2);
xticklabels({"Control";"Treatment"});
errorbar(1:2,means2,errors2,'.','Color','k');

means3 = [mean(data3{1}),mean(data3{2})];
ns3 = [size(data3{1},1),size(data3{2},1)];
errors3 = [std(data3{1})/sqrt(ns3(1)),std(data3{2})/sqrt(ns3(2))];
y = cat(1,data3{1},data3{2});
g = cat(1,repmat(["Treatment"],ns3(1),1),repmat(["Control"],ns3(2),1));
[~,~,stats] = anova1(y,g,[],'off');
close;
c = multcompare(stats,'CType','hsd');
close;
uitable('Data',c(:,[1 2 6]),'Position',[110,5,260,40],'ColumnName',{'condition 1','condition 2','p'});
subplot(2,2,3);
hold on
title(figurelabels{3});
bar(means3,colors{3});
ylim(ylimit{3});
xticks(1:2);
xticklabels({"Control";"Treatment"});
errorbar(1:2,means3,errors3,'.','Color','k');

means4 = [mean(data4{1}),mean(data4{2})];
ns4 = [size(data4{1},1),size(data4{2},1)];
errors4 = [std(data4{1})/sqrt(ns4(1)),std(data4{2})/sqrt(ns4(2))];
y = cat(1,data4{1},data4{2});
g = cat(1,repmat(["Treatment"],ns4(1),1),repmat(["Control"],ns4(2),1));
[~,~,stats] = anova1(y,g,[],'off');
close;
c = multcompare(stats,'CType','hsd');
close;
uitable('Data',c(:,[1 2 6]),'Position',[460,5,260,40],'ColumnName',{'condition 1','condition 2','p'});
subplot(2,2,4);
hold on
title(figurelabels{4});
bar(means4,colors{4});
ylim(ylimit{4});
xticks(1:2);
xticklabels({"Control";"Treatment"});
errorbar(1:2,means4,errors4,'.','Color','k');

end