# EyeEvaluationSourceCode
MatLab codes and scripts related to image processing, pre-processing & Training versions of the AlexNet Convolutional Neural Network (NetTransfers I-V)

	IMAGE PRE-PROCESSING
The project has been developed using the 'AlexNet' neural network. If you want to install the neural network in MatLab, follow the steps in the debugger. The images must be ready in the format 227x227 pixels and in color (RGB). Greyscale images and aimages with dimensions other than 227x227 px cannot be opened by AlexNet for retraining without first converting them. A converter of images ('Converter_227_final.m') with the required format for alexnet is provided.

'Converter_227_final.m': The code provides a small user interface that contains 3 functions: Add a red color filter to grayscale images, crop black areas from images, and resize images of any dimension to a new 227x227px image. Run the code and follow the steps. The images are replaced by the original ones. Take that into account and have a copy of the images for safety. 
		
		Add a red color filter to grayscale images
The function (by Valeriy Korostyshevskiy) converts grayscale images to RGB using a specified colormap. The default colormap is "hot". The graysale image is supplied either as a name or a matrix. [Valeriy Korostyshevskiy (2022). Grayscale to RGB Converter (https://www.mathworks.com/matlabcentral/fileexchange/13312-grayscale-to-rgb-converter), MATLAB Central File Exchange. Retrieved September 21, 2022.]

		Crop black areas from images
This function binarizes the original image to obtain a black and white image of equal dimensions. Since the area where a color pixel existed now has a value of 1 and the black areas have a value of 0, the pixel location index by row and column where the value is equal to 1 is extracted as a list. Using the value of the pixel location index as image coordinates, the maximum and minimum value per row and column is determined to establish the cropping edges of the image. It should be mention that due to its code design, this function does not affect previously cropped images that no longer contain black areas.
 
 		Resize images (227x227 pixels)
B = imresize(A,scale) returns image B that is scale times the size of image A. The input image A can be a grayscale, RGB, binary, or categorical image.


	
	
	IMAGE PROCESSING
Open the matlab working folder in the same folder as the 'CodigoAlterno.m' file. Run the code 'CodigoAlterno.m' Select the folder that contains the previously classified subfolders:

-The program reads the subfolders and classifies the images according to the names of the subfolders

-A window opens indicating several parameters of the learning of the neural network

-When finished, the file 'netTransfer.mat' is created in the folder where the code 'CodigoAlterno.m' is located 

	DATASETS USED IN THIS WORK
		
Free Access - Databases:

-Asia Pacific Tele-Ophthalmology Society (APTOS). Contains 3662 images of diabetic retinopathy that were used in the APTOPS 2019 blindness screening competitions. Each image has been resized and cropped to have a maximum size of 1024px. A certified clinician rated each image according to the severity of diabetic retinopathy on a scale of 0 to 4. A directory file is provided according to the previous scale: No diabetic retinopathy (0), Mild (1), Moderate (2), Severe (3), and Proliferative diabetic retinopathy (4). https://www.kaggle.com/c7934597/resized-2015-2019-diabetic-retinopathy-detection/metadata/

-High-Resolution Fundus (HRF) Image Database. Contains 15 images of healthy patients, 15 images of patients with diabetic retinopathy and 15 images of glaucomatous patients. They were captured by a Canon CR-1 fundus camera with a field of view of 45 degrees with a resolution of 3504×2336px. https://www5.cs.fau.de/research/data/fundus-images/

-Sungjoon Choi High-Resolution Fundus (sjchoi86-HRF). Created by Sungjoon Choi, assistant professor at Korea University, contains 601 fundus images of different pixel sizes divided into 4 groups: normal (300 images), glaucoma (101 images), cataract (100 images) and retina disease (100 images). https://github.com/cvblab/retina_dataset

Access Upon Request – Databases:

-Large-scale attention based glaucoma (LAG). Contains fundus images with positive (1711 images) and negative glaucoma (3143 images) samples obtained from Beijing Tongren Hospital with a resolution of 500×500px. Each fundus image is diagnosed by qualified glaucoma specialists, taking into consideration of both morphologic and functional analysis. http://dx.doi.org/10.1109/cvpr.2019.01082

-Ocular Disease Intelligent Recognition (ODIR). Contains images of 5000 patients with various eye diseases collected by Shanggong Medical Technology Co., Ltd. from different hospitals/medical centers in China. The fundus images are captured with various cameras on the market, resulting in varied image resolutions. They classify patients into eight labels based on the images of both eyes. A directory file is provided according to the following label: Normal Fundus (N), Diabetes (D), Glaucoma (G), Cataract (C), Age related Macular Degeneration (A), Hypertension (H), Pathological Myopia (M), Other diseases/abnormalities (O). https://odir2019.grand-challenge.org/dataset/


	SPECIFICATIONS OF THE DATA USED FOR RETRAINING EACH VERSION OF THE CNN

-netTransfer 1: Based on non-disease (3143 images) and suspicious glaucoma (1711 images) classes existing in the LAG-database.

-netTransfer2: Based on non-disease (3143 images) and suspicious glaucoma (1711 images) classes existing in the LAG-database; non-disease (300 images) and suspicious glaucoma (101 images) classes existing in the sjchoi86-HRF database. 

-netTransfer3: Based on non-disease (3143 images) and suspicious glaucoma (1711 images) classes existing in the LAG-database; non-disease (300 images) and suspicious glaucoma (101 images) classes existing in the sjchoi86-HRF database; non-disease (15 images), suspicious glaucoma (15 images) and suspicious diabetic retinopathy (15 images) classes existing in the HRF database.

-netTransfer4: Based on non-disease (3143 images) and suspicious glaucoma (1711 images) classes existing in the LAG-database; non-disease (300 images) and suspicious glaucoma (101 images) classes existing in the sjchoi86-HRF database; non-disease (15 images), suspicious glaucoma (15 images) and suspicious diabetic retinopathy (15 images) classes existing in the HRF database; suspicious diabetic retinopathy (1487 images) class existing in the APTOPS database.

-netTransfer5: Based on non-disease (3143 images) and suspicious glaucoma (1711 images) classes existing in the LAG-database; non-disease (300 images) and suspicious glaucoma (101 images) classes existing in the sjchoi86-HRF database; non-disease (15 images), suspicious glaucoma (15 images) and suspicious diabetic retinopathy (15 images) classes existing in the HRF database; suspicious diabetic retinopathy (1487 images) class existing in the APTOPS database; non-disease (2873 images) and suspicious glaucoma (200 images) classes existing in the ODIR database.

	FINALL TRAINING VERSIONS OF THE CNN - RELATED TO THE EVALUATION OF EYE DISEASES.

The CNNs resulting from the respective trainings are stored in the "Results" folder: netTransfer1, netTransfer2, netTransfer3, netTransfer4 and netTransfer5 for classification of diseases by classes. The convolutional neural network trainings are not subject to change or modification. Access to them through the DOI identifier: 10.5281/zenodo.7098879
