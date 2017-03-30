%testing
data = loadtif('test4.tif');
C1 = data{1,1};
[x,y,z] = size(C1);
radius = min(x,y);
radius = double(round(radius*.4));
mask = zeros(x,y,z);
for i = 3:z-3
    plane = zeros(x,y);
    plane(round(x/2),round(y/2)) = 1; 
    r = radius * sqrt(1 - ((z/2-i)/(z/2))^2);
    SE = strel('disk',double(round(r)),8);
    plane = imdilate(plane, SE);
    mask(:,:,i) = plane;
end 
mask(1,:,:) = 1;
mask(:,1,:) = 1;
mask(:,:,1) = 1;
mask(x,:,:) = 1;
mask(:,y,:) = 1;
mask(:,:,z) = 1;
C1 = imgaussfilt3(C1,[1.5,1.5,1]);
%R = ridges3D(C1,2);
%R = CoherenceFilter(C1,struct('T',3,'rho',10,'Scheme','S'));
R = imimposemin(C1,mask);
L = watershed(R);
figure;
p = patch(isosurface(double(L==1)));
p.FaceColor = 'red';
p.EdgeColor = 'none';
camlight;
lighting phong;
for i = 1:z
    c1 = R(:,:,i);
    l = L(:,:,i);
    Lrgb = label2rgb(l, 'jet', 'w', 'shuffle');
    figure
    imshow(c1)
    hold on
    himage = imshow(Lrgb);
    himage.AlphaData = 0.1;
end

% SE = strel('disk',radius,8);
% mask = zeros([x,y]);
% mask(int16(x/2),int16(y/2)) = 1;
% mask = imdilate(mask, SE);
% mask(:,1) = 1;
% mask(1,:) = 1;
% mask(x,:) = 1;
% mask(:,y) = 1;
% C1 = imgaussfilt(C1,[3 3]);
% R = imimposemin(C1,mask);
% L = watershed(R);
% Lrgb = label2rgb(L, 'jet', 'w', 'shuffle');
% figure
% imshow(C1)
% hold on
% himage = imshow(Lrgb);
% himage.AlphaData = 0.1;


% n = 11;
% C1 = data{1,1};
% C2 = data{1,2};
% R = ridges3D(C1,2.5);
% R = R ./ max(max(max(R)));
% R = imimposemin(R,C2);
% R(R<0) = 0;
% R = imgaussfilt3(R,4);
% L = watershed(R);
% figure, imshow(C2(:,:,n));
% figure, imshow(R(:,:,n));
% figure, imshow(L(:,:,n)*100);
%R = R ./ max(max(R));
%R = R + C2;
%R = 1 - R;
%R(R<.1) = 0;
%L = watershed(R);
%figure, imshow(C2);
%figure, imshow(L*50);
%markers = im2bw(I2,graythresh(I2)*.8);
%imshow(cell(:,:,



%R = ridges3D(I,2);
% n = 11;
% figure, imshow(I(:,:,n));
% figure, imshow(R(:,:,n).*50)
% W = graydiffweight(R,90,90,11, 'GrayDifferenceCutoff', .3);
% figure, imshow(W(:,:,n)./1000); 
% thresh = 0.0005;
% BW = imsegfmm(W, 90, 90, 11, thresh);
% figure, imshow(BW(:,:,n));
% figure;
% p = patch(isosurface(double(BW)));
% p.FaceColor = 'red';
% p.EdgeColor = 'none';
% %daspect([1 1 27/64]);
% camlight;
% lighting phong;
% center = size(R)./2;
% [V,tri,ui,u] = ParticleSampleSphere('N',100);
% maxR = max(max(max(R)));
% rate = 5;
% for i = 1:4
%     for j = 1:size(V,1)
%         x = int16(V(j,1))+center(1);
%         y = int16(V(j,2))+center(2);
%         z = int16(V(j,3))+center(3);
%         V(j) = V(j).*(rate*(1-R(x,y,z)/maxR));
%     end
%     x = v(:,1);
%     y = v(:,2);
%     z = v(:,3);
%     figure, trisurf(tri,x,y,z,'EdgeColor','none','FaceColor','b')
% end
%[v,tri,ui,u] = ParticleSampleSphere('N',100);
%x = v(:,1);
%y = v(:,2);
%z = v(:,3);
%tri = [[1,2,3],[1,2,4],[1,3,4],[2,3,4]];
%trisurf(tri,x,y,z,'EdgeColor','none','FaceColor','b')

