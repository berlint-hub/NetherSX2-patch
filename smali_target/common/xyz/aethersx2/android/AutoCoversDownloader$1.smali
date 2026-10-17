.class Lxyz/aethersx2/android/AutoCoversDownloader$1;
.super Ljava/lang/Object;
.source "AutoCoversDownloader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lxyz/aethersx2/android/AutoCoversDownloader;->startAutoDownload(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 30
    const-string v0, "AutoCovers"

    :try_start_2
    const-string v1, "Starting automatic background cover download..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    sget-object v1, Lxyz/aethersx2/android/AutoCoversDownloader;->DEFAULT_COVER_URLS:[Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lxyz/aethersx2/android/NativeLibrary;->downloadCovers([Ljava/lang/String;Lxyz/aethersx2/android/AndroidProgressCallback;)V
    :try_end_d
    .catchall {:try_start_2 .. :try_end_d} :catchall_e

    .line 34
    goto :goto_14

    .line 32
    :catchall_e
    move-exception v1

    .line 33
    const-string v2, "Cover download error"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 35
    :goto_14
    return-void
.end method
