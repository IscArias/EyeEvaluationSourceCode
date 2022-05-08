# EyeEvaluationSourceCode
MatLab codes and scripts related to image processing and pre-processing.


    Image Pre-Processing

The project has been developed using the 'AlexNet' neural network. If you want to install the neural network in MatLab, follow the steps in the debugger. The images must be ready in the format 227x227 pixels and in color (RGB).

Black and white images cannot be opened without first converting them to color. A converter of images with the required format for alexnet is provided.

'Converter_227_final.m':Run the code and follow the steps. The images are replaced by the original ones. Take that into account and have a copy of the images for safety. A commented section allow to crop the black border of the image if it is uncommented (just pick the same option for image resize).

'grs2rgb.m': The function is used in the converter to obtain a reddish-toned image. You can modify the parameters of the function within the code of the function.

Finally, the converted images must be classified by ordering them in subfolders with the names of the subclasses to which they correspond.


    Image Processing
    
Open the matlab working folder in the same folder as the 'CodigoAlterno.m' file

Run the code 'CodigoAlterno.m'

Select the folder that contains the previously classified subfolders:

-The program reads the subfolders and classifies the images according to the names of the subfolders

-A window opens indicating several parameters of the learning of the neural network

-When finished, the file 'netTransfer.mat' is created in the folder where the code 'CodigoAlterno.m' is
