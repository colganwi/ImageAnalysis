
function result = ridges2D(I, Sigma)
% 
%Author: William Colgan
%Date: 14/2/17
%Contact: colgan.william@gmail.comSigma = 3;

n = size(I,1);
m = size(I,2);

% Make kernel coordinates
[X,Y] = ndgrid(-round(3*Sigma):round(3*Sigma));

% Build the gaussian 2nd derivatives filters
DGaussxx = 1/(2*pi*Sigma^4) * (X.^2/Sigma^2 - 1).* exp(-(X.^2 + Y.^2)/(2*Sigma^2));
DGaussxy = 1/(2*pi*Sigma^6) * (X .* Y).* exp(-(X.^2 + Y.^2)/(2*Sigma^2));
DGaussyy = DGaussxx';
Dxx = imfilter(I,DGaussxx,'conv');
Dxy = imfilter(I,DGaussxy,'conv');
Dyy = imfilter(I,DGaussyy,'conv');

% Calculate eigenvalues and vectors
E = zeros(n,m,2);
for i = 1 : n
    for j = 1 : m
       t = ([Dxx(i,j) Dxy(i,j);
            Dxy(i,j) Dyy(i,j)]);
            E(i,j,:) = eig(t);
    end;
end;
result = -E(:,:,1) - E(:,:,2).^2;
result = result ./ max(max(result));
end

