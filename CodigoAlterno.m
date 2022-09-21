%Code by Paolo Velásquez - YachayTech University
%Biomedical Engineer Student.
%School of Biological Sciences and Engineering.

imds = imageDatastore('ImageData5', ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
%auimds = augmentedImageDatastore(imds,'ColorPreprocessing','gray2rgb');
[imdsTrain,imdsValidation] = splitEachLabel(imds,0.7,'randomized');
net = alexnet;
inputSize = net.Layers(1).InputSize;
layersTransfer = net.Layers(1:end-3);
numClasses = numel(categories(imdsTrain.Labels));
layers = [
    layersTransfer
    fullyConnectedLayer(numClasses,'WeightLearnRateFactor',20,'BiasLearnRateFactor',20)
    softmaxLayer
    classificationLayer];
pixelRange = [-30 30];
imageAugmenter = imageDataAugmenter( ...
    'RandXReflection',true, ...
    'RandXTranslation',pixelRange, ...
    'RandYTranslation',pixelRange);
augimdsTrain = augmentedImageDatastore(inputSize(1:2),imdsTrain, ...
    'DataAugmentation',imageAugmenter);
augimdsValidation = augmentedImageDatastore(inputSize(1:2),imdsValidation);
options = trainingOptions('sgdm', ...
    'MiniBatchSize',10, ...
    'MaxEpochs',6, ...
    'InitialLearnRate',1e-4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',augimdsValidation, ...
    'ValidationFrequency',3, ...
    'Verbose',false, ...
    'Plots','training-progress');
netTransfer5 = trainNetwork(augimdsTrain,layers,options);
[YPred,scores] = classify(netTransfer5,augimdsValidation);
YValidation = imdsValidation.Labels;
accuracy = mean(YPred == YValidation);
save netTransfer5;