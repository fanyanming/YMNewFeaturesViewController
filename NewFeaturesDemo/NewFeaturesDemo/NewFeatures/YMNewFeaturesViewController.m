//
//  YMNewFeaturesViewController.m
//  NewFeaturesDemo
//
//  Created by 彦明 on 16/12/5.
//  Copyright © 2016年 Yanming. All rights reserved.
//

#import "YMNewFeaturesViewController.h"

@interface YMNewFeaturesViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, weak) UIPageControl *pageControl;
@property (nonatomic, weak) UIButton *startButton;
@property (nonatomic, weak) UIButton *passButton;
@end

@implementation YMNewFeaturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

NSString *ID_cell = @"newFeaturesCell";
- (void)setupViews {
    // collection view
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = screenBounds.size;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collecttionView = [[UICollectionView alloc] initWithFrame:screenBounds collectionViewLayout:layout];
    collecttionView.pagingEnabled = YES;
    collecttionView.delegate = self;
    collecttionView.dataSource = self;
    [collecttionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID_cell];
    [self.view addSubview:collecttionView];
    
    // page controll
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    
    pageControl.numberOfPages = _imagesArray.count;
    pageControl.currentPage = 0;
    pageControl.center = CGPointMake(screenBounds.size.width * 0.5, screenBounds.size.height - 49);
    [self.view addSubview:pageControl];
    _pageControl = pageControl;
    
    // pass button
    UIButton *passButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    passButton.layer.cornerRadius = 3;
    passButton.frame = CGRectMake(screenBounds.size.width - 75   , 30, 60, 30);
    [passButton setTitle:@"跳过" forState:(UIControlStateNormal)];
    passButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    passButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:passButton];
    _passButton = passButton;
    [passButton addTarget:self action:@selector(passButtonClicked) forControlEvents:(UIControlEventTouchUpInside)];
}

#pragma mark - delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    NSInteger index = offsetX / screenBounds.size.width;
    if (index == _imagesArray.count - 1) {
        _startButton.hidden = NO;
    }
    _pageControl.currentPage = index;
    
    //
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    NSLog(@"%f", offsetX);
     CGRect screenBounds = [UIScreen mainScreen].bounds;
    if (offsetX > (screenBounds.size.width * (_imagesArray.count - 1) + 10)) {
        [self startButtonClicked];
    }

}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _imagesArray.count - 1
        ) {
        _startButton.hidden = NO;
    }else {
        _startButton.hidden = YES;
    }
}

#pragma mark - data source methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imagesArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID_cell forIndexPath:indexPath];
    UIImageView *featureImageView = [[UIImageView alloc] init];
    featureImageView.image = [UIImage imageNamed:_imagesArray[indexPath.row]];
    cell.backgroundView = featureImageView;
    if (indexPath.row == _imagesArray.count - 1) {
        CGRect screenBounds = [UIScreen mainScreen].bounds;
        UIButton *startButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [startButton setTitle:@"开启体验" forState:(UIControlStateNormal)];
        startButton.frame = CGRectMake(0, 0, 80, 35);
        startButton.center = CGPointMake(screenBounds.size.width * 0.5, screenBounds.size.height - 100);
        startButton.titleLabel.font = [UIFont systemFontOfSize:16];
        startButton.layer.borderColor = [UIColor whiteColor].CGColor;
        startButton.layer.borderWidth = 1.0;
        startButton.layer.cornerRadius = 3.0;
        startButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        [cell.contentView addSubview:startButton];
        _startButton = startButton;
        [startButton addTarget:self action:@selector(startButtonClicked) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    return cell;
}

#pragma mark - control metheds
- (void)startButtonClicked {
    if (_startButtonDidClicked) {
        _startButtonDidClicked();
    }
}

- (void)passButtonClicked {
    if (_passButtonDidClicked) {
        _passButtonDidClicked();
    }
}

- (void)setPassButtonHidden:(BOOL)isHidden {
    _passButton.hidden = isHidden;
}
@end
