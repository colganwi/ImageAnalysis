function cellicon1(dist1,figuretitle,color)
figure('NumberTitle', 'off', 'Name',figuretitle);
set(gcf,'color','white')
polarhistogram('BinEdges',[0 2*pi],'BinCounts',[6],'FaceColor','white','FaceAlpha',1,'EdgeAlpha',1)
hold on;
ax = gca;
rticks([]);
thetaticks([])
thetaticklabels({'Rab Overlap','FGFR intensity'});
polarhistogram('BinEdges',[0 2*pi],'BinCounts',[6],'FaceColor',getcolor(ax,dist1(1),color),'FaceAlpha',1,'EdgeAlpha',1)
polarhistogram('BinEdges',[0 2*pi],'BinCounts',[5],'FaceColor',getcolor(ax,dist1(2),color),'FaceAlpha',1,'EdgeAlpha',1)
polarhistogram('BinEdges',[0 2*pi],'BinCounts',[4],'FaceColor',getcolor(ax,dist1(3),color),'FaceAlpha',1,'EdgeAlpha',1)
if(strcmp(color,'kryptonite'))
    colorbar(gca,'TickLabels',{'0','0.18','0.36','0.54','0.72','0.9','1.08','1.26','1.44','1.62','1.8'},'Location','eastoutside');
else
    colorbar(gca,'TickLabels',{'0','0.075','0.15','0.225','0.3','0.375','.45','.525','.6','.675','.75'},'Location','eastoutside');
end
