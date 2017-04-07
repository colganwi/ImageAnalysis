function outputVolume = surface2volume(x,y,z,gridSize)

% gridSize is a scalar. If your surface data points is close enough each other than % you can use lower gridSize values such as 0.2, otherwise try big values (2, 3)
x=x(:); y=y(:); z=z(:);
x=(x-min(x))/gridSize+1; xu=ceil(x); xa=floor(x);
y=(y-min(y))/gridSize+1; yu=ceil(y); ya=floor(y);
z=(z-min(z))/gridSize+1; zu=ceil(z); za=floor(z);

outputVolume=zeros(max(xu)+3,max(yu)+3,max(zu)+3,'uint8');
deger=uint8(1);
for i=1:length(x)
    outputVolume(xu(i)+1,yu(i)+1,zu(i)+1)=deger;
    outputVolume(xa(i)+1,ya(i)+1,za(i)+1)=deger;
end
threshold=.1; % whic voxels on the smoothed surface will be counted
volumeShape=padarray(outputVolume,[6 6 6]);
% volumeShape=imdilate(10*volumeShape,strel('ball',2,2));
volumeShape=smooth3(volumeShape,'gaussian',3,1);
volumeShape(volumeShape > threshold) = true;
volumeShape(volumeShape <= threshold) = false;
outputVolume=imfill(logical(volumeShape),6,'holes'); 
end

