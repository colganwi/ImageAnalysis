%Edit type of analysis, can be whole, ventral, dorsal
types = {'whole','ventral','dorsal'};
[selection,ok] = listdlg('ListString',types,'SelectionMode','single');
type = types{selection};

% %WT Rab4 analysis
wtrab4pre = analyze('/Users/cionalab/Google Drive/William/Image Analysis/WT Rab4/Pre-mitotic',type);
wtrab4pro = analyze('/Users/cionalab/Google Drive/William/Image Analysis/WT Rab4/Prophase',type);
wtrab4meta = analyze('/Users/cionalab/Google Drive/William/Image Analysis/WT Rab4/Metaphase',type);
wtrab4ana = analyze('/Users/cionalab/Google Drive/William/Image Analysis/WT Rab4/Anaphase',type);
wtrab4post = analyze('/Users/cionalab/Google Drive/William/Image Analysis/WT Rab4/Post-mitotic',type);
% 
% %WT Rab7 analysis
wtrab7pre = analyze('/Users/cionalab/Google Drive/William/Image Analysis/WT Rab7/Pre-mitotic',type);
wtrab7pro = analyze('/Users/cionalab/Google Drive/William/Image Analysis/WT Rab7/Prophase',type);
wtrab7meta = analyze('/Users/cionalab/Google Drive/William/Image Analysis/WT Rab7/Metaphase',type);
wtrab7ana = analyze('/Users/cionalab/Google Drive/William/Image Analysis/WT Rab7/Anaphase',type);
wtrab7post = analyze('/Users/cionalab/Google Drive/William/Image Analysis/WT Rab7/Post-mitotic',type);

%WT Rab11 analysis
wtrab11pre = analyze('/Users/cionalab/Google Drive/William/Image Analysis/WT Rab11/Pre-mitotic',type);
wtrab11pro = analyze('/Users/cionalab/Google Drive/William/Image Analysis/WT Rab11/Prophase',type);
wtrab11meta = analyze('/Users/cionalab/Google Drive/William/Image Analysis/WT Rab11/Metaphase',type);
wtrab11ana = analyze('/Users/cionalab/Google Drive/William/Image Analysis/WT Rab11/Anaphase',type);
wtrab11post = analyze('/Users/cionalab/Google Drive/William/Image Analysis/WT Rab11/Post-mitotic',type);

%combine FGF distribution
enrichgreen1pre = cat(1,wtrab4pre.enrichgreen1,wtrab7pre.enrichgreen1,wtrab11pre.enrichgreen1);
enrichgreen1pro = cat(1,wtrab4pro.enrichgreen1,wtrab7pro.enrichgreen1,wtrab11pro.enrichgreen1);
enrichgreen1meta = cat(1,wtrab4meta.enrichgreen1,wtrab7meta.enrichgreen1,wtrab11meta.enrichgreen1);
enrichgreen1ana = cat(1,wtrab4ana.enrichgreen1,wtrab7ana.enrichgreen1,wtrab11ana.enrichgreen1);
enrichgreen1post = cat(1,wtrab4post.enrichgreen1,wtrab7post.enrichgreen1,wtrab11post.enrichgreen1);

enrichgreen2pre = cat(1,wtrab4pre.enrichgreen2,wtrab7pre.enrichgreen2,wtrab11pre.enrichgreen2);
enrichgreen2pro = cat(1,wtrab4pro.enrichgreen2,wtrab7pro.enrichgreen2,wtrab11pro.enrichgreen2);
enrichgreen2meta = cat(1,wtrab4meta.enrichgreen2,wtrab7meta.enrichgreen2,wtrab11meta.enrichgreen2);
enrichgreen2ana = cat(1,wtrab4ana.enrichgreen2,wtrab7ana.enrichgreen2,wtrab11ana.enrichgreen2);
enrichgreen2post = cat(1,wtrab4post.enrichgreen2,wtrab7post.enrichgreen2,wtrab11post.enrichgreen2);

enrichgreen3pre = cat(1,wtrab4pre.enrichgreen3,wtrab7pre.enrichgreen3,wtrab11pre.enrichgreen3);
enrichgreen3pro = cat(1,wtrab4pro.enrichgreen3,wtrab7pro.enrichgreen3,wtrab11pro.enrichgreen3);
enrichgreen3meta = cat(1,wtrab4meta.enrichgreen3,wtrab7meta.enrichgreen3,wtrab11meta.enrichgreen3);
enrichgreen3ana = cat(1,wtrab4ana.enrichgreen3,wtrab7ana.enrichgreen3,wtrab11ana.enrichgreen3);
enrichgreen3post = cat(1,wtrab4post.enrichgreen3,wtrab7post.enrichgreen3,wtrab11post.enrichgreen3);

% %Make graphs
wtrab4overlap1 = {wtrab4pre.overlap1,wtrab4pro.overlap1,wtrab4meta.overlap1,wtrab4ana.overlap1,wtrab4post.overlap1};
wtrab4overlap2 = {wtrab4pre.overlap2,wtrab4pro.overlap2,wtrab4meta.overlap2,wtrab4ana.overlap2,wtrab4post.overlap2};
wtrab4overlap3 = {wtrab4pre.overlap3,wtrab4pro.overlap3,wtrab4meta.overlap3,wtrab4ana.overlap3,wtrab4post.overlap3};
makefigure3('WT Rab4 fractional overlap',{'Membrane','Peripheral Cytoplasm','Deep Cytoplasm'},[0,1],{'b','b','b'},wtrab4overlap1,wtrab4overlap2,wtrab4overlap3);

wtrab7overlap1 = {wtrab7pre.overlap1,wtrab7pro.overlap1,wtrab7meta.overlap1,wtrab7ana.overlap1,wtrab7post.overlap1};
wtrab7overlap2 = {wtrab7pre.overlap2,wtrab7pro.overlap2,wtrab7meta.overlap2,wtrab7ana.overlap2,wtrab7post.overlap2};
wtrab7overlap3 = {wtrab7pre.overlap3,wtrab7pro.overlap3,wtrab7meta.overlap3,wtrab7ana.overlap3,wtrab7post.overlap3};
makefigure3('WT Rab7 fractional overlap',{'Membrane','Peripheral Cytoplasm','Deep Cytoplasm'},[0,1],{'m','m','m'},wtrab7overlap1,wtrab7overlap2,wtrab7overlap3);

wtrab11overlap1 = {wtrab11pre.overlap1,wtrab11pro.overlap1,wtrab11meta.overlap1,wtrab11ana.overlap1,wtrab11post.overlap1};
wtrab11overlap2 = {wtrab11pre.overlap2,wtrab11pro.overlap2,wtrab11meta.overlap2,wtrab11ana.overlap2,wtrab11post.overlap2};
wtrab11overlap3 = {wtrab11pre.overlap3,wtrab11pro.overlap3,wtrab11meta.overlap3,wtrab11ana.overlap3,wtrab11post.overlap3};
makefigure3('WT Rab11 fractional overlap',{'Membrane','Peripheral Cytoplasm','Deep Cytoplasm'},[0,1],{'y','y','y'},wtrab11overlap1,wtrab11overlap2,wtrab11overlap3);

wtrab11overlap1 = {wtrab4pre.overlap,wtrab4pro.overlap,wtrab4meta.overlap,wtrab4ana.overlap,wtrab4post.overlap};
wtrab11overlap2 = {wtrab7pre.overlap,wtrab7pro.overlap,wtrab7meta.overlap,wtrab7ana.overlap,wtrab7post.overlap};
wtrab11overlap3 = {wtrab11pre.overlap,wtrab11pro.overlap,wtrab11meta.overlap,wtrab11ana.overlap,wtrab11post.overlap};
makefigure3('WT fractional overlap',{'Rab4','Rab7','Rab11'},[0,1],{'b','m','y'},wtrab11overlap1,wtrab11overlap2,wtrab11overlap3);

enrichgreen1 = {enrichgreen1pre,enrichgreen1pro,enrichgreen1meta,enrichgreen1ana,enrichgreen1post};
enrichgreen2 = {enrichgreen2pre,enrichgreen2pro,enrichgreen2meta,enrichgreen2ana,enrichgreen2post};
enrichgreen3 = {enrichgreen3pre,enrichgreen3pro,enrichgreen3meta,enrichgreen3ana,enrichgreen3post};
makefigure3('WT FGFR distrubtion',{'Membrane','Peripheral Cytoplasm','Deep Cytoplasm'},[0,2],{'g','g','g'},enrichgreen1,enrichgreen2,enrichgreen3);

%Make icons
aFGFRpre = [mean(enrichgreen1pre)/1.8,mean(enrichgreen2pre)/1.8,mean(enrichgreen3pre)/1.8];
aFGFRpro = [mean(enrichgreen1pro)/1.8,mean(enrichgreen2pro)/1.8,mean(enrichgreen3pro)/1.8];
aFGFRmeta = [mean(enrichgreen1meta)/1.8,mean(enrichgreen2meta)/1.8,mean(enrichgreen3meta)/1.8];
aFGFRana = [mean(enrichgreen1ana)/1.8,mean(enrichgreen2ana)/1.8,mean(enrichgreen3ana)/1.8];
aFGFRpost = [mean(enrichgreen1post)/1.8,mean(enrichgreen2post)/1.8,mean(enrichgreen3post)/1.8];

aOverlapRab4pre = [mean(wtrab4pre.overlap1)/.75,mean(wtrab4pre.overlap2)/.75,mean(wtrab4pre.overlap3)/.75];
aOverlapRab4pro = [mean(wtrab4pro.overlap1)/.75,mean(wtrab4pro.overlap2)/.75,mean(wtrab4pro.overlap3)/.75];
aOverlapRab4meta = [mean(wtrab4meta.overlap1)/.75,mean(wtrab4meta.overlap2)/.75,mean(wtrab4meta.overlap3)/.75];
aOverlapRab4ana = [mean(wtrab4ana.overlap1)/.75,mean(wtrab4ana.overlap2)/.75,mean(wtrab4ana.overlap3)/.75];
aOverlapRab4post = [mean(wtrab4post.overlap1)/.75,mean(wtrab4post.overlap2)/.75,mean(wtrab4post.overlap3)/.75];

aOverlapRab7pre = [mean(wtrab7pre.overlap1)/.75,mean(wtrab7pre.overlap2)/.75,mean(wtrab7pre.overlap3)/.75];
aOverlapRab7pro = [mean(wtrab7pro.overlap1)/.75,mean(wtrab7pro.overlap2)/.75,mean(wtrab7pro.overlap3)/.75];
aOverlapRab7meta = [mean(wtrab7meta.overlap1)/.75,mean(wtrab7meta.overlap2)/.75,mean(wtrab7meta.overlap3)/.75];
aOverlapRab7ana = [mean(wtrab7ana.overlap1)/.75,mean(wtrab7ana.overlap2)/.75,mean(wtrab7ana.overlap3)/.75];
aOverlapRab7post = [mean(wtrab7post.overlap1)/.75,mean(wtrab7post.overlap2)/.75,mean(wtrab7post.overlap3)/.75];
% 
aOverlapRab11pre = [mean(wtrab11pre.overlap1)/.75,mean(wtrab11pre.overlap2)/.75,mean(wtrab11pre.overlap3)/.75];
aOverlapRab11pro = [mean(wtrab11pro.overlap1)/.75,mean(wtrab11pro.overlap2)/.75,mean(wtrab11pro.overlap3)/.75];
aOverlapRab11meta = [mean(wtrab11meta.overlap1)/.75,mean(wtrab11meta.overlap2)/.75,mean(wtrab11meta.overlap3)/.75];
aOverlapRab11ana = [mean(wtrab11ana.overlap1)/.75,mean(wtrab11ana.overlap2)/.75,mean(wtrab11ana.overlap3)/.75];
aOverlapRab11post = [mean(wtrab11post.overlap1)/.75,mean(wtrab11post.overlap2)/.75,mean(wtrab11post.overlap3)/.75];

cellicon4(aFGFRpre,aOverlapRab4pre,aOverlapRab7pre,aOverlapRab11pre,"WT Pre-mitotic",'fire','green');
cellicon4(aFGFRpro,aOverlapRab4pro,aOverlapRab7pro,aOverlapRab11pro,"WT Prophase",'fire','green');
cellicon4(aFGFRmeta,aOverlapRab4meta,aOverlapRab7meta,aOverlapRab11meta,"WT Metaphase",'fire','green');
cellicon4(aFGFRana,aOverlapRab4ana,aOverlapRab7ana,aOverlapRab11ana,"WT Anaphase",'fire','green');
cellicon4(aFGFRpost,aOverlapRab4post,aOverlapRab7post,aOverlapRab11post,"WT Post-mitotic",'fire','green');

cellicon1(aFGFRpre,"Pre-mitotic",'green',1);
cellicon1(aFGFRpro,"Prophase",'green',1);
cellicon1(aFGFRmeta,"Metaphase",'green',1);
cellicon1(aFGFRana,"Anaphase",'green',1);
cellicon1(aFGFRpost,"Post-mitotic",'green',1);

cellicon1(aOverlapRab4pre,"Pre-mitotic Rab4",'magenta',0);
cellicon1(aOverlapRab4pro,"Prophase Rab4",'magenta',0);
cellicon1(aOverlapRab4meta,"Metaphase Rab4",'magenta',0);
cellicon1(aOverlapRab4ana,"Anaphase Rab4",'magenta',0);
cellicon1(aOverlapRab4post,"Post-mitotic Rab4",'magenta',0);

cellicon1(aOverlapRab7pre,"Pre-mitotic Rab7",'orange',0);
cellicon1(aOverlapRab7pro,"Prophase Rab7",'orange',0);
cellicon1(aOverlapRab7meta,"Metaphase Rab7",'orange',0);
cellicon1(aOverlapRab7ana,"Anaphase Rab7",'orange',0);
cellicon1(aOverlapRab7post,"Post-mitotic Rab7",'orange',0);

cellicon1(aOverlapRab11pre,"Pre-mitotic Rab11",'blue',0);
cellicon1(aOverlapRab11pro,"Prophase Rab11",'blue',0);
cellicon1(aOverlapRab11meta,"Metaphase Rab11",'blue',0);
cellicon1(aOverlapRab11ana,"Anaphase Rab11",'blue',0);
cellicon1(aOverlapRab11post,"Post-mitotic Rab11",'blue',0);

clear;
