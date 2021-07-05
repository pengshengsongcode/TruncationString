//
//  ViewController.m
//  demo
//
//  Created by pengshengsong on 2021/7/2.
//

#import "ViewController.h"
#import "NSString+TruncateToWidth.h"
#import "demo-Swift.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.label];
    self.label.frame = CGRectMake(100, 100, 200, 100);
    
    self.label.text = [self.label.text stringByTruncatingAtString:@"]" width:200 numberOfLines:self.label.numberOfLines font:self.label.font];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ViewController1 *vc = [[ViewController1 alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
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
