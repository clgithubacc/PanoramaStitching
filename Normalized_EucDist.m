function [distance] = Normalized_EucDist(vector1,vector2)
    vector1 = vector1./sum(vector1);
    vector2 = vector2./sum(vector2);
    distance = sum((vector2-vector1).^2);
    distance = sqrt(distance);
end