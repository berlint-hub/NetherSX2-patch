.class Lxyz/aethersx2/android/DiscordRpcManager$1;
.super Ljava/lang/Object;
.source "DiscordRpcManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lxyz/aethersx2/android/DiscordRpcManager;->start(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 1

    .line 159
    invoke-static {}, Lxyz/aethersx2/android/DiscordRpcManager;->-$$Nest$smrunRpcLoop()V

    .line 160
    return-void
.end method
