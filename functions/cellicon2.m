function cellicon2(dist1,dist2,figuretitle,color1,color2)
figure('NumberTitle', 'off', 'Name',figuretitle);
set(gcf,'color','white')
polarhistogram('BinEdges',[0 pi 2*pi],'BinCounts',[6 6],'FaceColor','white','FaceAlpha',1)
hold on;
ax = gca;
rticks([]);
thetaticks([90 270])
thetaticklabels({'Rab Overlap','FGFR Enrichment'});
polarhistogram('BinEdges',[0 pi 2*pi],'BinCounts',[6 0],'FaceColor',getcolor(ax,dist1(1),color1),'FaceAlpha',1)
polarhistogram('BinEdges',[0 pi 2*pi],'BinCounts',[5 0],'FaceColor',getcolor(ax,dist1(2),color1),'FaceAlpha',1)
polarhistogram('BinEdges',[0 pi 2*pi],'BinCounts',[3 0],'FaceColor',getcolor(ax,dist1(3),color1),'FaceAlpha',1)
polarhistogram('BinEdges',[0 pi 2*pi],'BinCounts',[0 6],'FaceColor',getcolor(ax,dist2(1),color2),'FaceAlpha',1)
polarhistogram('BinEdges',[0 pi 2*pi],'BinCounts',[0 5],'FaceColor',getcolor(ax,dist2(2),color2),'FaceAlpha',1)
polarhistogram('BinEdges',[0 pi 2*pi],'BinCounts',[0 3],'FaceColor',getcolor(ax,dist2(3),color2),'FaceAlpha',1)
%display colorbars
colorbar(gca,'TickLabels',{'0','0.18','0.36','0.54','0.72','0.9','1.08','1.26','1.44','1.62','1.8'},'Location','westoutside');
ax2 = axes;
hold on;
ax2.Visible = 'off';
ax2.XTick = [];
ax2.YTick = [];
getcolor(ax2,.5,color1);
colorbar(ax2,'TickLabels',{'0','0.075','0.15','0.225','0.3','0.375','.45','.525','.6','.675','.75'},'Position',[.89 .11 .032 .815]);
