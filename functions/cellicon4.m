function cellicon4(fgf,a,b,c,figuretitle,color1,color2)
figure('NumberTitle', 'off', 'Name',figuretitle);
set(gcf,'color','white')
polarhistogram('BinEdges',[pi/4 3*pi/4 5*pi/4 7*pi/4 9*pi/4],'BinCounts',[6 6 6 6],'FaceColor','white','FaceAlpha',1)
hold on;
ax = gca;
rticks([]);
thetaticks([90 270])
thetaticklabels({'Rab4,7,11 Overlap','FGFR enrichment'});
polarhistogram('BinEdges',[pi/4 3*pi/4 5*pi/4 7*pi/4 9*pi/4],'BinCounts',[6 0 0 0],'FaceColor',getcolor(ax,b(1),color1),'FaceAlpha',1)
polarhistogram('BinEdges',[pi/4 3*pi/4 5*pi/4 7*pi/4 9*pi/4],'BinCounts',[5 0 0 0],'FaceColor',getcolor(ax,b(2),color1),'FaceAlpha',1)
polarhistogram('BinEdges',[pi/4 3*pi/4 5*pi/4 7*pi/4 9*pi/4],'BinCounts',[3 0 0 0],'FaceColor',getcolor(ax,b(3),color1),'FaceAlpha',1)

polarhistogram('BinEdges',[pi/4 3*pi/4 5*pi/4 7*pi/4 9*pi/4],'BinCounts',[0 6 0 0],'FaceColor',getcolor(ax,a(1),color1),'FaceAlpha',1)
polarhistogram('BinEdges',[pi/4 3*pi/4 5*pi/4 7*pi/4 9*pi/4],'BinCounts',[0 5 0 0],'FaceColor',getcolor(ax,a(2),color1),'FaceAlpha',1)
polarhistogram('BinEdges',[pi/4 3*pi/4 5*pi/4 7*pi/4 9*pi/4],'BinCounts',[0 3 0 0],'FaceColor',getcolor(ax,a(3),color1),'FaceAlpha',1)

polarhistogram('BinEdges',[pi/4 3*pi/4 5*pi/4 7*pi/4 9*pi/4],'BinCounts',[0 0 6 0],'FaceColor',getcolor(ax,fgf(1),color2),'FaceAlpha',1)
polarhistogram('BinEdges',[pi/4 3*pi/4 5*pi/4 7*pi/4 9*pi/4],'BinCounts',[0 0 5 0],'FaceColor',getcolor(ax,fgf(2),color2),'FaceAlpha',1)
polarhistogram('BinEdges',[pi/4 3*pi/4 5*pi/4 7*pi/4 9*pi/4],'BinCounts',[0 0 3 0],'FaceColor',getcolor(ax,fgf(3),color2),'FaceAlpha',1)

polarhistogram('BinEdges',[pi/4 3*pi/4 5*pi/4 7*pi/4 9*pi/4],'BinCounts',[0 0 0 6],'FaceColor',getcolor(ax,c(1),color1),'FaceAlpha',1)
polarhistogram('BinEdges',[pi/4 3*pi/4 5*pi/4 7*pi/4 9*pi/4],'BinCounts',[0 0 0 5],'FaceColor',getcolor(ax,c(2),color1),'FaceAlpha',1)
polarhistogram('BinEdges',[pi/4 3*pi/4 5*pi/4 7*pi/4 9*pi/4],'BinCounts',[0 0 0 3],'FaceColor',getcolor(ax,c(3),color1),'FaceAlpha',1)
%display colorbars
colorbar(gca,'TickLabels',{'0','0.075','0.15','0.225','0.3','0.375','.45','.525','.6','.675','.75'},'Location','westoutside');
ax2 = axes;
hold on;
ax2.Visible = 'off';
ax2.XTick = [];
ax2.YTick = [];
getcolor(ax2,.5,color2);
colorbar(ax2,'TickLabels',{'0','0.18','0.36','0.54','0.72','0.9','1.08','1.26','1.44','1.62','1.8'},'Position',[.89 .11 .032 .815]);
