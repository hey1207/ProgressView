//
//  ViewController.m
//  ProgressView
//
//  Created by Mars on 2017/11/29.
//  Copyright © 2017年 赵向禹. All rights reserved.
//

#import "ViewController.h"

#import "ZXYSectorProgress.h"
#import "ZXYBallProgress.h"
#import "ZXYCircleProgress.h"
#import "ZXYWaveProgress.h"

@interface ViewController ()
{
    /** 扇形进度 */
    ZXYSectorProgress *_sectorProgress;
    /** 圆形进度 */
    ZXYBallProgress *_ballProgress;
    /** 圆弧进度 */
    ZXYCircleProgress *_circleProgress;
    /** 波浪进度 */
    ZXYWaveProgress *_waveProgress;
    
    UISlider *_slider;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _sectorProgress = [[ZXYSectorProgress alloc] initWithFrame:CGRectMake(10, 50, 150, 150) progress:0.5];
    _sectorProgress.fillColor = [UIColor yellowColor];
    [self.view addSubview:_sectorProgress];
    
    _ballProgress = [[ZXYBallProgress alloc] initWithFrame:CGRectMake(215, 50, 150, 150) progress:0.5];
    _ballProgress.fillColor = [UIColor yellowColor];
    _ballProgress.strokeColor = [UIColor redColor];
    [self.view addSubview:_ballProgress];
    
    _circleProgress = [[ZXYCircleProgress alloc] initWithFrame:CGRectMake(10, 467, 150, 150) progress:0.5];
    _circleProgress.bottomWidth = 20;
    _circleProgress.bottomColor = [UIColor redColor];
    _circleProgress.topWidth = 5;
    _circleProgress.topColor = [UIColor yellowColor];
    [self.view addSubview:_circleProgress];
    
    _waveProgress = [[ZXYWaveProgress alloc] initWithFrame:CGRectMake(215, 467, 150, 150) progress:0.5];
    _waveProgress.fillColor = [UIColor redColor];
    _waveProgress.strokeColor = [UIColor blackColor];
    [self.view addSubview:_waveProgress];
    
    
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 20, self.view.bounds.size.width - 40, 30)];
    _slider.minimumValue = 0;
    _slider.maximumValue = 1;
    _slider.value = _sectorProgress.progress;
    [_slider addTarget:self action:@selector(changeProgress:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
}

- (void)changeProgress:(UISlider *)sender {
    
    _sectorProgress.progress = (sender.value - sender.minimumValue) / (sender.maximumValue - sender.minimumValue);
    _ballProgress.progress = (sender.value - sender.minimumValue) / (sender.maximumValue - sender.minimumValue);
    _circleProgress.progress = (sender.value - sender.minimumValue) / (sender.maximumValue - sender.minimumValue);
    _waveProgress.progress = (sender.value - sender.minimumValue) / (sender.maximumValue - sender.minimumValue);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
