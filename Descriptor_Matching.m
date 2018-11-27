function [pointList1,pointList2] = Descriptor_Matching(feature1,feature2)
    % ratio threshold
    ratioThresh = 0.8;
    pointList1 = [];
    pointList2 = [];
    size1 = size(feature1,2);
    size2 = size(feature2,2);
    for i = 1:size1
        best = 1;
        secondBest = 1;
        bestDist = Normalized_EucDist(feature1(1:128,i),feature2(1:128,1));
        secondBestDist = bestDist;
        for j = 2:size2
            tempDist = Normalized_EucDist(feature1(1:128,i),feature2(1:128,j));
            if(tempDist < bestDist)
                secondBest = best;
                secondBestDist = bestDist;
                best = j;
                bestDist = tempDist;
            elseif(tempDist < secondBest)
                secondBest = j;
                secondBestDist = tempDist;
            end
        end
        if(bestDist/secondBestDist < ratioThresh)
            pointList1 = [pointList1;feature1(130,i),feature1(129,i)];
            pointList2 = [pointList2;feature2(130,best),feature1(129,best)];
        end
    end
    
end