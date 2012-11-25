#import "Configuration.h"
#import "dump.h"
#import "scinfo.h"
#include <sys/types.h>
#include <sys/sysctl.h>
#import <sys/stat.h>
#import <utime.h>
#import "out.h"

int overdrive_enabled;

#define FAT_CIGAM 0xbebafeca
#define MH_MAGIC 0xfeedface

#define CLUTCH_VERSION "Clutch 1.2.4"

#define ARMV6 6
#define ARMV7 9

NSString * crack_application(NSString *application_basedir, NSString *basename);
NSString * init_crack_binary(NSString *application_basedir, NSString *bdir, NSString *workingDir, NSDictionary *infoplist);
NSString * crack_binary(NSString *binaryPath, NSString *finalPath, NSString **error);
NSString * genRandStringLength(int len);
int get_local_arch();

struct fat_arch {
	uint32_t cputype;
	uint32_t cpusubtype;
	uint32_t offset;
	uint32_t size;
	uint32_t align;
};