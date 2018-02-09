file_path1 = 'img9new\';
file_path2 = 'mask9new\';
file_path3 = 'com_pic9cutnew\'; %�洢���ݼ�
path = strcat(file_path1,'*.jpg');

D = dir(path); %ͳ���ļ�����ͼƬ����, D��һ��struct��ͳ�������Ϣ
picNum = length(D);

m = 224;
n = 224;
% new = zeros(m,n); %����ͼ����Ϊȫ��
% tranx9 = zeros(229*9,224,224,3);
tranx9 = zeros(229*9,224,224,1);
k = 1;
for i = 1:picNum
    picName = strcat(num2str(i),'.jpg');
    picOrign = imread(strcat(file_path1,picName)); %��ʼͼ��
    pic = imcomplement(picOrign); %��ͼ��ת
    %imshow(pic);
    maskOrign = imread(strcat(file_path2,picName));
    mask = im2bw(maskOrign); %��ģ����ж�ֵ��
    %[m,n] = size(mask); %�����ݼ�ͼƬ��Сһ��512*512
    new = zeros(m,n);
    for j = 1:m
        for k = 1:n
            if(mask(j,k) == 1) %Ϊ��ɫ
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