%Select the Rab4,Rab7,Rab11
apath = uigetdir('/Users/cionalab/Google Drive/William/Image Analysis');
bpath = uigetdir('/Users/cionalab/Google Drive/William/Image Analysis');
cpath = uigetdir('/Users/cionalab/Google Drive/William/Image Analysis');

types = {'whole','ventral','dorsal'};
[selection,ok] = listdlg('ListString',types);
for i = 1:size(selection,2)
    a = analyze(apath,types{selection(i)});
    b = analyze(bpath,types{selection(i)});
    c = analyze(cpath,types{selection(i)});
    
    enrichgreen1 = cat(1,a.enrichgreen1,b.enrichgreen1,c.enrichgreen1);
    enrichgreen2 = cat(1,a.enrichgreen2,b.enrichgreen2,c.enrichgreen2);
    enrichgreen3 = cat(1,a.enrichgreen3,b.enrichgreen3,c.enrichgreen3);
    
    enrichgreen = [mean(enrichgreen1)/2,mean(enrichgreen2)/2,mean(enrichgreen3)/2];
    aoverlap = [mean(a.overlap1),mean(a.overlap2),mean(a.overlap3)];
    boverlap = [mean(b.overlap1),mean(b.overlap2),mean(b.overlap3)];
    coverlap = [mean(c.overlap1),mean(c.overlap2),mean(c.overlap3)];
    
    cellicon4(enrichgreen,aoverlap,boverlap,coverlap,strcat(types{selection(i)},' all rabs'),'fire','firegb')
end
clear;