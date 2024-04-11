function [metrics_vector] = compute_metrics(GT,auto)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% Calcula la matriz de confuncion, o la table de contingencia
C = confusionmat(GT(:),auto(:));  % (Known, Predicted)

% Valores de cada elemento de la matriz
% C = [ TP    FP          % [ (1,1)       (1,2)
%       FN   TN];         %   (2,1)      (2,2) ];
TP=C(1,1);
FP=C(1,2);
FN=C(2,1);
TN=C(2,2);
             
% Cálculo de métricas de evaluación:
Accuracy= (TP + TN)/sum(sum(C));    % TP + TN / (SUM ALL)  Accuracy
Precision= TP/(TP + FP);            % TP /(TP+FP) positive predicted value                                                
Sensitivity= TP /(TP+FN);           % TP /(TP+FN) true positive rate (Recall)
Specificityc= TN/ (TN+FP);          % TN/(TN+FP)  especificity
FPR = FP/(FP+TN);                   % FP/(FP+TN) false positive rate (1-specificity)

Jaccard = TP / (TP + FP + FN);          % jaccard(A,B) = TP / (TP + FP + FN)
Dice = 2 * TP / ( 2 * TP + FP + FN);    % dice(A,B) = 2 * TP / ( 2 * TP + FP + FN)
% This is another way to compute the similitud indices: (equivalent)
% Jaccard=(Precision*Sensitivity)/(Precision+Sensitivity-(Precision*Sensitivity));
% Dice=2*(Precision*Sensitivity)/(Precision+Sensitivity);

metrics_vector=[Accuracy Precision Sensitivity Specificityc FPR Jaccard Dice];



end