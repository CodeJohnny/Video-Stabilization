%% 解四个方程组得到角点位移，然后再用角点位移表示内部位移
%此补偿场程序接着MSTC.m跟踪得到的四个点的坐标(x_all,y_all)和相对位移(deltaxi,deltayi)做

%% 补偿场大小为h*w，内部每个元素为该像素需要移动的值
%1.对每帧图像，获取当前帧特征点的坐标和相对位移（MSTC输出的数据）
%2.由这些数据计算得到该帧的补偿场，d_u,d_v即每个像素应该移动多少
%3.对该帧的每一个像素移动补偿，对齐至第一帧
tic;
w=video.Width;      %接着MSTC做
h=video.Height;
[~,video_name,type]=fileparts(file);
ResultVideoPath=[filePath,video_name,'非均匀补偿结果.mp4'];
WriterObj=VideoWriter(ResultVideoPath,'MPEG-4');       %待合成的视频的文件路径，指定MP4格式写入
WriterObj.FrameRate = Fs;  
open(WriterObj);  
for kk=1:video.NumFrames
    img = read(video,kk);
    %1.----------已知跟踪点在该帧的（x，y）坐标（左上，右上，右下，左下）
    uv=[x_all(1,kk),y_all(1,kk); x_all(2,kk),y_all(2,kk); x_all(3,kk),y_all(3,kk);x_all(4,kk),y_all(4,kk) ];
    u=uv(:,1);
    v=uv(:,2);          %代入的坐标u,v也要相同1.对应
    %四个跟踪点坐标（4*2）（左上，右上，右下，左下）注意2.对应（取特征点时就按这个顺序）
    %2.----------输入当前帧（k帧）四个跟踪点处相对于第一帧的移动量（4*1），计算角点相对位移（调用函数）
    dx=[deltax1(kk);deltax2(kk);deltax3(kk);deltax4(kk)];      
    dy=[deltay1(kk);deltay2(kk);deltay3(kk);deltay4(kk)];
    dx1234=corner_xy(u,v,dx,h,w);           %当前帧（k帧）四个角点x向相对位移
    dy1234=corner_xy(u,v,dy,h,w);

    %3.----------定义调用函数，并对该帧中每一个像素遍历，求解
    dingyid_u = @(u,v) doublelinerinterpolation(u,v,dx1234,h,w);
    dingyid_v = @(u,v) doublelinerinterpolation(u,v,dy1234,h,w);
    d_u = zeros(h, w);
    d_v = zeros(h, w);
    %-------（先在该循环内计算并后接移动/后再调用cell中的节点，计算位移场再移动？）
    % -------遍历每一个像素，求出场内每一个像素点的相对位移x，y
    for v=1:h
        for u=1:w
            d_u(v,u) = dingyid_u(u,v);
            d_v(v,u) = dingyid_v(u,v);
        end
    end
    d_u=-d_u;
    d_v=-d_v;
    %得到当前帧（k帧）的两个补偿场(为相对位移的反向)


    %4.--------移动像素（调用函数）
    % new_img=Movepixels(img,d_u,d_v,h,w);      %整像素移动函数，并处理黑线
    new_img=sub_Movepixels(img,d_u,d_v);        %亚像素移动函数

    %5.-------将处理后的帧写入输出视频
    writeVideo(WriterObj, new_img);

end
close(WriterObj);
disp('写入视频成功');
toc



