function [pointList1,pointList2] = Descriptor_Matching(feature1,feature2,location1,location2)
    % ratio threshold
    ratioThresh = 0.8;
    pointList1 = [];
    pointList2 = [];
    size1 = size(feature1,1);
    size2 = size(feature2,1);
    for i = 1:size1
        best = 1;
        secondBest = 1;
        bestDist = Normalized_EucDist(feature1(i,:),feature2(1,:));
        secondBestDist = bestDist;
        for j = 2:size2
            tempDist = Normalized_EucDist(feature1(i,:),feature2(j,:));
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
            pointList1 = [pointList1;location1(i,1),location1(i,2)];
            pointList2 = [pointList2;location2(best,1),location2(best,2)];
        end
    end
    
end