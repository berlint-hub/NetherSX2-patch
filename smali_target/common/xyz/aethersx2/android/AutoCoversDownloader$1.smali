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
    .registers 1

    # shortcut: background downloadCovers aborted native JNI due to null progress dialog, manual menu download covers works
    return-void
.end method
