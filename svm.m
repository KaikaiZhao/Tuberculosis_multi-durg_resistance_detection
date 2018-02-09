% [newX,T,meanValue] = mypca(v37,0.995);
% [newX,T,meanValue] = mypca(v36,0.995);
% [newX,T,meanValue] = mypca(v35,0.995);
% save newX35_995 newX
% v = newX;
v = [newX35,newX36,newX37];
% v = [newX35,newX36];
acc1 = zeros(10,1);acc2 = zeros(10,1);
% [newX,T,meanValue] = mypca(v,0.995);
for tt = 1:10
    [c,g]=meshgrid(-10:10:10,-10:10:10);
    [m,n]=size(c);
    cg=zeros(m,n);
    eps=10^(-4);
    v = 5;
    bestc = 1;
    bestg = 0.1;
    bestacc = 0;
    trnum = 180;
    img_num = 229;
    a=randperm(img_num);
    load label.mat
    newX2=newX(a,:);
    label2 = label(a);
    train_x = newX2(1:trnum,:);
    test_x =  newX2(1+trnum : img_num, :);
    train_y = label2(1:trnum);
    test_y =  label2(1+trnum : img_num);

    for i = 1:m
        for j = 1:n
             cmd = ['-v ',num2str(v),' -c ',num2str(2^c(i,j)),' -g ',num2str(2^g(i,j)),'-t 0'];
             disp('start train...');
             cg(i,j) = svmtrain(train_y,train_x,cmd);
             disp('finish train...');
            if cg(i,j) > bestacc
                bestacc = cg(i,j);
                bestc = 2^c(i,j);
                bestg = 2^g(i,j);
            end        
            if abs( cg(i,j)-bestacc )<=eps && bestc > 2^c(i,j) 
                bestacc = cg(i,j);
                bestc = 2^c(i,j);
                bestg = 2^g(i,j);
            end               
            disp(j);
        end
    end

    cmd = [' -t 0',' -c ',num2str(bestc),' -g ',num2str(bestg)];
    % 创建/训练SVM模型
    model = svmtrain(train_y,train_x,cmd);

    [predict_label_1,accuracy_1,b_1] = svmpredict(train_y,train_x,model,'p');
    [predict_label_2,accuracy_2,p_2] = svmpredict(test_y,test_x,model,'p');
    result_1 = [train_y predict_label_1];
    result_2 = [test_y  predict_label_2];

    acc1(tt) = accuracy_1(1)
    acc2(tt) = accuracy_2(1)
end

mean(acc1)
mean(acc2)