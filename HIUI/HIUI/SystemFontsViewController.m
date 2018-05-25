//
//  SystemFontsViewController.m
//  HIUI
//
//  Created by lizhenjie on 25/05/2018.
//  Copyright © 2018 LiZhenjie. All rights reserved.
//

#import "SystemFontsViewController.h"

@interface SystemFontsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *fontsTableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation SystemFontsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"系统字体";
    [self.fontsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self gainSystemFontsData];
    [self.fontsTableView reloadData];
}

- (void)gainSystemFontsData {
    NSArray *familyNames = [UIFont familyNames];
    NSMutableArray *fonts = [NSMutableArray array];
    for (NSString *family in familyNames) {
        NSArray *names = [UIFont fontNamesForFamilyName:family];
        for (NSString *name in names) {
            [fonts addObject:name];
        }
    }
    self.dataSource = fonts;
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }
    NSString *fontName = self.dataSource[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld.%@\n例子：¥123,4567.890", indexPath.row+1, fontName];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont fontWithName:fontName size:18];
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"例子：¥23,3567.0999"];
//    cell.detailTextLabel.font = [UIFont fontWithName:fontName size:18];
    
    
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 80;
//}


@end
