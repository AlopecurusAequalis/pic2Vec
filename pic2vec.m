clear 

maru = imread('maru.png');
maru = maru(:, :, 1);
maru = ~maru
[maruVecRow, maruVecCol] = find(flip(maru)');
maruVec = [maruVecRow, maruVecCol];
figure(1)
clf
scatter(maruVecRow, maruVecCol)
title('NonSorted')

%%
maruVecRemain = maruVec(1:end, :);
maruVecSorted(1, :) = maruVec(1, :);
maruVecRemain(1, :) = [];

for pointCnt = 2:length(maruVec)
  currentPoint = maruVecSorted(pointCnt - 1, :);
  maruVecDist = maruVecRemain - currentPoint;
  [~, idx] = sort(vecnorm(maruVecDist, 2, 2), 1);
  maruVecSorted(pointCnt, :) = maruVecRemain(idx(1), :);
  maruVecRemain(idx(1), :) = [];
end

figure(2)
clf
scatter(maruVecSorted(:, 1), maruVecSorted(:, 2))
title('Sorted')

figure(3)
clf
plot(diff(maruVecSorted)) 
