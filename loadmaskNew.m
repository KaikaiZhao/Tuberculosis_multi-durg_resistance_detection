%addpath('/usr/local/matlab.etc/');
pic_num=230;
file_path = 'mask_data\';
img_path = 'F:\matconvnet-1.0-beta18\examples\lumengchi\mask9new\';
j =1;

% train_x9 = zeros(pic_num*9,224,224,1);

for i= 1:pic_num
    if i == 117
        continue
    end
    filename = strcat(file_path, num2str(i),'.nii');
    V = load_nii(filename);
    %     save_nii( V ,'001');
    img3d = V.img;
    [l,m,r] = size(img3d); %每幅图r尺寸不一致
    % for i=1:3
    %     figure,imshow(img3d(:,:,i));
    % end
    % n = 1;
    % imwrite(img3d,strcat(file_path,num2str(n),'.jpg')); %保存图片
%     num0 = floor(r*2/3); %循环步长
%     temp = floor(r/5);
%     num = floor(temp/4);
    temp = floor(r/3);
    num = floor(temp/10);
    
    num0 = floor(r*1/2);
    sta = num0 - 2*num; %初始的图片肺部区域特别小，不具有较大参考价值
    last = num0 + 6*num; %最后的图片不包含肺部区域，可以忽略
    
    if (i == 63 || i == 66 || i == 68 || i == 157 )
        num0 = floor(r*2/3);
        sta = num0 - 4*num; %初始的图片肺部区域特别小，不具有较大参考价值
        last = num0 + 4*num; %最后的图片不包含肺部区域，可以忽略
    end
   
    if (i == 113 || i == 114 || i == 115 || i == 116 )
%         num = floor(temp/6);
        num0 = floor(r*1/3);
        sta = num0 - 3*num; %初始的图片肺部区域特别小，不具有较大参考价值
        last = num0 + 5*num; %最后的图片不包含肺部区域，可以忽略
    end

    for k = sta  :  num  : last
        pic0 = double(img3d(:,:,k));
        pic1 = mapminmax(pic0,0,1);
        pic1 = im2bw(pic1);
%         imshow(pic1);
        pic = imresize(pic1,[224,224]);
        imshow(pic);
        imwrite(pic,strcat(img_path, num2str(j),'.jpg')); %保存图片
%         train_x8(j,:,:,1) = pic;
        j = j+1;
    end
end
