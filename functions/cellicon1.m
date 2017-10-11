function cellicon1(dist1,figuretitle,color)
figure('NumberTitle', 'off', 'Name',figuretitle);
set(gcf,'color','white')
polarhistogram('BinEdges',[0 2*pi],'BinCounts',[6],'FaceColor','white','FaceAlpha',1,'EdgeAlpha',1)
hold on;
ax = gca;
rticks([]);
thetaticks([])
thetaticklabels({'Rab Overlap','FGFR intensity'});
polarhistogram('BinEdges',[0 2*pi],'BinCounts',[6],'FaceColor',getcolor(ax,dist1(1),color),'FaceAlpha',1,'EdgeAlpha',0)
polarhistogram('BinEdges',[0 2*pi],'BinCounts',[5],'FaceColor',getcolor(ax,dist1(2),color),'FaceAlpha',1,'EdgeAlpha',0)
polarhistogram('BinEdges',[0 2*pi],'BinCounts',[3],'FaceColor',getcolor(ax,dist1(3),color),'FaceAlpha',1,'EdgeAlpha',0)
colorbar(gca,'Ticks',[],'Location','eastoutside');
