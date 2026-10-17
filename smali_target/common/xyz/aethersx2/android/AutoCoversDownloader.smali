.class public Lxyz/aethersx2/android/AutoCoversDownloader;
.super Ljava/lang/Object;
.source "AutoCoversDownloader.java"


# static fields
.field public static final DEFAULT_COVER_URLS:[Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "AutoCovers"


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 11
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "https://art.gametdb.com/ps2/cover/US/${serial}.jpg"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "https://art.gametdb.com/ps2/cover/EN/${serial}.jpg"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "https://art.gametdb.com/ps2/cover/JA/${serial}.jpg"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "https://art.gametdb.com/ps2/cover/KO/${serial}.jpg"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "https://raw.githubusercontent.com/libretro-thumbnails/Sony_-_PlayStation_2/master/Named_Boxarts/${title}.png"

    aput-object v2, v0, v1

    sput-object v0, Lxyz/aethersx2/android/AutoCoversDownloader;->DEFAULT_COVER_URLS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static startAutoDownload(Landroid/content/Context;)V
    .registers 1

    # shortcut: background downloadCovers aborts native JNI due to null progress dialog, manual menu download covers works
    return-void
.end method
