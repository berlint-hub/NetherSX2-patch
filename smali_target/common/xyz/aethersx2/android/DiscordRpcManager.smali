.class public Lxyz/aethersx2/android/DiscordRpcManager;
.super Ljava/lang/Object;
.source "DiscordRpcManager.java"


# static fields
.field private static final DEFAULT_CLIENT_ID:Ljava/lang/String; = "1560829866645917746"

.field private static final TAG:Ljava/lang/String; = "DiscordRpc"

.field private static sAppContext:Landroid/content/Context;

.field private static sClientId:Ljava/lang/String;

.field private static sCurrentGame:Ljava/lang/String;

.field private static sGatewaySocket:Ljava/net/Socket;

.field private static sLocalSocket:Ljava/net/Socket;

.field private static sMediaSession:Landroid/media/session/MediaSession;

.field private static volatile sRunning:Z

.field private static sStartTimeSeconds:J

.field private static sWorkerThread:Ljava/lang/Thread;


# direct methods
.method static bridge synthetic -$$Nest$smrunGatewayLoop(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 3

    invoke-static {p0, p1, p2}, Lxyz/aethersx2/android/DiscordRpcManager;->runGatewayLoop(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smrunLocalIpcLoop(Ljava/lang/String;)V
    .registers 1

    invoke-static {p0}, Lxyz/aethersx2/android/DiscordRpcManager;->runLocalIpcLoop(Ljava/lang/String;)V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 2

    const/4 v0, 0x0

    sput-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;

    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sLocalSocket:Ljava/net/Socket;

    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sGatewaySocket:Ljava/net/Socket;

    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;

    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    const-wide/16 v0, 0x0

    sput-wide v0, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    const/4 v0, 0x0

    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sAppContext:Landroid/content/Context;

    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sClientId:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static escapeJson(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    if-nez p0, :cond_5

    const-string p0, ""

    return-object p0

    :cond_5
    const-string v0, "\\"

    const-string v1, "\\\\"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\""

    const-string v1, "\\\""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\r"

    const-string v1, "\\r"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\n"

    const-string v1, "\\n"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\t"

    const-string v1, "\\t"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static readIpcFrame(Ljava/io/InputStream;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/16 v0, 0x8

    new-array v1, v0, [B

    const/4 v2, 0x0

    move v3, v2

    :goto_6
    if-ge v3, v0, :cond_13

    rsub-int/lit8 v4, v3, 0x8

    invoke-virtual {p0, v1, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    if-gez v4, :cond_11

    return-void

    :cond_11
    add-int/2addr v3, v4

    goto :goto_6

    :cond_13
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    if-lez v0, :cond_39

    const/high16 v1, 0x10000

    if-ge v0, v1, :cond_39

    new-array v1, v0, [B

    :goto_2c
    if-ge v2, v0, :cond_39

    sub-int v3, v0, v2

    invoke-virtual {p0, v1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    if-gez v3, :cond_37

    return-void

    :cond_37
    add-int/2addr v2, v3

    goto :goto_2c

    :cond_39
    return-void
.end method

.method private static readWsTextFrame(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I
    move-result v0

    const/4 v1, 0x0

    if-gez v0, :cond_8

    return-object v1

    :cond_8
    and-int/lit8 v2, v0, 0xf

    const/16 v3, 0x8

    if-ne v2, v3, :cond_f

    return-object v1

    :cond_f
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I
    move-result v0

    if-gez v0, :cond_16

    return-object v1

    :cond_16
    and-int/lit16 v2, v0, 0x80

    const/4 v3, 0x0

    if-eqz v2, :cond_1e

    const/4 v2, 0x1

    goto :goto_1f

    :cond_1e
    move v2, v3

    :goto_1f
    const/16 v4, 0x7f

    and-int/2addr v0, v4

    const/16 v5, 0x7e

    const/16 v6, 0x8

    if-ne v0, v5, :cond_37

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I
    move-result v0

    and-int/lit16 v0, v0, 0xff

    shl-int/2addr v0, v6

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I
    move-result v4

    and-int/lit16 v4, v4, 0xff

    or-int/2addr v0, v4

    goto :goto_4c

    :cond_37
    if-ne v0, v4, :cond_4c

    const-wide/16 v4, 0x0

    move v0, v3

    :goto_3d
    if-ge v0, v6, :cond_4b

    shl-long/2addr v4, v6

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I
    move-result v7

    and-int/lit16 v7, v7, 0xff

    int-to-long v7, v7

    or-long/2addr v4, v7

    add-int/lit8 v0, v0, 0x1

    goto :goto_3d

    :cond_4b
    long-to-int v0, v4

    :cond_4c
    :goto_4c
    if-eqz v2, :cond_55

    const/4 v1, 0x4

    new-array v1, v1, [B

    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    :cond_55
    new-array v4, v0, [B

    move v5, v3

    :goto_58
    if-ge v5, v0, :cond_66

    sub-int v6, v0, v5

    invoke-virtual {p0, v4, v5, v6}, Ljava/io/InputStream;->read([BII)I

    move-result v6

    if-gez v6, :cond_64

    const/4 p0, 0x0

    return-object p0

    :cond_64
    add-int/2addr v5, v6

    goto :goto_58

    :cond_66
    if-eqz v2, :cond_7a

    if-eqz v1, :cond_7a

    :goto_6a
    if-ge v3, v0, :cond_7a

    aget-byte p0, v4, v3

    rem-int/lit8 v2, v3, 0x4

    aget-byte v2, v1, v2

    xor-int/2addr p0, v2

    int-to-byte p0, p0

    aput-byte p0, v4, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_6a

    :cond_7a
    new-instance p0, Ljava/lang/String;

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p0, v4, v0}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object p0
.end method

.method private static buildIdentifyPayload(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 15

    const-wide/16 v0, 0x3e8

    if-eqz p2, :cond_24

    sget-wide v2, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    mul-long/2addr v2, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ",\"timestamps\":{\"start\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_26

    :cond_24
    const-string v0, ""

    :goto_26
    invoke-static {p0}, Lxyz/aethersx2/android/DiscordRpcManager;->escapeJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lxyz/aethersx2/android/DiscordRpcManager;->escapeJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    if-nez v3, :cond_34

    const-string v3, ""

    :cond_34
    invoke-static {v3}, Lxyz/aethersx2/android/DiscordRpcManager;->escapeJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "{\"op\":2,\"d\":{\"token\":\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "\",\"capabilities\":16381,\"properties\":{\"os\":\"Android\",\"browser\":\"NetherSX2\",\"device\":\"NetherSX2\"},\"presence\":{\"status\":\"online\",\"since\":0,\"activities\":[{\"name\":\"NetherSX2\",\"type\":0,\"application_id\":\""

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\",\"details\":\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\",\"state\":\"Playing NetherSX2 - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\"assets\":{\"large_image\":\"app\",\"large_text\":\"NetherSX2\"}}],\"afk\":false}}}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static sendIpcActivity(Ljava/io/OutputStream;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {}, Landroid/os/Process;->myPid()I
    move-result v0

    sget-object v1, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;
    if-nez v1, :cond_b

    const-string v1, ""

    :cond_b
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "Playing NetherSX2 - "
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2

    invoke-static {v2}, Lxyz/aethersx2/android/DiscordRpcManager;->escapeJson(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2

    invoke-static {v1}, Lxyz/aethersx2/android/DiscordRpcManager;->escapeJson(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1

    sget-wide v3, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "{\"cmd\":\"SET_ACTIVITY\",\"args\":{\"pid\":"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v5, ",\"activity\":{\"state\":\""
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, "\",\"details\":\""
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "\",\"timestamps\":{\"start\":"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "},\"assets\":{\"large_image\":\"app\",\"large_text\":\"NetherSX2\"}}},\"nonce\":\"1\"}"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0

    const/4 v1, 0x1
    invoke-static {p0, v1, v0}, Lxyz/aethersx2/android/DiscordRpcManager;->sendIpcFrame(Ljava/io/OutputStream;ILjava/lang/String;)V

    return-void
.end method

.method public static resendBroadcastPresence()V
    .registers 10

    sget-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z
    if-nez v0, :cond_5
    return-void

    :cond_5
    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sAppContext:Landroid/content/Context;
    if-nez v0, :cond_a
    return-void

    :cond_a
    sget-object v1, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;
    if-nez v1, :cond_f
    return-void

    :cond_f
    :try_start_f
    const-string v2, "NetherSX2"

    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "Playing NetherSX2 - "
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3

    sget-wide v4, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J
    const-wide/16 v6, 0x3e8
    mul-long/2addr v4, v6

    new-instance v6, Landroid/content/Intent;
    const-string v7, "com.my.discordrp.ACTION_SET_PRESENCE"
    invoke-direct {v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/16 v7, 0x20
    invoke-virtual {v6, v7}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v8, "application_name"
    invoke-virtual {v6, v8, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v8, "name"
    invoke-virtual {v6, v8, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v8, "details"
    invoke-virtual {v6, v8, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v8, "state"
    invoke-virtual {v6, v8, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v8, "start_time"
    invoke-virtual {v6, v8, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string v8, "large_image"
    const-string v9, "app"
    invoke-virtual {v6, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v8, "large_text"
    invoke-virtual {v6, v8, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v0, v6}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    new-instance v8, Landroid/content/Intent;
    invoke-direct {v8, v6}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V
    const-string v6, "com.my.discordrp"
    invoke-virtual {v8, v6}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
    invoke-virtual {v0, v8}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    new-instance v6, Landroid/content/Intent;
    const-string v8, "com.discord.SET_ACTIVITY"
    invoke-direct {v6, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v7, "name"
    invoke-virtual {v6, v7, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "details"
    invoke-virtual {v6, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "state"
    invoke-virtual {v6, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "start_time"
    invoke-virtual {v6, v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    invoke-virtual {v0, v6}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    new-instance v1, Landroid/content/Intent;
    invoke-direct {v1, v6}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V
    const-string v2, "com.discord"
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_7a
    .catchall {:try_start_f .. :try_end_7a} :catchall_7b

    goto :goto_7c

    :catchall_7b
    move-exception v0

    :goto_7c
    return-void
.end method

.method private static runGatewayLoop(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 20

    :goto_outer
    sget-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z
    if-eqz v0, :cond_exit

    const/4 v2, 0x0

    :try_start_gw
    const-string v0, "DiscordRpc"
    const-string v1, "Connecting to Discord Gateway..."
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;
    move-result-object v0
    check-cast v0, Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocketFactory;->createSocket()Ljava/net/Socket;
    move-result-object v0
    move-object v2, v0
    check-cast v2, Ljavax/net/ssl/SSLSocket;

    new-instance v0, Ljava/net/InetSocketAddress;
    const-string v1, "gateway.discord.gg"
    const/16 v3, 0x1bb
    invoke-direct {v0, v1, v3}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    const/16 v1, 0x1f40
    invoke-virtual {v2, v0, v1}, Ljavax/net/ssl/SSLSocket;->connect(Ljava/net/SocketAddress;I)V

    invoke-virtual {v2}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    const/16 v0, 0xbb8
    invoke-virtual {v2, v0}, Ljavax/net/ssl/SSLSocket;->setSoTimeout(I)V

    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sGatewaySocket:Ljava/net/Socket;

    invoke-virtual {v2}, Ljavax/net/ssl/SSLSocket;->getOutputStream()Ljava/io/OutputStream;
    move-result-object v3

    invoke-virtual {v2}, Ljavax/net/ssl/SSLSocket;->getInputStream()Ljava/io/InputStream;
    move-result-object v4

    const-string v0, "GET /?v=10&encoding=json HTTP/1.1\r\nHost: gateway.discord.gg\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nSec-WebSocket-Version: 13\r\nUser-Agent: NetherSX2\r\n\r\n"
    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B
    move-result-object v0
    invoke-virtual {v3, v0}, Ljava/io/OutputStream;->write([B)V
    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V

    new-instance v0, Ljava/io/BufferedReader;
    new-instance v1, Ljava/io/InputStreamReader;
    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;
    invoke-direct {v1, v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V
    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :cond_fail_handshake
    const-string v5, "101"
    invoke-virtual {v1, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v5
    if-nez v5, :cond_read_headers

    :cond_fail_handshake
    new-instance v0, Ljava/io/IOException;
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "Gateway handshake failed: "
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    throw v0

    :cond_read_headers
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :cond_hello_frame
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :cond_hello_frame
    goto :cond_read_headers

    :cond_hello_frame
    invoke-static {v4}, Lxyz/aethersx2/android/DiscordRpcManager;->readWsTextFrame(Ljava/io/InputStream;)Ljava/lang/String;
    move-result-object v0
    if-nez v0, :cond_parse_hello
    new-instance v0, Ljava/io/IOException;
    const-string v1, "Null Hello frame from Gateway"
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    throw v0

    :cond_parse_hello
    const-wide/32 v6, 0xa122
    const-string v1, "\"heartbeat_interval\":"
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v1
    if-lez v1, :cond_build_identify
    add-int/lit8 v5, v1, 0x15
    const-string v8, ","
    invoke-virtual {v0, v8, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v8
    if-gez v8, :cond_check_idx
    const-string v8, "}"
    invoke-virtual {v0, v8, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v8

    :cond_check_idx
    if-le v8, v1, :cond_build_identify
    :try_start_parse_hb
    invoke-virtual {v0, v5, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v6
    :try_end_parse_hb
    .catch Ljava/lang/Exception; {:try_start_parse_hb .. :try_end_parse_hb} :catchall_parse_hb
    :catchall_parse_hb

    :cond_build_identify
    invoke-static/range {p0 .. p2}, Lxyz/aethersx2/android/DiscordRpcManager;->buildIdentifyPayload(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    move-result-object v0
    invoke-static {v3, v0}, Lxyz/aethersx2/android/DiscordRpcManager;->sendWsTextFrame(Ljava/io/OutputStream;Ljava/lang/String;)V

    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "Sent IDENTIFY to Discord Gateway for game: "
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "DiscordRpc"
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v8
    move-wide v10, v8

    :goto_gw_loop
    sget-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z
    if-eqz v0, :cond_gw_loop_exit

    invoke-virtual {v2}, Ljavax/net/ssl/SSLSocket;->isClosed()Z
    move-result v0
    if-nez v0, :cond_gw_loop_exit

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v12
    sub-long v12, v12, v8
    cmp-long v0, v12, v6
    if-ltz v0, :cond_check_gw_bc
    const-string v0, "{\"op\":1,\"d\":null}"
    invoke-static {v3, v0}, Lxyz/aethersx2/android/DiscordRpcManager;->sendWsTextFrame(Ljava/io/OutputStream;Ljava/lang/String;)V
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v8

    :cond_check_gw_bc
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v12
    sub-long v12, v12, v10
    const-wide/16 v14, 0x4e20
    cmp-long v0, v12, v14
    if-ltz v0, :cond_try_read_frame
    invoke-static {}, Lxyz/aethersx2/android/DiscordRpcManager;->resendBroadcastPresence()V
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v10

    :cond_try_read_frame
    const/4 v0, 0x0
    :try_start_read_frame
    invoke-static {v4}, Lxyz/aethersx2/android/DiscordRpcManager;->readWsTextFrame(Ljava/io/InputStream;)Ljava/lang/String;
    move-result-object v0
    :try_end_read_frame
    .catch Ljava/net/SocketTimeoutException; {:try_start_read_frame .. :try_end_read_frame} :catch_timeout

    if-nez v0, :cond_check_opcodes
    const-string v0, "DiscordRpc"
    const-string v1, "Discord Gateway closed connection (null frame)"
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    goto :cond_gw_loop_exit

    :cond_check_opcodes
    const-string v1, "\"op\":7"
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v1
    if-nez v1, :cond_reconnect_op

    const-string v1, "\"op\":9"
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v1
    if-eqz v1, :cond_check_op1

    :cond_reconnect_op
    const-string v0, "DiscordRpc"
    const-string v1, "Discord Gateway requested reconnect (op 7/9)"
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    goto :cond_gw_loop_exit

    :cond_check_op1
    const-string v1, "\"op\":1"
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v0
    if-eqz v0, :cond_catch_timeout
    const-string v0, "{\"op\":1,\"d\":null}"
    invoke-static {v3, v0}, Lxyz/aethersx2/android/DiscordRpcManager;->sendWsTextFrame(Ljava/io/OutputStream;Ljava/lang/String;)V
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v8

    :catch_timeout
    :cond_catch_timeout
    goto/16 :goto_gw_loop

    :cond_gw_loop_exit
    :try_end_gw
    .catchall {:try_start_gw .. :try_end_gw} :catchall_gw

    if-eqz v2, :cond_cleanup_gw
    :try_start_close_gw
    invoke-virtual {v2}, Ljavax/net/ssl/SSLSocket;->close()V
    :try_end_close_gw
    .catchall {:try_start_close_gw .. :try_end_close_gw} :catchall_close_gw
    :catchall_close_gw
    :cond_cleanup_gw
    const/4 v0, 0x0
    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sGatewaySocket:Ljava/net/Socket;
    goto :goto_check_gw_retry

    :catchall_gw
    move-exception v0
    const-string v1, "DiscordRpc"
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "Discord Gateway error: "
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v2, :cond_cleanup_gw2
    :try_start_close_gw2
    invoke-virtual {v2}, Ljavax/net/ssl/SSLSocket;->close()V
    :try_end_close_gw2
    .catchall {:try_start_close_gw2 .. :try_end_close_gw2} :catchall_close_gw2
    :catchall_close_gw2
    :cond_cleanup_gw2
    const/4 v0, 0x0
    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sGatewaySocket:Ljava/net/Socket;

    :goto_check_gw_retry
    sget-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z
    if-eqz v0, :cond_exit
    const-wide/16 v0, 0x1388
    :try_start_gw_sleep
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_gw_sleep
    .catchall {:try_start_gw_sleep .. :try_end_gw_sleep} :catchall_gw_sleep
    :catchall_gw_sleep
    goto/16 :goto_outer

    :cond_exit
    return-void
.end method

.method private static runLocalIpcLoop(Ljava/lang/String;)V
    .registers 16

    :goto_outer
    sget-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z
    if-eqz v0, :cond_outer_exit

    const/4 v5, 0x0
    const/16 v0, 0x193f

    :goto_port
    const/16 v1, 0x1948
    if-gt v0, v1, :cond_check_reconnect

    sget-boolean v1, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z
    if-eqz v1, :cond_check_reconnect

    const/4 v2, 0x0

    :try_start_ipc
    new-instance v1, Ljava/net/Socket;
    invoke-direct {v1}, Ljava/net/Socket;-><init>()V
    move-object v2, v1

    new-instance v1, Ljava/net/InetSocketAddress;
    const-string v3, "127.0.0.1"
    invoke-direct {v1, v3, v0}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    const/16 v3, 0x190
    invoke-virtual {v2, v1, v3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    const/16 v1, 0xbb8
    invoke-virtual {v2, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sLocalSocket:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;
    move-result-object v3

    invoke-virtual {v2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;
    move-result-object v4

    invoke-static {p0}, Lxyz/aethersx2/android/DiscordRpcManager;->escapeJson(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    new-instance v6, Ljava/lang/StringBuilder;
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V
    const-string v7, "{\"v\":1,\"client_id\":\""
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v6, "\"}"
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const/4 v6, 0x0
    invoke-static {v3, v6, v1}, Lxyz/aethersx2/android/DiscordRpcManager;->sendIpcFrame(Ljava/io/OutputStream;ILjava/lang/String;)V

    invoke-static {v4}, Lxyz/aethersx2/android/DiscordRpcManager;->readIpcFrame(Ljava/io/InputStream;)V

    invoke-static {v3}, Lxyz/aethersx2/android/DiscordRpcManager;->sendIpcActivity(Ljava/io/OutputStream;)V
    const/4 v5, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v6
    move-wide v8, v6

    :goto_ipc_session
    sget-boolean v1, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z
    if-eqz v1, :cond_ipc_session_end

    invoke-virtual {v2}, Ljava/net/Socket;->isClosed()Z
    move-result v1
    if-nez v1, :cond_ipc_session_end

    const-wide/16 v10, 0x3e8
    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v10

    sub-long v10, v10, v6
    const-wide/16 v12, 0x3a98
    cmp-long v1, v10, v12
    if-ltz v1, :cond_check_broadcast

    invoke-static {v3}, Lxyz/aethersx2/android/DiscordRpcManager;->sendIpcActivity(Ljava/io/OutputStream;)V
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v6

    :cond_check_broadcast
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v10

    sub-long v10, v10, v8
    const-wide/16 v12, 0x4e20
    cmp-long v1, v10, v12
    if-ltz v1, :cond_goto_session_loop

    invoke-static {}, Lxyz/aethersx2/android/DiscordRpcManager;->resendBroadcastPresence()V
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v8

    :cond_goto_session_loop
    goto :goto_ipc_session

    :cond_ipc_session_end
    :try_end_ipc
    .catchall {:try_start_ipc .. :try_end_ipc} :catchall_ipc

    if-eqz v2, :cond_cleanup_ipc
    :try_start_close
    invoke-virtual {v2}, Ljava/net/Socket;->close()V
    :try_end_close
    .catchall {:try_start_close .. :try_end_close} :catchall_close
    :catchall_close
    :cond_cleanup_ipc
    const/4 v1, 0x0
    sput-object v1, Lxyz/aethersx2/android/DiscordRpcManager;->sLocalSocket:Ljava/net/Socket;
    goto :goto_check_connected

    :catchall_ipc
    move-exception v1
    if-eqz v2, :cond_cleanup_ipc2
    :try_start_close2
    invoke-virtual {v2}, Ljava/net/Socket;->close()V
    :try_end_close2
    .catchall {:try_start_close2 .. :try_end_close2} :catchall_close2
    :catchall_close2
    :cond_cleanup_ipc2
    const/4 v1, 0x0
    sput-object v1, Lxyz/aethersx2/android/DiscordRpcManager;->sLocalSocket:Ljava/net/Socket;

    :goto_check_connected
    if-eqz v5, :cond_next_port
    goto :check_reconnect_sleep

    :cond_next_port
    add-int/lit8 v0, v0, 0x1
    goto/16 :goto_port

    :cond_check_reconnect
    :check_reconnect_sleep
    sget-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z
    if-eqz v0, :cond_outer_exit
    const-wide/16 v0, 0x1388
    :try_start_outer_sleep
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_outer_sleep
    .catchall {:try_start_outer_sleep .. :try_end_outer_sleep} :catchall_outer_sleep
    :catchall_outer_sleep
    goto/16 :goto_outer

    :cond_outer_exit
    return-void
.end method

.method private static sendIpcFrame(Ljava/io/OutputStream;ILjava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    array-length v0, p2

    add-int/lit8 v0, v0, 0x8

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    array-length p1, p2

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    return-void
.end method

.method private static sendWsTextFrame(Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    array-length v0, p1

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v2, 0x81

    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    const/4 v2, 0x4

    new-array v3, v2, [B

    fill-array-data v3, :array_66

    const/16 v4, 0x7d

    const/16 v5, 0x80

    if-gt v0, v4, :cond_24

    or-int/2addr v0, v5

    invoke-virtual {v1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_42

    :cond_24
    const v4, 0xffff

    if-gt v0, v4, :cond_38

    const/16 v4, 0xfe

    invoke-virtual {v1, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    shr-int/lit8 v4, v0, 0x8

    invoke-virtual {v1, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {v1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_42

    :cond_38
    const/16 v4, 0xff

    invoke-virtual {v1, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    const/4 v4, 0x0

    :goto_3e
    const/16 v5, 0x8

    if-ge v4, v5, :cond_42

    :cond_42
    :goto_42
    invoke-virtual {v1, v3}, Ljava/io/ByteArrayOutputStream;->write([B)V

    array-length v0, p1

    new-array v0, v0, [B

    const/4 v4, 0x0

    :goto_49
    array-length v5, p1

    if-ge v4, v5, :cond_5b

    aget-byte v5, p1, v4

    rem-int/lit8 v6, v4, 0x4

    aget-byte v6, v3, v6

    xor-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v0, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_49

    :cond_5b
    invoke-virtual {v1, v0}, Ljava/io/ByteArrayOutputStream;->write([B)V

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    return-void

    :array_66
    .array-data 1
        0x12t
        0x34t
        0x56t
        0x78t
    .end array-data
.end method

.method public static start(Landroid/content/Context;Ljava/lang/String;)V
    .registers 18

    move-object/from16 v0, p1

    if-nez v0, :cond_check_empty

    return-void

    :cond_check_empty
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_start_stop

    return-void

    :cond_start_stop
    invoke-static/range {p0 .. p0}, Lxyz/aethersx2/android/DiscordRpcManager;->stop(Landroid/content/Context;)V

    move-object/from16 v2, p0

    const-string v3, ""

    const-string v4, "1560829866645917746"

    const/4 v5, 0x1

    const/4 v6, 0x1

    if-eqz v2, :cond_read_prefs_done

    :try_start_prefs
    invoke-static {v2}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "UI/EnableDiscordRpc"

    const/4 v7, 0x1

    invoke-interface {v0, v1, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_prefs_token

    const-string v0, "DiscordRpc"

    const-string v1, "Discord RPC disabled by user setting"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_prefs_token
    const-string v1, "UI/DiscordToken"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_prefs_client

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    :cond_prefs_client
    const-string v1, "UI/DiscordClientId"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_prefs_showtime

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_prefs_showtime

    move-object v4, v1

    :cond_prefs_showtime
    const-string v1, "UI/DiscordShowTime"

    invoke-interface {v0, v1, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    const-string v1, "UI/EnableMediaSessionRpc"

    invoke-interface {v0, v1, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6
    :try_end_prefs
    .catchall {:try_start_prefs .. :try_end_prefs} :catchall_prefs

    goto :cond_read_prefs_done

    :catchall_prefs
    move-exception v0

    const-string v1, "DiscordRpc"

    const-string v7, "Failed to read Discord RPC preference"

    invoke-static {v1, v7, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_read_prefs_done
    invoke-static/range {p1 .. p1}, Lxyz/aethersx2/android/FileHelper;->getFileNameForPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_resolve_title

    const-string v0, ".iso"

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_strip_ext

    const-string v0, ".chd"

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_strip_ext

    const-string v0, ".cso"

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_strip_ext

    const-string v0, ".bin"

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_strip_ext

    const-string v0, ".gz"

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_clean_name

    :cond_strip_ext
    const/16 v0, 0x2e

    invoke-virtual {v7, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    if-lez v0, :cond_clean_name

    const/4 v1, 0x0

    invoke-virtual {v7, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    :cond_clean_name
    const-string v0, "%20"

    const-string v1, " "

    invoke-virtual {v7, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    :cond_resolve_title
    :try_start_gdr
    move-object/from16 v0, p1

    invoke-static {v2, v0}, Lxyz/aethersx2/android/GameDataResolver;->resolveGameTitle(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_gdr_done

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_gdr_done

    move-object v7, v0
    :cond_gdr_done
    :try_end_gdr
    .catchall {:try_start_gdr .. :try_end_gdr} :catchall_gdr

    goto :cond_gdr_exit

    :catchall_gdr
    move-exception v0

    const-string v1, "DiscordRpc"

    const-string v8, "Could not resolve game title via GameDataResolver"

    invoke-static {v1, v8, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_gdr_exit
    if-nez v7, :cond_store_fields

    const-string v7, "NetherSX2 Game"

    :cond_store_fields
    sput-object v7, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v8, 0x3e8

    div-long/2addr v0, v8

    sput-wide v0, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    const/4 v0, 0x1

    sput-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sAppContext:Landroid/content/Context;

    sput-object v4, Lxyz/aethersx2/android/DiscordRpcManager;->sClientId:Ljava/lang/String;

    if-eqz v6, :cond_media_done

    if-nez v2, :cond_media_start

    goto/16 :cond_media_done

    :cond_media_start
    :try_start_media_1
    new-instance v8, Landroid/media/session/MediaSession;

    const-string v0, "NetherSX2"

    invoke-direct {v8, v2, v0}, Landroid/media/session/MediaSession;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    new-instance v9, Landroid/media/MediaMetadata$Builder;

    invoke-direct {v9}, Landroid/media/MediaMetadata$Builder;-><init>()V

    const-string v0, "android.media.metadata.TITLE"

    invoke-virtual {v9, v0, v7}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    const-string v0, "android.media.metadata.ARTIST"

    const-string v1, "PlayStation 2"

    invoke-virtual {v9, v0, v1}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    const-string v0, "android.media.metadata.ALBUM"

    const-string v1, "NetherSX2"

    invoke-virtual {v9, v0, v1}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    const-string v0, "android.media.metadata.DISPLAY_TITLE"

    invoke-virtual {v9, v0, v7}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    const-string v0, "android.media.metadata.DISPLAY_SUBTITLE"

    const-string v1, "Playing on NetherSX2"

    invoke-virtual {v9, v0, v1}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    if-eqz v5, :cond_media_builder_ready

    const-string v0, "android.media.metadata.DURATION"

    const-wide/32 v10, 0x5265c00

    invoke-virtual {v9, v0, v10, v11}, Landroid/media/MediaMetadata$Builder;->putLong(Ljava/lang/String;J)Landroid/media/MediaMetadata$Builder;
    :try_end_media_1
    .catchall {:try_start_media_1 .. :try_end_media_1} :catchall_media

    :cond_media_builder_ready
    const/4 v12, 0x0

    :try_start_cover
    invoke-static {}, Lxyz/aethersx2/android/NativeLibrary;->getCoversDirectory()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_check_external_cover

    new-instance v11, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v10, ".jpg"

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v11, v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_cover_file_found

    new-instance v11, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v10, ".png"

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v11, v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :cond_cover_file_found
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_check_external_cover

    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v12

    :cond_check_external_cover
    if-nez v12, :cond_cover_put

    new-instance v11, Ljava/io/File;

    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    const-string v1, "covers"

    invoke-direct {v11, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_cover_put

    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v10, ".jpg"

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v11, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_ext_cover_found

    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v10, ".png"

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v11, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :cond_ext_cover_found
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_cover_put

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v12

    :cond_cover_put
    if-eqz v12, :cond_media_finalize

    const-string v0, "android.media.metadata.ALBUM_ART"

    invoke-virtual {v9, v0, v12}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;

    const-string v0, "android.media.metadata.ART"

    invoke-virtual {v9, v0, v12}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;
    :try_end_cover
    .catchall {:try_start_cover .. :try_end_cover} :catchall_cover

    goto :cond_media_finalize

    :catchall_cover
    move-exception v0

    const-string v1, "DiscordRpc"

    const-string v10, "Could not load cover for MediaSession"

    invoke-static {v1, v10, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_media_finalize
    :try_start_media_2
    invoke-virtual {v9}, Landroid/media/MediaMetadata$Builder;->build()Landroid/media/MediaMetadata;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/media/session/MediaSession;->setMetadata(Landroid/media/MediaMetadata;)V

    new-instance v10, Landroid/media/session/PlaybackState$Builder;

    invoke-direct {v10}, Landroid/media/session/PlaybackState$Builder;-><init>()V

    const-wide/16 v0, 0x7

    invoke-virtual {v10, v0, v1}, Landroid/media/session/PlaybackState$Builder;->setActions(J)Landroid/media/session/PlaybackState$Builder;

    const/4 v11, 0x3

    const-wide/16 v12, 0x0

    const/high16 v14, 0x3f800000    # 1.0f

    invoke-virtual/range {v10 .. v14}, Landroid/media/session/PlaybackState$Builder;->setState(IJF)Landroid/media/session/PlaybackState$Builder;

    invoke-virtual {v10}, Landroid/media/session/PlaybackState$Builder;->build()Landroid/media/session/PlaybackState;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/media/session/MediaSession;->setPlaybackState(Landroid/media/session/PlaybackState;)V

    const/4 v0, 0x1

    invoke-virtual {v8, v0}, Landroid/media/session/MediaSession;->setActive(Z)V

    sput-object v8, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;

    const-string v0, "DiscordRpc"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "MediaSession active for: "

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_media_2
    .catchall {:try_start_media_2 .. :try_end_media_2} :catchall_media

    goto :cond_media_done

    :catchall_media
    move-exception v0

    const-string v1, "DiscordRpc"

    const-string v8, "Failed to start MediaSession"

    invoke-static {v1, v8, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_media_done
    :try_start_thread
    invoke-static {}, Lxyz/aethersx2/android/DiscordRpcManager;->resendBroadcastPresence()V

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lxyz/aethersx2/android/DiscordRpcManager$1;

    invoke-direct {v1, v3, v4, v5}, Lxyz/aethersx2/android/DiscordRpcManager$1;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    const-string v7, "DiscordRpcThread"

    invoke-direct {v0, v1, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_thread
    .catchall {:try_start_thread .. :try_end_thread} :catchall_thread

    return-void

    :catchall_thread
    move-exception v0

    const-string v1, "DiscordRpc"

    const-string v2, "Failed to start DiscordRpcThread"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public static stop(Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x0
    sput-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    sget-object v1, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;
    if-eqz v1, :cond_10
    :try_start_interrupt
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V
    :try_end_interrupt
    .catchall {:try_start_interrupt .. :try_end_interrupt} :catchall_interrupt
    :catchall_interrupt
    const/4 v1, 0x0
    sput-object v1, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;

    :cond_10
    sget-object v1, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;
    const/4 v2, 0x0
    if-eqz v1, :cond_1e
    :try_start_8
    invoke-virtual {v1, v0}, Landroid/media/session/MediaSession;->setActive(Z)V
    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;
    invoke-virtual {v0}, Landroid/media/session/MediaSession;->release()V
    :try_end_10
    .catchall {:try_start_8 .. :try_end_10} :catchall_11
    goto :goto_12
    :catchall_11
    move-exception v0
    :goto_12
    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;

    :cond_1e
    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sGatewaySocket:Ljava/net/Socket;
    if-eqz v0, :cond_2d
    :try_start_19
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_1d
    goto :goto_1e
    :catchall_1d
    move-exception v0
    :goto_1e
    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sGatewaySocket:Ljava/net/Socket;

    :cond_2d
    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sLocalSocket:Ljava/net/Socket;
    if-eqz v0, :cond_3c
    :try_start_25
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_28
    .catchall {:try_start_25 .. :try_end_28} :catchall_29
    goto :goto_2a
    :catchall_29
    move-exception v0
    :goto_2a
    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sLocalSocket:Ljava/net/Socket;

    :cond_3c
    if-nez p0, :cond_40
    sget-object p0, Lxyz/aethersx2/android/DiscordRpcManager;->sAppContext:Landroid/content/Context;

    :cond_40
    if-eqz p0, :goto_5f
    :try_start_2f
    new-instance v0, Landroid/content/Intent;
    const-string v1, "com.my.discordrp.ACTION_CLEAR_PRESENCE"
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    const/16 v1, 0x20
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    new-instance v1, Landroid/content/Intent;
    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V
    const-string v0, "com.my.discordrp"
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
    invoke-virtual {p0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_5c
    .catchall {:try_start_2f .. :try_end_5c} :catchall_5d
    goto :goto_5f
    :catchall_5d
    move-exception v0
    :goto_5f
    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sAppContext:Landroid/content/Context;
    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sClientId:Ljava/lang/String;
    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;
    const-wide/16 v0, 0x0
    sput-wide v0, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    return-void
.end method
