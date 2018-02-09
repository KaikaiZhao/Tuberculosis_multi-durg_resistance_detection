%addpath('/usr/local/matlab.etc/');
pic_num=230;
file_path = 'img_data\';
img_path = 'F:\matconvnet-1.0-beta18\examples\lumengchi\img9\';
j =1;

% train_x9 = zeros(pic_num*9,224,224,1);

for i= 1:pic_num

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
    num0 = floor(r/8); %ѭ������
    sta = 3*num0; %��ʼ��ͼƬ�β������ر�С�������нϴ�ο���ֵ
    last = num0*7; %����ͼƬ�������β����򣬿��Ժ���
    num = floor((last-sta)/9);
    for k = sta  :  num  : sta + num*8
        pic = imresize(double(img3d(:,:,k)),[224,224]);                                                        
        imshow(pic);
        imwrite(pic,strcat(img_path, num2str(j),'.jpg')); %����ͼƬ
%         train_x8(j,:,:,1) = pic;
        j = j+1;
    end
end
