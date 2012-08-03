#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
+ (classname *)sharedInstance \
{ \
static dispatch_once_t once; \
static classname *sharedInstance; \
dispatch_once(&once, ^ { sharedInstance = [[classname alloc] init]; }); \
return sharedInstance; \
}