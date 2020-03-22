#include <Foundation/Foundation.h>

@interface CKConversation
+(double)_sms_maxTrimDurationForMediaType:(int)arg1 ;
+(double)_iMessage_maxTrimDurationForMediaType:(int)arg1 ;
-(double)maxTrimDurationForMediaType:(int)arg1 ;
@end

%hook CKConversation
+(double)_sms_maxTrimDurationForMediaType:(int)arg1 {
	return [%c(CKConversation) _iMessage_maxTrimDurationForMediaType:0];
}
+(double)_iMessage_maxTrimDurationForMediaType:(int)arg1 {
	return %orig(0);
}
-(double)maxTrimDurationForMediaType:(int)arg1 {
	return %orig(0);
}
%end