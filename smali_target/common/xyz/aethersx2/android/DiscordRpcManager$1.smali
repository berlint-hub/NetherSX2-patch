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


# instance fields
.field final synthetic val$finalClientId:Ljava/lang/String;

.field final synthetic val$finalShowTime:Z

.field final synthetic val$finalToken:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 173
    iput-object p1, p0, Lxyz/aethersx2/android/DiscordRpcManager$1;->val$finalToken:Ljava/lang/String;

    iput-object p2, p0, Lxyz/aethersx2/android/DiscordRpcManager$1;->val$finalClientId:Ljava/lang/String;

    iput-boolean p3, p0, Lxyz/aethersx2/android/DiscordRpcManager$1;->val$finalShowTime:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 176
    iget-object v0, p0, Lxyz/aethersx2/android/DiscordRpcManager$1;->val$finalToken:Ljava/lang/String;

    if-eqz v0, :cond_14

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_14

    .line 177
    iget-object v0, p0, Lxyz/aethersx2/android/DiscordRpcManager$1;->val$finalToken:Ljava/lang/String;

    iget-object v1, p0, Lxyz/aethersx2/android/DiscordRpcManager$1;->val$finalClientId:Ljava/lang/String;

    iget-boolean v2, p0, Lxyz/aethersx2/android/DiscordRpcManager$1;->val$finalShowTime:Z

    invoke-static {v0, v1, v2}, Lxyz/aethersx2/android/DiscordRpcManager;->-$$Nest$smrunGatewayLoop(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_19

    .line 179
    :cond_14
    iget-object v0, p0, Lxyz/aethersx2/android/DiscordRpcManager$1;->val$finalClientId:Ljava/lang/String;

    invoke-static {v0}, Lxyz/aethersx2/android/DiscordRpcManager;->-$$Nest$smrunLocalIpcLoop(Ljava/lang/String;)V

    .line 181
    :goto_19
    return-void
.end method
