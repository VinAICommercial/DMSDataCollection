Step 1: We run bellow command to define position of cameras:

```
./camera.sh foldername
```

in which `foldername` is where we save files video.

Step 2: check on `foldername` step 1 what index filenames corresponding with position. For example

2: Upper_Left_IR
3: Upper_Left_RGB
4: Upper_Middle_IR
5: Upper_Middle_RGB
6: Lower_Left_IR
7: Lower_Left_RGB
8: Lower_Middle_IR
9: Lower_Middle_RGB

Step 3: Base on index file name. We run bellow command to save files into folder with name is position and IR/RGB index

```
./camera_v2.sh foldername UL_IR UL_RGB UM_IR UM_RGB LL_IR LL_RGB LM_IR LM_RGB 
```

in which UL_IR UL_RGB UM_IR UM_RGB LL_IR LL_RGB LM_IR LM_RGB is abbreviation for index in step 2 in range.
# DMSDataCollection
