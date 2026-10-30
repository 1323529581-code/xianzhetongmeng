#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <dlfcn.h>

static NSString * const kKeyActiveCode = @"ActiveAuthCode";
static NSString * const kKeyActiveDevice = @"ActiveAuthDevice";
static NSString * const kKeyActivationTime = @"ActiveAuthTime";
static NSString * const kKeyCodeType = @"ActiveCodeType";

static NSArray *getAuthDatabase() {
    static NSArray *database = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        database = @[
            // ===== 贤者同盟 日卡 (100) =====
            @{@"code": @"DAY-0IXR4-TTCWW", @"type": @"日卡"}, @{@"code": @"DAY-1AVXW-WA61S", @"type": @"日卡"}, @{@"code": @"DAY-1KL0J-QPGZJ", @"type": @"日卡"}, @{@"code": @"DAY-1NZPN-V39WQ", @"type": @"日卡"}, @{@"code": @"DAY-228NJ-R08CE", @"type": @"日卡"}, @{@"code": @"DAY-28EG0-UOQ1G", @"type": @"日卡"}, @{@"code": @"DAY-2EYQF-Q0CEB", @"type": @"日卡"}, @{@"code": @"DAY-2Q70Z-7NX60", @"type": @"日卡"}, @{@"code": @"DAY-2SUFM-YOS0X", @"type": @"日卡"}, @{@"code": @"DAY-36MR0-HRO4R", @"type": @"日卡"},
            @{@"code": @"DAY-3ALUP-07N3L", @"type": @"日卡"}, @{@"code": @"DAY-3KEDI-C31ES", @"type": @"日卡"}, @{@"code": @"DAY-3Z18M-1NSN7", @"type": @"日卡"}, @{@"code": @"DAY-4A8XK-BJV7G", @"type": @"日卡"}, @{@"code": @"DAY-56IO1-H98LQ", @"type": @"日卡"}, @{@"code": @"DAY-598FS-DO7QO", @"type": @"日卡"}, @{@"code": @"DAY-5YOVH-70GUB", @"type": @"日卡"}, @{@"code": @"DAY-610HK-PIJBO", @"type": @"日卡"}, @{@"code": @"DAY-8SDL0-NDZ4V", @"type": @"日卡"}, @{@"code": @"DAY-8WDA3-PPEQ6", @"type": @"日卡"},
            @{@"code": @"DAY-93EB1-XDK3B", @"type": @"日卡"}, @{@"code": @"DAY-96NX6-N1JBH", @"type": @"日卡"}, @{@"code": @"DAY-98RR4-3HB4I", @"type": @"日卡"}, @{@"code": @"DAY-9K3PF-JOTJB", @"type": @"日卡"}, @{@"code": @"DAY-9MI78-LEIA6", @"type": @"日卡"}, @{@"code": @"DAY-AAB5P-5D61G", @"type": @"日卡"}, @{@"code": @"DAY-BD3LA-X3ES6", @"type": @"日卡"}, @{@"code": @"DAY-CNYR6-N8WQN", @"type": @"日卡"}, @{@"code": @"DAY-DDN10-ISW6B", @"type": @"日卡"}, @{@"code": @"DAY-DJHLB-DVW0O", @"type": @"日卡"},
            @{@"code": @"DAY-E7UFC-AT1M4", @"type": @"日卡"}, @{@"code": @"DAY-FJVOB-R0HZA", @"type": @"日卡"}, @{@"code": @"DAY-FR2LB-J7ODG", @"type": @"日卡"}, @{@"code": @"DAY-FZAXU-DTPTO", @"type": @"日卡"}, @{@"code": @"DAY-G9PY0-I19W0", @"type": @"日卡"}, @{@"code": @"DAY-GV6OS-4V2WB", @"type": @"日卡"}, @{@"code": @"DAY-H5SXA-QTL7Q", @"type": @"日卡"}, @{@"code": @"DAY-HLRN6-Q44N1", @"type": @"日卡"}, @{@"code": @"DAY-HPR1X-BS0R2", @"type": @"日卡"}, @{@"code": @"DAY-I3XB6-4L1WO", @"type": @"日卡"},
            @{@"code": @"DAY-IHLL7-P5UJH", @"type": @"日卡"}, @{@"code": @"DAY-IQWBF-58Z3H", @"type": @"日卡"}, @{@"code": @"DAY-IR7DB-ZSTF8", @"type": @"日卡"}, @{@"code": @"DAY-IZ3LN-LLHIG", @"type": @"日卡"}, @{@"code": @"DAY-JEZQ5-6NTCS", @"type": @"日卡"}, @{@"code": @"DAY-JOBKG-G1BJZ", @"type": @"日卡"}, @{@"code": @"DAY-JWXUQ-9WZ9X", @"type": @"日卡"}, @{@"code": @"DAY-JYFVS-DR4X1", @"type": @"日卡"}, @{@"code": @"DAY-K28RJ-M0UAQ", @"type": @"日卡"}, @{@"code": @"DAY-KDHGQ-S212B", @"type": @"日卡"},
            @{@"code": @"DAY-KO8L9-80E99", @"type": @"日卡"}, @{@"code": @"DAY-KRIRH-DHVOL", @"type": @"日卡"}, @{@"code": @"DAY-KYVQY-193Q6", @"type": @"日卡"}, @{@"code": @"DAY-LF99Z-W9QUK", @"type": @"日卡"}, @{@"code": @"DAY-M4SKB-AAPH4", @"type": @"日卡"}, @{@"code": @"DAY-M71Z2-AYK1A", @"type": @"日卡"}, @{@"code": @"DAY-MPAIE-TB9D4", @"type": @"日卡"}, @{@"code": @"DAY-MQ8YY-BTHCD", @"type": @"日卡"}, @{@"code": @"DAY-MU594-0AGSS", @"type": @"日卡"}, @{@"code": @"DAY-N0ZIV-ZNVAA", @"type": @"日卡"},
            @{@"code": @"DAY-N6NJS-Y5298", @"type": @"日卡"}, @{@"code": @"DAY-NAJ5W-68DM4", @"type": @"日卡"}, @{@"code": @"DAY-ONIND-8MNMF", @"type": @"日卡"}, @{@"code": @"DAY-OO0QI-6WONU", @"type": @"日卡"}, @{@"code": @"DAY-OWRVI-FMQHB", @"type": @"日卡"}, @{@"code": @"DAY-P62EK-5E1JN", @"type": @"日卡"}, @{@"code": @"DAY-P7FN2-EXY4S", @"type": @"日卡"}, @{@"code": @"DAY-P9TM6-G0QW6", @"type": @"日卡"}, @{@"code": @"DAY-PF060-3HNEX", @"type": @"日卡"}, @{@"code": @"DAY-PTM2T-0VZQJ", @"type": @"日卡"},
            @{@"code": @"DAY-PVBB2-2V604", @"type": @"日卡"}, @{@"code": @"DAY-PWJUG-N4WCV", @"type": @"日卡"}, @{@"code": @"DAY-PX1EB-YFFNP", @"type": @"日卡"}, @{@"code": @"DAY-Q6JMY-LJBLB", @"type": @"日卡"}, @{@"code": @"DAY-RS9T1-GFZDV", @"type": @"日卡"}, @{@"code": @"DAY-T2WHD-87HAO", @"type": @"日卡"}, @{@"code": @"DAY-T36Z9-K0B59", @"type": @"日卡"}, @{@"code": @"DAY-TBKF4-GG90F", @"type": @"日卡"}, @{@"code": @"DAY-U2A68-JQLC4", @"type": @"日卡"}, @{@"code": @"DAY-U7XZM-W7QL8", @"type": @"日卡"},
            @{@"code": @"DAY-UJ1HK-AVEXW", @"type": @"日卡"}, @{@"code": @"DAY-UKBX3-UR5PD", @"type": @"日卡"}, @{@"code": @"DAY-UOQ97-5HFQV", @"type": @"日卡"}, @{@"code": @"DAY-UOZ39-3BLPM", @"type": @"日卡"}, @{@"code": @"DAY-UTW0C-GHTOT", @"type": @"日卡"}, @{@"code": @"DAY-V8AOR-6T18W", @"type": @"日卡"}, @{@"code": @"DAY-VEYOW-QK2MI", @"type": @"日卡"}, @{@"code": @"DAY-VLCH0-N6K3J", @"type": @"日卡"}, @{@"code": @"DAY-VQQV7-WFOS6", @"type": @"日卡"}, @{@"code": @"DAY-WCPEX-ALSQE", @"type": @"日卡"},
            @{@"code": @"DAY-WZRX7-YJRCK", @"type": @"日卡"}, @{@"code": @"DAY-X0JDW-4II9L", @"type": @"日卡"}, @{@"code": @"DAY-XQXIM-SMM1M", @"type": @"日卡"}, @{@"code": @"DAY-Y7POR-WQW8S", @"type": @"日卡"}, @{@"code": @"DAY-YG8VN-EZIJG", @"type": @"日卡"}, @{@"code": @"DAY-Z4MPI-TGJ5F", @"type": @"日卡"}, @{@"code": @"DAY-Z8TVT-1WTVB", @"type": @"日卡"}, @{@"code": @"DAY-ZHES2-SKL5Q", @"type": @"日卡"}, @{@"code": @"DAY-ZIMVU-GCQTH", @"type": @"日卡"}, @{@"code": @"DAY-ZQBU9-3CTCV", @"type": @"日卡"},

            // ===== 贤者同盟 月卡 (100) =====
            @{@"code": @"MON-0LOUA-DC8UW", @"type": @"月卡"}, @{@"code": @"MON-1BOO2-70QBG", @"type": @"月卡"}, @{@"code": @"MON-1M4D3-HOC8Z", @"type": @"月卡"}, @{@"code": @"MON-1MDSD-2WX22", @"type": @"月卡"}, @{@"code": @"MON-1TBPP-LTIT0", @"type": @"月卡"}, @{@"code": @"MON-1ZWFJ-46F6U", @"type": @"月卡"}, @{@"code": @"MON-278YB-W2WM5", @"type": @"月卡"}, @{@"code": @"MON-39H2A-7CX37", @"type": @"月卡"}, @{@"code": @"MON-3EO37-K449H", @"type": @"月卡"}, @{@"code": @"MON-4D9Y2-RJVSG", @"type": @"月卡"},
            @{@"code": @"MON-4HBCV-58WN4", @"type": @"月卡"}, @{@"code": @"MON-585E6-Q1XP1", @"type": @"月卡"}, @{@"code": @"MON-5AW0B-G392V", @"type": @"月卡"}, @{@"code": @"MON-5E2GC-P9IOB", @"type": @"月卡"}, @{@"code": @"MON-5F7LM-4GCMU", @"type": @"月卡"}, @{@"code": @"MON-5FSDO-ZYYKK", @"type": @"月卡"}, @{@"code": @"MON-5H56S-C18X2", @"type": @"月卡"}, @{@"code": @"MON-5O4QH-9SK4V", @"type": @"月卡"}, @{@"code": @"MON-64SFW-VYUPG", @"type": @"月卡"}, @{@"code": @"MON-65H5A-YPOEN", @"type": @"月卡"},
            @{@"code": @"MON-6JAXQ-R4ZRD", @"type": @"月卡"}, @{@"code": @"MON-7LM54-VXGXC", @"type": @"月卡"}, @{@"code": @"MON-7LVU2-J0L00", @"type": @"月卡"}, @{@"code": @"MON-8UHRT-4WX3O", @"type": @"月卡"}, @{@"code": @"MON-91K7W-OAI6A", @"type": @"月卡"}, @{@"code": @"MON-9BQEF-9D09F", @"type": @"月卡"}, @{@"code": @"MON-9R66K-98QQ3", @"type": @"月卡"}, @{@"code": @"MON-9RHB6-88OMK", @"type": @"月卡"}, @{@"code": @"MON-9RIA5-6FC1Y", @"type": @"月卡"}, @{@"code": @"MON-A2G7Y-5Z792", @"type": @"月卡"},
            @{@"code": @"MON-ACGSU-0W90B", @"type": @"月卡"}, @{@"code": @"MON-AK2XQ-P2OCI", @"type": @"月卡"}, @{@"code": @"MON-B20EM-O6E57", @"type": @"月卡"}, @{@"code": @"MON-B9NX6-IBLV8", @"type": @"月卡"}, @{@"code": @"MON-C06DE-5CCJD", @"type": @"月卡"}, @{@"code": @"MON-C0K7P-D7APO", @"type": @"月卡"}, @{@"code": @"MON-C9JYZ-DAU1F", @"type": @"月卡"}, @{@"code": @"MON-CJ8V3-RPYJD", @"type": @"月卡"}, @{@"code": @"MON-CT49T-DIH7Y", @"type": @"月卡"}, @{@"code": @"MON-CYG1S-0ZX28", @"type": @"月卡"},
            @{@"code": @"MON-CZ2JV-CNILY", @"type": @"月卡"}, @{@"code": @"MON-D67Q3-ALW17", @"type": @"月卡"}, @{@"code": @"MON-ES21Q-V7SWV", @"type": @"月卡"}, @{@"code": @"MON-EUGL6-KFV71", @"type": @"月卡"}, @{@"code": @"MON-FH1FA-DGVOH", @"type": @"月卡"}, @{@"code": @"MON-FI17C-CFQ15", @"type": @"月卡"}, @{@"code": @"MON-H6NIL-7QSJO", @"type": @"月卡"}, @{@"code": @"MON-H7SF8-YSO9Y", @"type": @"月卡"}, @{@"code": @"MON-I2EJ3-4B94T", @"type": @"月卡"}, @{@"code": @"MON-ITXB6-PPUZA", @"type": @"月卡"},
            @{@"code": @"MON-J614B-A4N3D", @"type": @"月卡"}, @{@"code": @"MON-JHWYD-NBXAM", @"type": @"月卡"}, @{@"code": @"MON-JKDJ1-ORGI4", @"type": @"月卡"}, @{@"code": @"MON-JOY17-38ENG", @"type": @"月卡"}, @{@"code": @"MON-K54T1-HBP8C", @"type": @"月卡"}, @{@"code": @"MON-KAYLM-EDO3Q", @"type": @"月卡"}, @{@"code": @"MON-KXJCC-QJOE9", @"type": @"月卡"}, @{@"code": @"MON-LI52Q-Q1RYW", @"type": @"月卡"}, @{@"code": @"MON-MUFV4-0IK1P", @"type": @"月卡"}, @{@"code": @"MON-N03VW-N55AM", @"type": @"月卡"},
            @{@"code": @"MON-N7QYY-VNF5N", @"type": @"月卡"}, @{@"code": @"MON-NA200-X39MK", @"type": @"月卡"}, @{@"code": @"MON-NFCV6-TWEAI", @"type": @"月卡"}, @{@"code": @"MON-NUB62-EBN9K", @"type": @"月卡"}, @{@"code": @"MON-NUH52-Y4LT6", @"type": @"月卡"}, @{@"code": @"MON-NVF67-TRFG4", @"type": @"月卡"}, @{@"code": @"MON-NY79H-731TC", @"type": @"月卡"}, @{@"code": @"MON-O5OKR-RHMT8", @"type": @"月卡"}, @{@"code": @"MON-O6Q1P-O61VW", @"type": @"月卡"}, @{@"code": @"MON-O9ACB-5C4H0", @"type": @"月卡"},
            @{@"code": @"MON-OS865-W969K", @"type": @"月卡"}, @{@"code": @"MON-OSQVN-Y05QS", @"type": @"月卡"}, @{@"code": @"MON-OSW4M-XGP0F", @"type": @"月卡"}, @{@"code": @"MON-PRTU1-JOC98", @"type": @"月卡"}, @{@"code": @"MON-PTQ41-FUCFH", @"type": @"月卡"}, @{@"code": @"MON-Q8ZRJ-H1S30", @"type": @"月卡"}, @{@"code": @"MON-R115M-NVFG7", @"type": @"月卡"}, @{@"code": @"MON-R27WP-AM7QX", @"type": @"月卡"}, @{@"code": @"MON-REPVD-OMIDN", @"type": @"月卡"}, @{@"code": @"MON-RWHWN-XNU97", @"type": @"月卡"},
            @{@"code": @"MON-S1YF6-DAK0W", @"type": @"月卡"}, @{@"code": @"MON-SZU1T-Q9SA7", @"type": @"月卡"}, @{@"code": @"MON-T6DNP-JNCSF", @"type": @"月卡"}, @{@"code": @"MON-T91KC-ILDVL", @"type": @"月卡"}, @{@"code": @"MON-TT9D8-3FUO9", @"type": @"月卡"}, @{@"code": @"MON-U0E0F-TYIL7", @"type": @"月卡"}, @{@"code": @"MON-U9SOT-1KS5V", @"type": @"月卡"}, @{@"code": @"MON-V8AM9-HHNGY", @"type": @"月卡"}, @{@"code": @"MON-VA3ZV-Z9083", @"type": @"月卡"}, @{@"code": @"MON-VQ725-QQZMC", @"type": @"月卡"},
            @{@"code": @"MON-VWD60-7UFO8", @"type": @"月卡"}, @{@"code": @"MON-W4XEW-IKR0Z", @"type": @"月卡"}, @{@"code": @"MON-WSCTM-9ZTWS", @"type": @"月卡"}, @{@"code": @"MON-X6UKT-U8HGT", @"type": @"月卡"}, @{@"code": @"MON-XVMF2-5CX3I", @"type": @"月卡"}, @{@"code": @"MON-Y8SE8-IRDBJ", @"type": @"月卡"}, @{@"code": @"MON-YBJAY-A0XH8", @"type": @"月卡"}, @{@"code": @"MON-Z7E80-WX5U4", @"type": @"月卡"}, @{@"code": @"MON-ZE21N-RQB4H", @"type": @"月卡"}, @{@"code": @"MON-ZPJT1-6GC1M", @"type": @"月卡"},

            // ===== 贤者同盟 永久卡 (100) =====
            @{@"code": @"PER-0I1M2-7KKUL", @"type": @"永久卡"}, @{@"code": @"PER-0RPYT-VSSVR", @"type": @"永久卡"}, @{@"code": @"PER-184E0-HXEBG", @"type": @"永久卡"}, @{@"code": @"PER-1VY75-RBZ71", @"type": @"永久卡"}, @{@"code": @"PER-1XOZY-YR6UJ", @"type": @"永久卡"}, @{@"code": @"PER-2CMVV-FIM4M", @"type": @"永久卡"}, @{@"code": @"PER-2I8LE-TLRU8", @"type": @"永久卡"}, @{@"code": @"PER-2MSCP-MWJ1T", @"type": @"永久卡"}, @{@"code": @"PER-2OHD2-OGJLW", @"type": @"永久卡"}, @{@"code": @"PER-2T6KH-BUH6G", @"type": @"永久卡"},
            @{@"code": @"PER-3037O-YEA3F", @"type": @"永久卡"}, @{@"code": @"PER-337XU-G8DF7", @"type": @"永久卡"}, @{@"code": @"PER-36A6M-DEYH7", @"type": @"永久卡"}, @{@"code": @"PER-3BWZ8-TEU4H", @"type": @"永久卡"}, @{@"code": @"PER-4D779-RPSHE", @"type": @"永久卡"}, @{@"code": @"PER-5J920-B1W0L", @"type": @"永久卡"}, @{@"code": @"PER-5NURD-WJOBK", @"type": @"永久卡"}, @{@"code": @"PER-6A7AU-Y7NAN", @"type": @"永久卡"}, @{@"code": @"PER-6JTG5-66LLN", @"type": @"永久卡"}, @{@"code": @"PER-6T6E9-QQGTV", @"type": @"永久卡"},
            @{@"code": @"PER-7PMZ3-PDSKB", @"type": @"永久卡"}, @{@"code": @"PER-7ZXWZ-R9W81", @"type": @"永久卡"}, @{@"code": @"PER-83N58-JLIN5", @"type": @"永久卡"}, @{@"code": @"PER-8YLXQ-VTWJJ", @"type": @"永久卡"}, @{@"code": @"PER-8ZJZZ-EL52M", @"type": @"永久卡"}, @{@"code": @"PER-957Q4-F1CXB", @"type": @"永久卡"}, @{@"code": @"PER-9M6Y3-8AA3Z", @"type": @"永久卡"}, @{@"code": @"PER-9P797-JS1WL", @"type": @"永久卡"}, @{@"code": @"PER-AKVC1-TUL9A", @"type": @"永久卡"}, @{@"code": @"PER-ATLPD-SFX5O", @"type": @"永久卡"},
            @{@"code": @"PER-AXDYB-69W7M", @"type": @"永久卡"}, @{@"code": @"PER-BMNTM-WLFVR", @"type": @"永久卡"}, @{@"code": @"PER-BNRRL-R3Q7E", @"type": @"永久卡"}, @{@"code": @"PER-BZWS6-J4UY2", @"type": @"永久卡"}, @{@"code": @"PER-C2X4S-QMRWP", @"type": @"永久卡"}, @{@"code": @"PER-CA2IZ-ZKWSB", @"type": @"永久卡"}, @{@"code": @"PER-CDSDZ-II3BR", @"type": @"永久卡"}, @{@"code": @"PER-DB9EJ-3NJYQ", @"type": @"永久卡"}, @{@"code": @"PER-DLK5C-DEVDN", @"type": @"永久卡"}, @{@"code": @"PER-DQOVG-XTZ9Z", @"type": @"永久卡"},
            @{@"code": @"PER-DR54I-YK0DK", @"type": @"永久卡"}, @{@"code": @"PER-E05K5-5DG47", @"type": @"永久卡"}, @{@"code": @"PER-E2OKF-DZ68C", @"type": @"永久卡"}, @{@"code": @"PER-E77GT-LVTV6", @"type": @"永久卡"}, @{@"code": @"PER-FGFQ7-Z7AUX", @"type": @"永久卡"}, @{@"code": @"PER-G06KD-64UTX", @"type": @"永久卡"}, @{@"code": @"PER-G38NW-8XBE0", @"type": @"永久卡"}, @{@"code": @"PER-GGN46-LMSUA", @"type": @"永久卡"}, @{@"code": @"PER-GVFE0-STJTX", @"type": @"永久卡"}, @{@"code": @"PER-GZ9SV-4RZVN", @"type": @"永久卡"},
            @{@"code": @"PER-H2NGN-QOWII", @"type": @"永久卡"}, @{@"code": @"PER-H7UIC-TXM74", @"type": @"永久卡"}, @{@"code": @"PER-HAWJJ-S8U44", @"type": @"永久卡"}, @{@"code": @"PER-IA148-6SC5I", @"type": @"永久卡"}, @{@"code": @"PER-ICHZX-BEHBQ", @"type": @"永久卡"}, @{@"code": @"PER-IPVJ0-GX5ZW", @"type": @"永久卡"}, @{@"code": @"PER-IYLUZ-4PIEW", @"type": @"永久卡"}, @{@"code": @"PER-JZ62M-19K5D", @"type": @"永久卡"}, @{@"code": @"PER-K2ZH7-M8UA3", @"type": @"永久卡"}, @{@"code": @"PER-K39IJ-46OT6", @"type": @"永久卡"},
            @{@"code": @"PER-KEVGR-J4YCC", @"type": @"永久卡"}, @{@"code": @"PER-KHX5I-U6TQR", @"type": @"永久卡"}, @{@"code": @"PER-LM1JJ-XU2XG", @"type": @"永久卡"}, @{@"code": @"PER-MKW2B-E7X85", @"type": @"永久卡"}, @{@"code": @"PER-MZ8KW-ZZY5M", @"type": @"永久卡"}, @{@"code": @"PER-NA76D-T3KQC", @"type": @"永久卡"}, @{@"code": @"PER-O037A-0NZR9", @"type": @"永久卡"}, @{@"code": @"PER-OKARF-FR6D4", @"type": @"永久卡"}, @{@"code": @"PER-OQBZZ-D2KCT", @"type": @"永久卡"}, @{@"code": @"PER-PH82L-133WM", @"type": @"永久卡"},
            @{@"code": @"PER-POEPX-ZMGFX", @"type": @"永久卡"}, @{@"code": @"PER-PZN4X-WZLVO", @"type": @"永久卡"}, @{@"code": @"PER-QCJ5V-U9GWA", @"type": @"永久卡"}, @{@"code": @"PER-QW7U1-UMM3A", @"type": @"永久卡"}, @{@"code": @"PER-R1VPV-2EE51", @"type": @"永久卡"}, @{@"code": @"PER-RCPFJ-BI37J", @"type": @"永久卡"}, @{@"code": @"PER-S4L7Q-7MFVG", @"type": @"永久卡"}, @{@"code": @"PER-SUP4W-2FWFA", @"type": @"永久卡"}, @{@"code": @"PER-TB7CD-W2LUS", @"type": @"永久卡"}, @{@"code": @"PER-TM81U-KHD3Z", @"type": @"永久卡"},
            @{@"code": @"PER-TPO60-QEBO3", @"type": @"永久卡"}, @{@"code": @"PER-TQ7P9-YJS53", @"type": @"永久卡"}, @{@"code": @"PER-TYOJS-M65YV", @"type": @"永久卡"}, @{@"code": @"PER-U4DLV-WB0IR", @"type": @"永久卡"}, @{@"code": @"PER-UB7HP-RDE8N", @"type": @"永久卡"}, @{@"code": @"PER-UDWLJ-T2U89", @"type": @"永久卡"}, @{@"code": @"PER-UFVLF-3F6GZ", @"type": @"永久卡"}, @{@"code": @"PER-VKGOT-79BVU", @"type": @"永久卡"}, @{@"code": @"PER-VTTAC-ZC7DR", @"type": @"永久卡"}, @{@"code": @"PER-VXVYP-2AS2A", @"type": @"永久卡"},
            @{@"code": @"PER-WJ2NC-L371Z", @"type": @"永久卡"}, @{@"code": @"PER-WSGS9-233G1", @"type": @"永久卡"}, @{@"code": @"PER-XBGB3-X2DFU", @"type": @"永久卡"}, @{@"code": @"PER-XYS09-T6Q8O", @"type": @"永久卡"}, @{@"code": @"PER-Y8F20-TCADM", @"type": @"永久卡"}, @{@"code": @"PER-YI3M0-BJPAV", @"type": @"永久卡"}, @{@"code": @"PER-YOUTM-CE381", @"type": @"永久卡"}, @{@"code": @"PER-YXRU8-OZ6HF", @"type": @"永久卡"}, @{@"code": @"PER-ZPIY0-KR4XK", @"type": @"永久卡"}, @{@"code": @"PER-ZSRZB-4RLC7", @"type": @"永久卡"}
        ];
    });
    return database;
}

@interface AuthManager : NSObject
+ (instancetype)sharedInstance;
- (void)checkAndLoad;
@end

@implementation AuthManager

+ (instancetype)sharedInstance {
    static AuthManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ instance = [[AuthManager alloc] init]; });
    return instance;
}

- (void)checkAndLoad {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *activeCode = [defaults objectForKey:kKeyActiveCode];
    NSString *activeDevice = [defaults objectForKey:kKeyActiveDevice];
    NSTimeInterval activationTime = [defaults doubleForKey:kKeyActivationTime];
    NSString *codeType = [defaults objectForKey:kKeyCodeType];
    
    NSString *currentDevice = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    BOOL isValid = NO;
    
    if (activeCode && [activeDevice isEqualToString:currentDevice]) {
        NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
        NSTimeInterval elapsed = now - activationTime;
        if ([codeType isEqualToString:@"永久卡"]) isValid = YES;
        else if ([codeType isEqualToString:@"日卡"]) isValid = (elapsed < 24 * 3600);
        else if ([codeType isEqualToString:@"月卡"]) isValid = (elapsed < 30 * 24 * 3600);
    }
    
    if (isValid) {
        [self loadTargetDylib];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{ [self showAuthUI]; });
    }
}

- (void)loadTargetDylib {
    // 因为这次不需要处理黑屏，直接加载原名插件即可
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *dylibPath = [bundlePath stringByAppendingPathComponent:@"Frameworks/libAllianceSages.dylib"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dylibPath]) { 
        NSLog(@"[Auth] 找不到目标: %@", dylibPath);
        return; 
    }
    dlopen([dylibPath UTF8String], RTLD_NOW);
}

- (void)showAuthUI {
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    if (!rootVC) return;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"授权验证" message:@"请输入您的激活码以启动游戏" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) { textField.placeholder = @"粘贴或输入激活码"; }];
    
    UIAlertAction *activateAction = [UIAlertAction actionWithTitle:@"激活" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { 
        [self verifyCode:alert.textFields.firstObject.text]; 
    }];
    
    UIAlertAction *exitAction = [UIAlertAction actionWithTitle:@"退出游戏" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) { 
        exit(0); 
    }];
    
    [alert addAction:activateAction];
    [alert addAction:exitAction];
    [rootVC presentViewController:alert animated:YES completion:nil];
}

- (void)verifyCode:(NSString *)code {
    NSArray *codesArray = getAuthDatabase();
    BOOL codeFound = NO;
    NSString *cardType = nil;
    NSString *cleanCode = [[code stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    for (NSDictionary *dict in codesArray) {
        if ([dict[@"code"] isEqualToString:cleanCode]) { codeFound = YES; cardType = dict[@"type"]; break; }
    }
    
    if (!codeFound) { 
        [self showErrorAndKill:@"激活码无效，请检查输入"]; 
        return; 
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *savedDevice = [defaults objectForKey:[NSString stringWithFormat:@"Device_%@", cleanCode]];
    NSString *currentDevice = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    if (savedDevice && ![savedDevice isEqualToString:currentDevice]) { 
        [self showErrorAndKill:@"该激活码已在其他设备绑定，无法跨设备使用"]; 
        return; 
    }
    
    [defaults setObject:cleanCode forKey:kKeyActiveCode];
    [defaults setObject:currentDevice forKey:kKeyActiveDevice];
    [defaults setObject:@([[NSDate date] timeIntervalSince1970]) forKey:kKeyActivationTime];
    [defaults setObject:cardType forKey:kKeyCodeType];
    [defaults setObject:currentDevice forKey:[NSString stringWithFormat:@"Device_%@", cleanCode]];
    [defaults synchronize];
    
    [self loadTargetDylib];
    
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootVC dismissViewControllerAnimated:YES completion:^{ 
        UIAlertController *successAlert = [UIAlertController alertControllerWithTitle:@"成功" message:@"授权成功，祝您游戏愉快！" preferredStyle:UIAlertControllerStyleAlert];
        [successAlert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [rootVC presentViewController:successAlert animated:YES completion:nil];
    }];
}

- (void)showErrorAndKill:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
        [rootVC dismissViewControllerAnimated:YES completion:nil]; 
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"错误" message:message preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) { 
            exit(0); 
        }]];
        [rootVC presentViewController:alert animated:YES completion:nil];
    });
}

@end

__attribute__((constructor)) static void initPlugin() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[AuthManager sharedInstance] checkAndLoad];
    });
}
