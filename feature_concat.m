img_num = 229;
v36 = zeros(img_num,1024*9);
for j=1:img_num
%     tmp1=[];
    tmp2=[];
    for k=1:9
%         tmp1=[tmp1 vec36((j-1)*8+1,:)];
        tmp2=[tmp2 feature((j-1)*9+1,:)];
    end
    v36(j,:) = tmp2;
end
%     
% save v36 v36 -v7.3
save v36ft3 v36 -v7.3
