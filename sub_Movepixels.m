function dst=sub_Movepixels(img,d_u,d_v)
% 获取图像大小
[h, w, c] = size(img);
% 创建目标图像
dst = zeros(h, w, c);
% 创建网格
[X, Y] = meshgrid(1:w, 1:h);
% 计算新的坐标
newX = X - d_u;         %d_u,d_v为补偿场，其中各元素表示该像素位置需要移动的量
newY = Y - d_v;         %这边的newX是相对位移，不是补偿位移！故用"-"
% 对每个通道进行插值
for ch = 1:c
    % 将输入矩阵src转换为单精度类型
    src_single = single(img(:, :, ch));
    % 进行插值计算
    dst(:, :, ch) = interp2(X, Y, src_single, newX, newY, 'linear', 0);     %超出边界的像素用0填充
    %对X，Y（坐标）和newX, newY（更细的网格采样）之间进行双线性插值，（X，Y）处对应的函数值z为src_single（z不变的）
end
% 转换数据类型(single2uint8)
dst = cast(dst, class(img));
% imshow(dst)


% 一个图像亚像素移动的matlab函数：dst = TranslateTransform(src, dx, dy, FillValue)，其中：
% src：输入的源图像，是彩色图像。src应该是一个三维矩阵，其中最后一个维度是3，表示颜色通道。
% dx：表示在x方向上的偏移，是与src相同的大小的矩阵，表示每个像素在x方向上的偏移量不同。
% dy：表示在y方向上的偏移，是与src相同的大小的矩阵。表示每个像素在y方向上的偏移量不同。
% FillValue：填充值，用于在计算过程中超出边界时的像素填充。是一个标量。
% 注意：dx和dy中的元素为小数，请不要直接使用四舍五入对其进行处理，而是采用亚像素的方法移动图像。保证变形后的图像完整，没有像素缺失

end