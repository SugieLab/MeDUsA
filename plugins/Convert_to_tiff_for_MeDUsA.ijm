/*
 * Macro template to process multiple images in a folder
 */

#@ File (label = "Input directory", style = "directory") input
#@ File (label = "Output directory", style = "directory") output
#@ String (label = "File suffix", value = ".oir") suffix
//#@ String (label = "Number of Channels", value = "") channel

// See also Process_Folder.py for a version of this code
// in the Python scripting language.

processFolder(input);

// function to scan folders/subfolders/files to find files with correct suffix
function processFolder(input) {
	list = getFileList(input);
	list = Array.sort(list);
	for (i = 0; i < list.length; i++) {
		if(File.isDirectory(input + File.separator + list[i]))
			processFolder(input + File.separator + list[i]);
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i]);
	}
}

function processFile(input, output, file) {
	open(input + File.separator + file);
	getDimensions(width, height, channels, slices, frames);
	channel = channels;
	selectWindow(file);
	if (channel >3){
		run("Split Channels");
		run("RGB Color");
		newfolder = output + "/" + "C4-"+ file + "_raw";
		test = output;
		File.makeDirectory(newfolder); 
		run("Image Sequence... ", "format=TIFF name=[] start=1 digits=3 save=["+newfolder+"]");
		close();
		selectWindow("C3-"+file);
		run("RGB Color");
		newfolder = output + "/" + "C3-"+ file + "_raw";
		test = output;
		File.makeDirectory(newfolder); 
		run("Image Sequence... ", "format=TIFF name=[] start=1 digits=3 save=["+newfolder+"]");
		close();
		selectWindow("C2-"+file);
		run("RGB Color");
		newfolder = output + "/" + "C2-"+ file + "_raw";
		test = output;
		File.makeDirectory(newfolder); 
		run("Image Sequence... ", "format=TIFF name=[] start=1 digits=3 save=["+newfolder+"]");
		close();
		selectWindow("C1-"+file);
		run("RGB Color");
		newfolder = output + "/" + "C1-"+ file + "_raw";
		File.makeDirectory(newfolder); 
		run("Image Sequence... ", "format=TIFF name=[] start=1 digits=3 save=["+newfolder+"]");
		close();
	}else if (channel > 2){
		run("Split Channels");
		run("RGB Color");
		newfolder = output + "/" + "C3-"+ file + "_raw";
		test = output;
		File.makeDirectory(newfolder); 
		run("Image Sequence... ", "format=TIFF name=[] start=1 digits=3 save=["+newfolder+"]");
		close();
		selectWindow("C2-"+file);
		run("RGB Color");
		newfolder = output + "/" + "C2-"+ file + "_raw";
		test = output;
		File.makeDirectory(newfolder); 
		run("Image Sequence... ", "format=TIFF name=[] start=1 digits=3 save=["+newfolder+"]");
		close();
		selectWindow("C1-"+file);
		run("RGB Color");
		newfolder = output + "/" + "C1-"+ file + "_raw";
		File.makeDirectory(newfolder); 
		run("Image Sequence... ", "format=TIFF name=[] start=1 digits=3 save=["+newfolder+"]");
		close();
	}else if (channel > 1){
		run("Split Channels");
		run("RGB Color");
		newfolder = output + "/" + "C2-" + file + "_raw";
		test = output;
		File.makeDirectory(newfolder); 
		run("Image Sequence... ", "format=TIFF name=[] start=1 digits=3 save=["+newfolder+"]");
		close();
		selectWindow("C1-"+file);
		run("RGB Color");
		newfolder = output + "/" + "C1-"+ file + "_raw";
		File.makeDirectory(newfolder); 
		run("Image Sequence... ", "format=TIFF name=[] start=1 digits=3 save=["+newfolder+"]");
		close();
	}else {
	run("RGB Color");
	newfolder = output + "/" + "C1-" + file + "_raw";
	test = output;
	File.makeDirectory(newfolder); 
	run("Image Sequence... ", "format=TIFF name=[] start=1 digits=3 save=["+newfolder+"]");
	close();
	}
}