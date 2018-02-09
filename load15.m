%addpath('/usr/local/matlab.etc/');
pic_num=230;
file_path = 'img_data\';
img_path = 'F:\matconvnet-1.0-beta18\examples\lumengchi\img15\';
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
    [l,m,r] = size(img3d); %ÿ��ͼr�ߴ粻һ��
    % for i=1:3
    %     figure,imshow(img3d(:,:,i));
    % end
    % n = 1;
    % imwrite(img3d,strcat(file_path,num2str(n),'.jpg')); %����ͼƬ
%     num0 = floor(r*2/3); %ѭ������
    temp = floor(r/3);
    num = floor(temp/10);
    
    num0 = floor(r*1/2);
    sta = num0 - 6*num; %��ʼ��ͼƬ�β������ر�С�������нϴ�ο���ֵ
    last = num0 + 8*num; %����ͼƬ�������β����򣬿��Ժ���
    if(i == 156)
        num = floor(temp/12);
        num0 = floor(r*1/2);
        sta = num0 - 6*num; %��ʼ��ͼƬ�β������ر�С�������нϴ�ο���ֵ
        last = num0 + 8*num; %����ͼƬ�������β����򣬿��Ժ���
    end
    if (i == 63 || i == 66 || i == 68 || i == 157 )
        num0 = floor(r*2/3);
        num = floor(temp/9);
        sta = num0 - 7*num; %��ʼ��ͼƬ�β������ر�С�������нϴ�ο���ֵ
        last = num0 + 7*num; %����ͼƬ�������β����򣬿��Ժ���
    end
   
    if (i == 113 || i == 114 || i == 115 || i == 116 )
         num = floor(temp/12);
        num0 = floor(r*1/3);
        sta = num0 - 7*num; %��ʼ��ͼƬ�β������ر�С�������нϴ�ο���ֵ
        last = num0 + 7*num; %����ͼƬ�������β����򣬿��Ժ���
    end

    for k = sta  :  num  : last
        pic0 = double(img3d(:,:,k));
%         pic1 = mapminmax(pic0,0,1);
%         pic1 = im2bw(pic1);
%         imshow(pic1);
        pic = imresize(pic0,[224,224]);
        imshow(pic);
        imwrite(pic,strcat(img_path, num2str(j),'.jpg')); %����ͼƬ
%         train_x8(j,:,:,1) = pic;
        j = j+1;
    end
end
