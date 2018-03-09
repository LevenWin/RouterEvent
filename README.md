# Router Event

###  发送数据
 ```
 /**
 分发事件给所有的子类视图链
 @param eventName 事件名字 统一使用 kREKFor+文件名标志+事件标志，例如‘BXLMerchantProducView.m’ 里productCell的点击事件，eventName可以为 kREKForMerchantProducViewClickProduct；
 
 @param params 附带的参数
 */
- (void)routerEvent:(NSString *)eventName params:(id)params;
 ```
 
 ### 接受数据
 
 ```
 /**
 视图类重写该方法，可以获取视图链上分发的所有事件 见 ‘UIView+RouterEvent’文件
 @param eventName 事件名字
 @param params 事件参数
 */
- (void)observeEvent:(NSString *)eventName params:(id)params;

 ```
