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
    .registers 3

    .line 20
    if-nez p0, :cond_3

    return-void

    .line 22
    :cond_3
    :try_start_3
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 23
    const-string v0, "UI/AutoDownloadCovers"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    .line 24
    if-nez p0, :cond_11

    return-void

    .line 26
    :cond_11
    new-instance p0, Lxyz/aethersx2/android/AutoCoversDownloader$1;

    invoke-direct {p0}, Lxyz/aethersx2/android/AutoCoversDownloader$1;-><init>()V

    invoke-static {p0}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_1a

    .line 39
    goto :goto_22

    .line 37
    :catchall_1a
    move-exception p0

    .line 38
    const-string v0, "AutoCovers"

    const-string v1, "startAutoDownload error"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 40
    :goto_22
    return-void
.end method
