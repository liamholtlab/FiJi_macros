//Select Directories
input = getDirectory("Choose Source Directory");
output = getDirectory("Choose Destination Directory");

//===============================

run("Bio-Formats Macro Extensions"); // need this to run to open images with the special importer (see below)
									// that does not have the popup window

list = getFileList(input);			//a new variable containing the names of the files in the input variable
for (i = 0; i < list.length; i++)
        action(input, output, list[i]);
 
function action(input, output, filename) {
        Ext.openImagePlus(input+list[i]); //this is the line to open images without the bioformats importer
        filename = getTitle();
        run("Split Channels");
        selectWindow("C1-" + filename);
        run("Grays");
        saveAs("Tiff", output + filename + "_GEMs");
        selectWindow("C2-" + filename);
        run("Grays");
        saveAs("Tiff", output + filename + "_K27ac");
        selectWindow("C3-" + filename);
        run("Grays");
        saveAs("Tiff", output + filename + "_SiR-DNA");       
        run("Close All");
}
