%Select the control folder then experimental.

cpath = uigetdir('/Users/cionalab/Google Drive/William/Image Analysis');
epath = uigetdir('/Users/cionalab/Google Drive/William/Image Analysis');


types = {'whole','ventral','dorsal'};
[selection,ok] = listdlg('ListString',types);
for i = 1:size(selection,2)
    e = analyze(epath,types{selection(i)});
    c = analyze(cpath,types{selection(i)});
    
    overlap = {c.overlap,e.overlap};
    overlap1 = {c.overlap1,e.overlap1};
    overlap2 = {c.overlap2,e.overlap2};
    overlap3 = {c.overlap3,e.overlap3};
    vdratio = {c.vdratio,e.vdratio};
    enrichgreen1 = {c.enrichgreen1,e.enrichgreen1};
    enrichgreen2 = {c.enrichgreen2,e.enrichgreen2};
    enrichgreen3 = {c.enrichgreen3,e.enrichgreen3};

    makefigure4('Fractional overlap',{'Total','Membrane','Peripheral Cytoplasm','Deep Cytoplasm'},{[0,1],[0,1],[0,1],[0,1]},{'b','b','b','b'},overlap,overlap1,overlap2,overlap3);
    makefigure4('FGFR enrichment',{'V/D Ratio','Membrane','Peripheral Cytoplasm','Deep Cytoplasm'},{[0,20],[0,2],[0,2],[0,2]},{'g','g','g','g'},vdratio,enrichgreen1,enrichgreen2,enrichgreen3);

    coverlap = [mean(c.overlap1),mean(c.overlap2),mean(c.overlap3)];
    cenrichment = [mean(c.enrichgreen1)/2,mean(c.enrichgreen2)/2,mean(c.enrichgreen3)/2];
    cellicon2(coverlap,cenrichment,strcat(types{selection(i)},' control'),'fire','firegb')

    eoverlap = [mean(e.overlap1),mean(e.overlap2),mean(e.overlap3)];
    eenrichment = [mean(e.enrichgreen1)/2,mean(e.enrichgreen2)/2,mean(e.enrichgreen3)/2];
    cellicon2(eoverlap,eenrichment,strcat(types{selection(i)},' experimental'),'fire','firegb')
end
clear;


