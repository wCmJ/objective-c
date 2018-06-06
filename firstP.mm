NSArray<NSRunningApplication *> *mail = [NSRunningApplication runningApplicationsWithBundleIdentifier:@"yourBundleIdentifier"];
//yourBundleIdentifier is in your Info.plist file.
dispatch_source_t source;
for(NSRunningApplication *app in mail)
{
    pid_t const pid = app.processIdentifier;]
    
    __block int result = 1;
    
    source = dispatch_source_create(DISPATCH_SOURCE_TYPE_PROC, pid, DISPATCH_PROC_EXIT, DISPATCH_TARGET_QUEUE_DEFAULT);
    
    dispatch_source_set_event_handle(source, ^(){
        result = 2;    
    });
    return result;
}
