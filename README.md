# Video-Stabilization
**Introduction:** An ``electronic image stabilization`` method for a video with ``feature points``, which is based on non-uniform compensation using compensation fields. This method is different from traditional methods that compensate for the entire image, and instead compensates for ``each pixel in each frame of the video``, so that ``precise compensation`` can be achieved in the selected feature point region and has a certain ability to ``resist wind interference``.Through many experiments, it is proved that the method has the ``ideal image stabilization effect``。

<div align=center><img src=https://github.com/CodeJohnny/Video-Stabilization/assets/97861483/67e3f91a-3e65-4811-bd4e-30091753c9e9width="200" height="350" /></div>


<p align="center">  
The technical route of non-uniform compensation image stabilization
</p> 

**Usage:** After obtaining the displacement time history data of any four feature points in the image relative to the first frame, MATLAB is used to run the 'Compensationfield.m' file, which can output the stabilized video and is suitable for the video shot by UAV.

**NOTE:**  This project only uploaded the codes of the last three steps of the technical route, that is, the non-uniform compensation image stabilization technology. The first step of image preprocessing can be completed by the readers yourselves, and the second and third steps of MSTC feature point tracking method can contact the author (ctjohnny@mail.scut.edu.cn), which is for personal use only, thanks!

**Reference：**

[1]周洲,陈太聪.干扰环境下基于计算机视觉的多目标动位移高精度监测方法[J].振动工程学报,2021,34(5):979-986

***
**介绍：**
一种``有特征点``的视频的``电子稳像``方法，即基于补偿场的非均匀补偿方法。该方法不同于传统方法对整张图像补偿，而对``每帧图像的每个像素点``进行补偿，因此在特征点选取区域内，能实现``精准补偿``，并且具有一定的``抗风干扰能力``。通过多次实验，验证了该方法具有``理想的稳像效果``。

<div align=center><img src=https://github.com/CodeJohnny/Video-Stabilization/assets/97861483/0756de2a-6d4c-4927-bf8f-04d9ba82010cwidth="200" height="350" /></div>

<p align="center">  
非均匀补偿稳像的技术路线
</p> 

**使用：**
在获取了图像中任意四个特征点的相对于第一帧的图像位移时程数据后，使用MATLAB运行‘Compensationfield.m’文件，即可以输出稳像后的视频，并且适用于无人机拍摄的视频。

**值得注意的是，**
本项目仅上传了技术路线的后三步的代码，也就是非均匀补偿稳像技术，第一步图像预处理可以由读者自行完成，第二步和第三步MSTC特征点跟踪方法可以联系作者（ctjohnny@mail.scut.edu.cn），仅供自用，谢谢！

**参考文献：**

[1]周洲,陈太聪.干扰环境下基于计算机视觉的多目标动位移高精度监测方法[J].振动工程学报,2021,34(5):979-986

Loading…
