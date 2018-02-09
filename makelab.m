load label.mat
lab = zeros(229*9,1);
% lab2 = zeros(229*9,1);
for i = 1:229
    lab((i-1)*9+1:i*9) = repmat(label(i),9,1);
end
% lab2(1:1724) = lab(1:1724);
% lab2(1725:2323) = lab(1727:2325);
% lab2(2324:2336) = lab(2327:2339);
% lab2(2337:3431) = lab(2341:3435);
save label2 lab