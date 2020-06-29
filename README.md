# flutter 基于掘金App实现的UI页面

### 项目启动

- 众所周知的原因， 国内能查到的有关flutter的资料是比较少的，掘金上有几位大佬都做了有关flutter的入门和进阶讲解，看完受益颇多，即以掘金App作为入门项目吧。

### 项目目的

- 熟悉dart基本语法
- 熟悉flutter常用的Widget,对于使用频次高的Widget有个大致的了解
- flutter 业务Widget封装，

### 项目截图
<table>
    <tr>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-8dda6a09fcd71dbd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-b2c5ec16427da4a7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-bc5e6175c01a6be8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
    </tr>
    <tr>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-3097f4db1277e804.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-3d8e9946a08895cf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-6cc71c9b12394090.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
    </tr>
    <tr>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-d262e5530606c8cd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-d5c3a22c5379bf30.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-ee8645bcc157c6fb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
    </tr>
    <tr>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-21cb67d0d17dfd8b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-dad68b76af67bbbf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-3751bf43dbfde34b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
    </tr>
    <tr>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-2e9be4318e74bf74.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-0ed4be8d9241b52d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-4165024208430b63.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
    </tr>
    <tr>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-d9b3ed7124957e6c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-2a561445d0c95bf9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-aab11404fb5a28ca.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" />
            </center>
        </td>
    </tr>
    <tr>
        <td>
            <center>
                <img src="https://upload-images.jianshu.io/upload_images/9403487-b0cd5dfa0be63b00.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400" alt="">
            </center>
        </td>
    </tr>
</table>

### 遗留问题

- 掘金app中向下滚动隐藏appBar,向上滚动显示appBar的动画未实现
- 个人中心appBar 滚动的效果实现
- 没有实现mock数据，没有实现列表加载效果
- 项目都是静态页面，没有请求接口
- 未做状态管理