# Photoshop-Layer-Normalization-Tool
An automating merge layers tool for *.psd file.

## Purpose

- The widget trees of Game Engine's (UE4 Engine/Unity3D Engine) UI assets do not map well with Photoshop **.psd* layers, some of **.psd* features (e.g. the layer set, the mask, and the layer FX) cannot be imported to Game Engine directly. So this tool is designed for merging some group patterns in **.psd* into a single layer, in order to eliminate the features that Game Engine do not support. 

- Of course, you could combine groups in **.psd* manually, however that's way too tedious. 

## Feature

- This tool supports merge the following patterns:
    - layers with layer pattern
    - layers with clipping mask
    - layers with mask
    - layer patterns with layer set
    - layer set with mask
    - empty layer / empty textblock / empty group / empty layer set
    - layer set naming with prefix "merge"
- Note:
    - The source file wouldn't be changed. 
    - The tool duplicates the source file and generates a new file naming with postfix "_norm". 
    - You will be asked to save normalized new file in somewhere you like.

## Installation & Usage

1. Install Photoshop CC(or higher version)
2. git clone 
3. double click *Install.cmd*
4. Restart Photoshop CC
5. Top Menu Bar -> File -> Auto -> Photoshop-Layer-Normalization-Tool
