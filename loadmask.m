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
    [l,m,r] = size(img3d); %ÿ��ͼr�ߴ粻һ��
    % for i=1:3
    %     figure,imshow(img3d(:,:,i));
    % end
    % n = 1;
    % imwrite(img3d,strcat(file_path,num2str(n),'.jpg')); %����ͼƬ
    num = round(r/10); %ѭ������
    start = 2*num; %��ʼ��ͼƬ�β������ر�С�������нϴ�ο���ֵ
    last = r-num+5; %����ͼƬ�������β����򣬿��Ժ���
    for i = start:num:num*9
        pic = double(img3d(:,:,i));
        %imshow(pic);
        imwrite(pic,strcat(img_path, num2str(j),'.jpg')); %����ͼƬ
        j = j+1;
    end
end