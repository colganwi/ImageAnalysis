function cellicon(FGFR,Rab4,Rab7,Rab11,figuretitle)
Rab4(isnan(Rab4)) = 0;
Rab7(isnan(Rab7)) = 0;
Rab11(isnan(Rab11)) = 0;
figure('NumberTitle', 'off', 'Name',figuretitle);
set(gcf,'color','white')
polarhistogram('BinEdges',[0 pi/2 pi 3*pi/2 2*pi],'BinCounts',[6 6 6 6],'FaceColor','white','FaceAlpha',1)
brighten(.3)
hold on;
rticks([]);
thetaticks([45 135 225 315])
thetaticklabels({'Rab4 Overlap','FGFR intensity','Rab11 Overlap','Rab7 Overlap'});
polarhistogram('BinEdges',[0 pi/2 pi 3*pi/2 2*pi],'BinCounts',[0 6 0 0],'FaceColor',getcolor(FGFR(1)/1.8,[0 1 0]),'FaceAlpha',FGFR(1)/1.8)
polarhistogram('BinEdges',[0 pi/2 pi 3*pi/2 2*pi],'BinCounts',[0 5 0 0],'FaceColor',getcolor(FGFR(2)/1.8,[0 1 0]),'FaceAlpha',FGFR(2)/1.8)
polarhistogram('BinEdges',[0 pi/2 pi 3*pi/2 2*pi],'BinCounts',[0 3 0 0],'FaceColor',getcolor(FGFR(3)/1.8,[0 1 0]),'FaceAlpha',FGFR(3)/1.8)

polarhistogram('BinEdges',[0 pi/2 pi 3*pi/2 2*pi],'BinCounts',[6 0 0 0],'FaceColor',getcolor(Rab4(1)/.6,[0 0 1]),'FaceAlpha',Rab4(1)/.6)
polarhistogram('BinEdges',[0 pi/2 pi 3*pi/2 2*pi],'BinCounts',[5 0 0 0],'FaceColor',getcolor(Rab4(2)/.6,[0 0 1]),'FaceAlpha',Rab4(2)/.6)
polarhistogram('BinEdges',[0 pi/2 pi 3*pi/2 2*pi],'BinCounts',[3 0 0 0],'FaceColor',getcolor(Rab4(3)/.6,[0 0 1]),'FaceAlpha',Rab4(3)/.6)

polarhistogram('BinEdges',[0 pi/2 pi 3*pi/2 2*pi],'BinCounts',[0 0 0 6],'FaceColor',getcolor(Rab7(1)/.6,[1 0 1]),'FaceAlpha',Rab7(1)/.6)
polarhistogram('BinEdges',[0 pi/2 pi 3*pi/2 2*pi],'BinCounts',[0 0 0 5],'FaceColor',getcolor(Rab7(2)/.6,[1 0 1]),'FaceAlpha',Rab7(2)/.6)
polarhistogram('BinEdges',[0 pi/2 pi 3*pi/2 2*pi],'BinCounts',[0 0 0 3],'FaceColor',getcolor(Rab7(3)/.6,[1 0 1]),'FaceAlpha',Rab7(3)/.6)

polarhistogram('BinEdges',[0 pi/2 pi 3*pi/2 2*pi],'BinCounts',[0 0 6 0],'FaceColor',getcolor(Rab11(1)/.6,[1 1 0]),'FaceAlpha',Rab11(1)/.6)
polarhistogram('BinEdges',[0 pi/2 pi 3*pi/2 2*pi],'BinCounts',[0 0 5 0],'FaceColor',getcolor(Rab11(2)/.6,[1 1 0]),'FaceAlpha',Rab11(2)/.6)
polarhistogram('BinEdges',[0 pi/2 pi 3*pi/2 2*pi],'BinCounts',[0 0 3 0],'FaceColor',getcolor(Rab11(3)/.6,[1 1 0]),'FaceAlpha',Rab11(3)/.6)

%colorbar('Ticks',[]);

