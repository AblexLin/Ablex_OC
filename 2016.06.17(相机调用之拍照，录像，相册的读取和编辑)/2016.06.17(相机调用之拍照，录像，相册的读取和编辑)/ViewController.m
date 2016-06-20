//
//  ViewController.m
//  2016.06.17(相机调用之拍照，录像，相册的读取和编辑)
//
//  Created by 顾明轩 on 16/6/17.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - camera按钮点击事件
- (IBAction)camera {
    //判断手机的照相机是不是可以使用
    if ([UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera]) {
        //创建图像拾取器对象
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        //设置拾取源属性为相机其实就是告诉系统控制器是显示相机还是图片库
        picker.sourceType=UIImagePickerControllerSourceTypeCamera;
        //设置相机是录像还是拍照，默认的话也是拍照
        picker.cameraCaptureMode=UIImagePickerControllerCameraCaptureModePhoto;
        //设置摄像头是前置的还是后面的
        picker.cameraDevice=UIImagePickerControllerCameraDeviceRear;
        //设置代理
        picker.delegate=self;
        //显示拾取器控制器
        [self presentViewController:picker animated:YES completion:nil];
    }
}
#pragma mark - video按钮点击事件
- (IBAction)video {
    if ([UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera]) {
        //创建图像拾取器对象
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        //设置拾取源属性为相机其实就是告诉系统控制器是显示相机还是图片库
        picker.sourceType=UIImagePickerControllerSourceTypeCamera;
        
        //设置摄像头是前置的还是后面的
        picker.cameraDevice=UIImagePickerControllerCameraDeviceFront;
        
        //设置有声录像还是无声录像 @[];快速初始化为一个数组很方便
        picker.mediaTypes=@[(NSString *)kUTTypeMovie];//有声音有录像
        picker.mediaTypes=@[(NSString *)kUTTypeMovie];//有录像没声音
        //设置相机是录像还是拍照，默认的话也是拍照，这个必须放在设置有没有声音的下面，必须
        picker.cameraCaptureMode=UIImagePickerControllerCameraCaptureModeVideo;
        
        //设置录像的质量
        picker.videoQuality=UIImagePickerControllerQualityTypeIFrame1280x720;
        
        //设置代理
        picker.delegate=self;
        //显示拾取器控制器
        [self presentViewController:picker animated:YES completion:nil];
    }
}
#pragma mark - readPhoto按钮点击事件
- (IBAction)readPhoto {
    //判断手机的图库是不是可以使用，这一步还是有必要的
    if ([UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary]) {
        //创建图像拾取器对象
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        //设置拾取源属性为图片库
        picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        //设置代理
        picker.delegate=self;
        //显示拾取器控制器
        [self presentViewController:picker animated:YES completion:nil];
    }
}
#pragma mark - editPhoto按钮点击事件
- (IBAction)editPhoto {
    //判断手机的照相机是不是可以使用
    if ([UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera]) {
        //创建图像拾取器对象
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        //设置拾取源属性为相机其实就是告诉系统控制器是显示相机还是图片库
        picker.sourceType=UIImagePickerControllerSourceTypeCamera;
        //设置相机是录像还是拍照，默认的话也是拍照
        picker.cameraCaptureMode=UIImagePickerControllerCameraCaptureModePhoto;
        //设置摄像头是前置的还是后面的
        picker.cameraDevice=UIImagePickerControllerCameraDeviceRear;
        
        //允许编辑
        picker.allowsEditing=YES;
        
        //设置代理
        picker.delegate=self;
        //显示拾取器控制器
        [self presentViewController:picker animated:YES completion:nil];
    }
}

#pragma mark - UIImagePickerController 代理事件
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    /*******分割线-拍照部分******/
    //从字典里通过key获取原始图片，这个主要是相对于是不是编辑的
    UIImage *img=[info valueForKey:UIImagePickerControllerOriginalImage];
    //把获取来的图片显示在界面的图片视图上面
    self.photo.image=img;
    
    /*******分割线-录像部分******/
    //获取录像保存的url路径
    NSURL *url=info[UIImagePickerControllerMediaURL];;
    //url转换为字符串路径，这里的路径里面会有一个file://
    NSString *path=[url path];
    //判断能否保持到相册
    if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(path)) {
        //保存到这个地方去,这里的sel有两个参数哦
        UISaveVideoAtPathToSavedPhotosAlbum(path, self, @selector(video: didFinishSavingWithError:contextInfo:), nil);
    }
    
    /*******分割线-读取相册******/
    //从字典里通过key获取图片，这个和上面的相机拍照是一样的哦
    UIImage *img2=[info valueForKey:UIImagePickerControllerOriginalImage];
    //把获取来的图片显示在界面的图片视图上面
    self.photo.image=img2;
    
    /*******分割线-编辑图片******/
    //从字典里通过key获取编辑后的照片
    UIImage *img3=[info valueForKey:UIImagePickerControllerEditedImage];
    //把获取来的图片显示在界面的图片视图上面
    self.photo.image=img3;
    
    /*******分割线-公共部分******/
    //dismiss控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //取消的时候也要关闭拾取器控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - video保存到相册的回调函数
- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
{
    //保存路径后的一个回调函数，注意，其实就是保存录像成功没
    if (error) {
        NSLog(@"%@",error.localizedDescription);
    }
    else{
        NSLog(@"保存成功");
        //获取录像地址转换为url，然后会自动调用系统的相册去播放哦
        NSURL *url=[NSURL fileURLWithPath:videoPath];
        //创建播放器，这个是旧版本的播放器，也可以使用最新的，无所谓
        MPMoviePlayerViewController *player=[[MPMoviePlayerViewController alloc]initWithContentURL:url];
        //开始播放
        [self presentViewController:player animated:YES completion:nil];
    }
}

@end
