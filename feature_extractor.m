run ../../matlab/vl_setupnn
img_num = 229;
% net = load('models/imagenet-vgg-verydeep-16.mat') ;
vec35 = zeros(img_num*9,4096);
vec36 = zeros(img_num*9,4096);
vec37 = zeros(img_num*9,1000);
for i=1: img_num*9
    name = strcat('com_pic9cut/',num2str(i),'.jpg');
    im1 = double(imread(name));
    siz=224;
    im=zeros(siz,siz,3);
    im(:,:,1) = imresize(im1,[siz,siz]); % crop
    im(:,:,2) = imresize(im1,[siz,siz]); % crop
    im(:,:,3) = imresize(im1,[siz,siz]); % crop
    im_ = single(im) ; % note: 255 range
    im_ = imresize(im_, net.meta.normalization.imageSize(1:2)) ;
    im_ = bsxfun(@minus,im_,net.meta.normalization.averageImage) ;
    res = vl_simplenn(net, im_);
    
    vec35(i,:)=reshape(res(35).x,1,4096);
    vec36(i,:)=reshape(res(36).x,1,4096);
    vec37(i,:)=reshape(res(37).x,1,1000);
end

% print( 'next')

v35 = zeros(img_num,4096*9);
v36 = zeros(img_num,4096*9);
v37 = zeros(img_num,1000*9);
for j=1:img_num
    tmp0=[];
    tmp1=[];
    tmp2=[];
    for k=1:9
        tmp0=[tmp0 vec35((j-1)*9+1,:)];
        tmp1=[tmp1 vec36((j-1)*9+1,:)];
        tmp2=[tmp2 vec37((j-1)*9+1,:)];
    end
    v35(j,:) = tmp0;
    v36(j,:) = tmp1;
    v37(j,:) = tmp2;
end
    
save v35 v35 -v7.3
save v36 v36 -v7.3
save v37 v37 -v7.3






