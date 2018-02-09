%addpath('/usr/local/matlab.etc/');
pic_num=229;
file_path = 'masks\';
img_path = 'F:\matconvnet-1.0-beta18\examples\lumengchi\mask\';
j =1;
    
for i=1:pic_num
    i
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
    num = round(r/10); %循环步长
    start = 2*num; %初始的图片肺部区域特别小，不具有较大参考价值
    last = r-num+5; %最后的图片不包含肺部区域，可以忽略
    for i = start:num:num*9
        pic = double(img3d(:,:,i));
        %imshow(pic);
        imwrite(pic,strcat(img_path, num2str(j),'.jpg')); %保存图片
        j = j+1;
    end
end