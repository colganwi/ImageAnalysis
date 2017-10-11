function makefigure3(figuretitle,figurelabels,ylimit,colors,data1,data2,data3)
%This function analyzes a folder of images
%
%Author: William Colgan
%Date: 9/15/17
%Contact: colgan.william@gmail.com
main = figure('pos',[0 600 1200 600],'NumberTitle', 'off', 'Name',figuretitle);
means1 = [mean(data1{1}),mean(data1{2}),mean(data1{3}),mean(data1{4}),mean(data1{5})];
ns1 = [size(data1{1},1),size(data1{2},1),size(data1{3},1),size(data1{4},1),size(data1{5},1)];
errors1 = [std(data1{1})/sqrt(ns1(1)),std(data1{2})/sqrt(ns1(2)),std(data1{3})/sqrt(ns1(3)),std(data1{4})/sqrt(ns1(4)),std(data1{5})/sqrt(ns1(5))];
y = cat(1,data1{1},data1{2},data1{3},data1{4},data1{5});
g = cat(1,repmat(["Pre-mitotic"],ns1(1),1),repmat(["Prophase"],ns1(2),1),repmat(["Metaphase"],ns1(3),1),repmat(["Anaphase"],ns1(4),1),repmat(["Post-mitotic"],ns1(5),1));
[~,~,stats] = anova1(y,g,[],'off');
close;
c = multcompare(stats,'CType','hsd');
close;
uitable('Data',c(:,[1 2 6]),'Position',[150,75,260,195],'ColumnName',{'condition 1','condition 2','p'});
subplot(2,3,1);
hold on
title(figurelabels{1});
bar(means1,colors{1});
ylim(ylimit);
xticks(1:5);
xticklabels({'Pre-mitotic';'Prophase';'Metaphse';'Anaphase';'Post-mitotic'});
xtickangle(45);
errorbar(1:5,means1,errors1,'.','Color','k');

means2 = [mean(data2{1}),mean(data2{2}),mean(data2{3}),mean(data2{4}),mean(data2{5})];
ns2 = [size(data2{1},1),size(data2{2},1),size(data2{3},1),size(data2{4},1),size(data2{5},1)];
errors2 = [std(data2{1})/sqrt(ns2(1)),std(data2{2})/sqrt(ns2(2)),std(data2{3})/sqrt(ns2(3)),std(data2{4})/sqrt(ns2(4)),std(data2{5})/sqrt(ns2(5))];
y = cat(1,data2{1},data2{2},data2{3},data2{4},data2{5});
g = cat(1,repmat(["Pre-mitotic"],ns2(1),1),repmat(["Prophase"],ns2(2),1),repmat(["Metaphase"],ns2(3),1),repmat(["Anaphase"],ns2(4),1),repmat(["Post-mitotic"],ns2(5),1));
[~,~,stats] = anova1(y,g,[],'off');
close;
c = multcompare(stats,'CType','hsd');
close;
uitable('Data',c(:,[1 2 6]),'Position',[490,75,260,195],'ColumnName',{'condition 1','condition 2','p'});
subplot(2,3,2);
hold on
title(figurelabels{2})
bar(means2,colors{2});
ylim(ylimit);
xticks(1:5);
xticklabels({'Pre-mitotic';'Prophase';'Metaphse';'Anaphase';'Post-mitotic'});
xtickangle(45);
errorbar(1:5,means2,errors2,'.','Color','k');

means3 = [mean(data3{1}),mean(data3{2}),mean(data3{3}),mean(data3{4}),mean(data3{5})];
ns3 = [size(data3{1},1),size(data3{2},1),size(data3{3},1),size(data3{4},1),size(data3{5},1)];
errors3 = [std(data3{1})/sqrt(ns3(1)),std(data3{2})/sqrt(ns3(2)),std(data3{3})/sqrt(ns3(3)),std(data3{4})/sqrt(ns3(4)),std(data3{5})/sqrt(ns3(5))];
y = cat(1,data3{1},data3{2},data3{3},data3{4},data3{5});
g = cat(1,repmat(["Pre-mitotic"],ns3(1),1),repmat(["Prophase"],ns3(2),1),repmat(["Metaphase"],ns3(3),1),repmat(["Anaphase"],ns3(4),1),repmat(["Post-mitotic"],ns3(5),1));
[~,~,stats] = anova1(y,g,[],'off');
close;
c = multcompare(stats,'CType','hsd');
close;
uitable('Data',c(:,[1 2 6]),'Position',[825,75,260,195],'ColumnName',{'condition 1','condition 2','p'});
subplot(2,3,1);
subplot(2,3,3)
hold on
title(figurelabels{3})
bar(means3,colors{3});
ylim(ylimit);
xticks(1:5);
xticklabels({'Pre-mitotic';'Prophase';'Metaphse';'Anaphase';'Post-mitotic'});
xtickangle(45);
errorbar(1:5,means3,errors3,'.','Color','k');

end