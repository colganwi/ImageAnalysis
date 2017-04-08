function result = ridges3D(I, Sigma)
% 
%Author: William Colgan
%Date: 14/2/17
%Contact: colgan.william@gmail.comSigma = 3;

[x, y, z] = size(I);
% derivatives second order
[Dxx, Dyy, Dzz, Dxy, Dxz, Dyz] = hessian3D(I,Sigma);

% intiell smoothing to avoid rapid oscillations
   
E = zeros(x,y,z,3);
for i = 1 : x
    for j = 1 : y               
        for k = 1 : z
            t = ([Dxx(i,j,k) Dxy(i,j,k) Dxz(i,j,k) ;
                  Dxy(i,j,k) Dyy(i,j,k) Dyz(i,j,k) ;
                  Dxz(i,j,k) Dyz(i,j,k) Dzz(i,j,k)]);
            
            E(i,j,k,:) = eig(t);
        end;
    end;
end;

% ridge in 3D (also for 2D ok)
result = -E(:,:,:,1) - E(:,:,:,2).^2 - E(:,:,:,3).^2;
result(result<0) = 0;
result = result ./ max(max(max(result)));
