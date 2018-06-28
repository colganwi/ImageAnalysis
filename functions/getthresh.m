function thresh = getthresh(C1,cellMask,per)
%gets a percentile of the data
%
%   thresh = getthresh(C1,cellMask,per)
%
%Author: William Colgan
%Date: 6/28/17
%Contact: colgan.william@gmail.com

C1 = C1.*cellMask;
if max(max(max(C1))) ~= 0
    [x,y,z] = size(C1);
    v1 = sort(reshape(C1,[x*y*z,1]));
    k = find(v1);
    v1 = v1(k(1):end);
    thresh = prctile(v1,per);
else
    thresh = 1;
end
end