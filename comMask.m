file_path1 = 'img9new\';
file_path2 = 'mask9new\';
file_path3 = 'com_pic9cutnew\'; %存储数据集
path = strcat(file_path1,'*.jpg');

D = dir(path); %统计文件夹下图片总数, D是一个struct，统计相关信息
picNum = length(D);

m = 224;
n = 224;
% new = zeros(m,n); %将新图设置为全黑
% tranx9 = zeros(229*9,224,224,3);
tranx9 = zeros(229*9,224,224,1);
k = 1;
for i = 1:picNum
    picName = strcat(num2str(i),'.jpg');
    picOrign = imread(strcat(file_path1,picName)); %初始图像
    pic = imcomplement(picOrign); %将图像翻转
    %imshow(pic);
    maskOrign = imread(strcat(file_path2,picName));
    mask = im2bw(maskOrign); %对模板进行二值化
    %[m,n] = size(mask); %该数据集图片大小一致512*512
    new = zeros(m,n);
    for j = 1:m
        for k = 1:n
            if(mask(j,k) == 1) %为白色
                new(j,k) = pic(j,k);
            end
        end
    end
    %imshow(new);
    imwrite(new,strcat(file_path3,num2str(i),'.jpg'));
    tranx9(i,:,:,1) = new;
%     if mod(i,3) == 1
%         k = (i+2)/3;
%         tranx9(k,:,:,1) = new;
%     else
%         if mod(i,3) == 2
%             k = (i+1)/3;
%             tranx9(k,:,:,2) = new;
%         else
%             if mod(i,3) == 0
%                 k = i/3;
%                 tranx9(i,:,:,3) = new;
%             end
%         end
%     end
end
save tranx9 tranx9 