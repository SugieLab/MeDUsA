# MeDUsA
For details, please read the paper here: 論文のアドレス

### MeDUsA (a *Me*thod for the quantification of *D*egeneration *Us*ing fly *A*xons) is a software that automatically creates masks and counts axon terminals using a combination of deep learning and Python. By using the software, the number of R7 axons in Drosophila can be automatically quantified easily and quickly from confocal images.

To download the MeDUsA for Windows visit here: [https://doi.org/10.5281/zenodo.5533046](https://doi.org/10.5281/zenodo.5533046)

To download the pretrained model please visit here:  [https://doi.org/10.5281/zenodo.5533811](https://doi.org/10.5281/zenodo.5533811)

To download the sample files visit here: [MeDUsA_samples.zip](https://github.com/SugieLab/MeDUsA/blob/5b34dcd87ba854033e07035d54a5de1a8decd8e4/Sample/MeDUsA_samples.zip)


## Preparation before using the MeDUsA
See Fig. 2 (C) of the above paper for specimen preparation.<br><br>
When scanning your samples, please keep in mind the following points:
- Pixel size of each slice in the z-stack must be 512 * 512 pixels.
- Pixel width/height of the each slice should be around 0.414 µm.
- z-stack step size should be 1 µm.
- The whole areas of R7 axonal terminals must be included (see the Fig. 1 below and the sample files).

![](https://github.com/SugieLab/MeDUsA/blob/f4279fd5d82dbc1b0ff63382b306920be79f2f62/images/Scanning%20Area.png)

#### Fig. 1:Schematic Model of 

After scanning, you need to convert confocal z-stacks into tif files. The tif files must be named in the following order: 001.tif, 002.tif, ...<br> Next, each tif files needs to be placed in a different folder for each sample, and the folder name must end with "_ raw". The folders created in this manner is entered into an arbitrary folder (see the Fig. 2 below).
![](https://github.com/SugieLab/MeDUsA/blob/be7c14651f8df26bbc952e029492fb66da61307a/images/Directory%20Structure.png)
#### Fig. 2: Directory structure

<br><br>To automate these processes, we developed an ImageJ plugin: [Convert_to_tiff_for_MeDUsA.ijm](https://github.com/SugieLab/MeDUsA/blob/c19dff9ffa6e4dbb14e72d1f4f756e5bad8ed9ce/plugins/Convert_to_tiff_for_MeDUsA.ijm)


## Runnning the MeDUsA
MeDUsA has a very simple graphical interface and is capable of automatically quantify the number of R7 axons of *Drosophila* in a few short steps.
1. In 'data folder', choose the folder containing the folders named “xxx_raw” including samples you would like to predict. Multiple samples can be predicted with the subfolders.
2. In 'mask output folder', choose the folder where you would like to export predicted mask files.
3. In 'result output folder', choose the folder where you would like to output the .csv file for prediction results.
4. In 'model hdf5', choose the pretrained model you downloaded above.
5. In 'percent of images to output detection points', if you want to get images that shows where MeDUsA predicted as axonal terminals, enter “100”. But it will take a long time. 
6. Click the start button.

Prediction will start immediately and predicted mask will be exported as tif files to the folder specified in step-2 and prediction result will be exported as csv file to the folder selected in step-3.<br><br>
Prediction without output detection points takes 50 seconds per sample on a typical desktop workstation (CPU: Intel Core i7 9800 X 3.8 GHz RAM: DDR4 128 GB).

## Contact
### Developer:
__Hiroki Kawai__: developed and trained MeDUsA<br>
__Yohei Nitta__: developed ImageJ plugin

### Corresponding Author:
__Atsushi Sugie__, PhD<br>
Associate Professor<br>
Brain Research Institute<br>
Niigata University<br>
E-mail: atsushi.sugie [at] bri.niigata-u.ac.jp
