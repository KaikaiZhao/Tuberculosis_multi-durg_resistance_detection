% file_path1 = 'img9\';
% file_path2 = 'mask9\';
file_path3 = 'com_pic9cut\'; %�洢���ݼ�
path = strcat(file_path3,'*.jpg');

D = dir(path); %ͳ���ļ�����ͼƬ����, D��һ��struct��ͳ�������Ϣ
picNum = length(D);

m = 224;
n = 224;
% new = zeros(m,n); %����ͼ����Ϊȫ��
% tranx9 = zeros(229*9,224,224,3);
tranx9 = zeros(229*15-4,224,224,1);
k = 1;
for i = 1:picNum
    picName = strcat(num2str(i),'.jpg');
    new = imread(strcat(file_path3,picName)); %��ʼͼ��
%     pic = imcomplement(picOrign); %��ͼ��ת
%     %imshow(pic);
%     maskOrign = imread(strcat(file_path2,picName));
%     mask = im2bw(maskOrign); %��ģ����ж�ֵ��
%     %[m,n] = size(mask); %�����ݼ�ͼƬ��Сһ��512*512
%     new = zeros(m,n);
%     for j = 1:m
%         for k = 1:n
%             if(mask(j,k) == 1) %Ϊ��ɫ
%                 new(j,k) = pic(j,k);
%             end
%         end
%     end
%     %imshow(new);
%     imwrite(new,strcat(file_path3,num2str(i),'.jpg'));
    tranx9(k,:,:,1) = new;
    if i == 1725 || i == 1726 || i == 2326 || i == 2340
        continue
    end
    k = k+1;
% switch mod(i,9)
%     case 1
%         k = (i+8)/9;
%         tranx9(k,:,:,1) = new;
%     case 2
%         k = (i+7)/9;
%         tranx9(k,:,:,2) = new;
%     case 3
%         k = (i+6)/9;
%         tranx9(k,:,:,3) = new;
%     case 4
%         k = (i+5)/9;
%         tranx9(k,:,:,4) = new;
%     case 5
%         k = (i+4)/9;
%         tranx9(k,:,:,5) = new;
%     case 6
%         k = (i+3)/9;
%         tranx9(k,:,:,6) = new;
%     case 7
%         k = (i+2)/9;
%         tranx9(k,:,:,7) = new;
%     case 8
%         k = (i+1)/9;
%         tranx9(k,:,:,8) = new;
%     otherwise 
%         k = (i)/9;
%         tranx9(k,:,:,9) = new;
% end
end
save tranx9 tranx9 