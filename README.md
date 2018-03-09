
#### 长话短说

之前看到casa的一篇文章[一种基于ResponderChain的对象交互方式](https://casatwy.com/responder_chain_communication.html),有一种眼前一亮的感觉。在一般的场景，casa的方案都可以处理，省掉不少代码。但是`[self nextResponder]`注定只能让数据向下传递，在实际的项目中，我们点击底层的视图，需要上层的视图作出反应，于是参考casa的方案做了优化。

#### 优化

优化的方案是基于ResponderChain改为ViewChain传递数据。`viewController.view` 永远都是视图的根视图，从`viewController.view`开始向子视图传递数据。

#### 主要方法
```
	 @interface UIView (RouterEvent)
	
	/**
	 分发事件给所有的子类视图链
	
	 @param eventName 事件名字 统一使用 kREKFor+文件名标志+事件标志，例如‘BXLMerchantProducView.m’ 里productCell的点击事件，eventName可以为 kREKForMerchantProducViewClickProduct；
	 
	 @param params 附带的参数
	 */
	- (void)routerEvent:(NSString *)eventName params:(id)params;
	
	@end
```
DView向BView发送事件的时候

```
	UIView *targetView = [self.topVC.view routerEvent:kREKForBViewCallRousi params:@"夹克：哦，肉丝，你在哪？"];

```

```
	@interface UIResponder (RouterEvent)
	
	/**
	 UIResponder类重写该方法，可以获取视图链上分发的所有事件 见 ‘UIView+RouterEvent’文件
	
	 @param eventName 事件名字
	 @param params 事件参数
	 */
	- (void)observeEvent:(NSString *)eventName params:(id)params;
	
	@end
```

BView 接受DView的数据

	
```
	- (BOOL)observeEvent:(NSString *)eventName params:(id)params {
	    if ([eventName isEqualToString:kREKForBViewCallRousi]) {
	        NSLog(@"%@",params);
	        NSLog(@"肉丝:哦，夹克，我在BView");
	        return YES;
	    }
	    return NO;
	}
```
	
	

#### 结束

该方案在我用在了公司项目的商家首页，明显节省了很多代码,没有用到一个delegate来传输数据，感觉清爽了很多。在使用过程中注意判断`params`数据类型是否是你想要的数据类型。

#### 项目地址
[GayHub](https://github.com/LevenWin/RouterEvent)
<br>
欢迎star
