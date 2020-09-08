function OrderStatisticFilters(file, a , action)

b = imread(file);
c = im2double(b);
[p,q] = size(c);

result = zeros(p,q);

if action == "min"
    for i = 1:p
        for j = 1:q
            rowmin = max(1, i-a);
            rowmax = min(p, i+a);
            colmin = max(1, j-a);
            colmax = min(q, j+a);
            temp = c(rowmin:rowmax , colmin:colmax);
            result(i, j) = min(temp(:));
        end
    end

    
elseif action == "median"
    for i = 1:p
        for j = 1:q
            rowmin = max(1, i-a);
            rowmax = min(p, i+a);
            colmin = max(1, j-a);
            colmax = min(q, j+a);
            temp = c(rowmin:rowmax , colmin:colmax);
            result(i, j) = median(temp(:));
        end
    end
    
elseif action == "max"
    for i = 1:p
        for j = 1:q
            rowmin = max(1, i-a);
            rowmax = min(p, i+a);
            colmin = max(1, j-a);
            colmax = min(q, j+a);
            temp = c(rowmin:rowmax , colmin:colmax);
            result(i, j) = max(temp(:));
        end
    end
else 
    error('enter appropriate non-linear filter type as a string')
end    
figure('name', 'order statistics filter to remove salt and pepper noise');
set(gcf, 'Position', get(0,'ScreenSize'));
subplot(1, 2, 1);
imshow(c);
title('native image');

subplot(1, 2, 2);
imshow(result);
title('order-statistic  filtered image');


end