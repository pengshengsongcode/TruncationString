//
//  ViewController.m
//  demo
//
//  Created by pengshengsong on 2021/7/2.
//

#import "ViewController.h"
#import "NSString+TruncateToWidth.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.label];
    self.label.frame = CGRectMake(100, 100, 200, 100);
    
//    myLabel.text = [@"Benjamin Walker Jackson + 2 authors" stringByTruncatingAtString:@" +" toWidth:myLabel.frame.size.width withFont:myLabel.font];
    
    self.label.text = [self.label.text stringByTruncatingAtString:@"]" width:200 numberOfLines:self.label.numberOfLines font:self.label.font];
    
    
    
    
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.numberOfLines = 2;
        _label.textColor = UIColor.redColor;
        _label.backgroundColor = UIColor.greenColor;
        _label.text = @"已投稿[或刷卡缴费哈萨克家里或刷卡缴费哈萨克家里复活萨]等100个问题";
    }
    return _label;
}

@end
