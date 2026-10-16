.class public Lxyz/aethersx2/android/DiscordRpcManager;
.super Ljava/lang/Object;
.source "DiscordRpcManager.java"


# static fields
.field private static final CLIENT_ID:Ljava/lang/String; = "1196160538965807185"

.field private static final TAG:Ljava/lang/String; = "DiscordRpc"

.field private static sCurrentGame:Ljava/lang/String;

.field private static volatile sRunning:Z

.field private static sSocket:Ljava/net/Socket;

.field private static sStartTimeSeconds:J

.field private static sWorkerThread:Ljava/lang/Thread;


# direct methods
.method static bridge synthetic -$$Nest$smrunRpcLoop()V
    .registers 0

    invoke-static {}, Lxyz/aethersx2/android/DiscordRpcManager;->runRpcLoop()V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 2

    .line 18
    const/4 v0, 0x0

    sput-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    .line 19
    const/4 v0, 0x0

    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;

    .line 20
    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sSocket:Ljava/net/Socket;

    .line 21
    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    .line 22
    const-wide/16 v0, 0x0

    sput-wide v0, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static escapeJson(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 144
    if-nez p0, :cond_5

    const-string p0, ""

    return-object p0

    .line 145
    :cond_5
    const-string v0, "\\"

    const-string v1, "\\\\"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\""

    const-string v1, "\\\""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\n"

    const-string v1, " "

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static readFrame(Ljava/io/InputStream;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 121
    const/16 v0, 0x8

    new-array v1, v0, [B

    .line 122
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 123
    :goto_6
    if-ge v3, v0, :cond_13

    .line 124
    rsub-int/lit8 v4, v3, 0x8

    invoke-virtual {p0, v1, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    .line 125
    if-gez v4, :cond_11

    return-void

    .line 126
    :cond_11
    add-int/2addr v3, v4

    .line 127
    goto :goto_6

    .line 128
    :cond_13
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 129
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 130
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 131
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 132
    if-lez v0, :cond_39

    const/high16 v1, 0x10000

    if-ge v0, v1, :cond_39

    .line 133
    new-array v1, v0, [B

    .line 134
    nop

    .line 135
    :goto_2c
    if-ge v2, v0, :cond_39

    .line 136
    sub-int v3, v0, v2

    invoke-virtual {p0, v1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    .line 137
    if-gez v3, :cond_37

    return-void

    .line 138
    :cond_37
    add-int/2addr v2, v3

    .line 139
    goto :goto_2c

    .line 141
    :cond_39
    return-void
.end method

.method private static runRpcLoop()V
    .registers 10

    .line 71
    const/16 v0, 0x193f

    :goto_2
    const/16 v1, 0x1948

    if-gt v0, v1, :cond_ab

    sget-boolean v1, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    if-eqz v1, :cond_ab

    .line 73
    :try_start_a
    new-instance v1, Ljava/net/Socket;

    invoke-direct {v1}, Ljava/net/Socket;-><init>()V

    .line 74
    new-instance v2, Ljava/net/InetSocketAddress;

    const-string v3, "127.0.0.1"

    invoke-direct {v2, v3, v0}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    const/16 v3, 0x190

    invoke-virtual {v1, v2, v3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 75
    sput-object v1, Lxyz/aethersx2/android/DiscordRpcManager;->sSocket:Ljava/net/Socket;

    .line 76
    invoke-virtual {v1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    .line 77
    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .line 79
    const-string v4, "{\"v\":1,\"client_id\":\"1196160538965807185\"}"

    .line 80
    const/4 v5, 0x0

    invoke-static {v2, v5, v4}, Lxyz/aethersx2/android/DiscordRpcManager;->sendFrame(Ljava/io/OutputStream;ILjava/lang/String;)V

    .line 81
    invoke-static {v3}, Lxyz/aethersx2/android/DiscordRpcManager;->readFrame(Ljava/io/InputStream;)V

    .line 83
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    .line 84
    sget-object v4, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Playing NetherSX2 - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 85
    nop

    .line 90
    invoke-static {v4}, Lxyz/aethersx2/android/DiscordRpcManager;->escapeJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    .line 91
    invoke-static {v5}, Lxyz/aethersx2/android/DiscordRpcManager;->escapeJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    sget-wide v6, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "{\"cmd\":\"SET_ACTIVITY\",\"args\":{\"pid\":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v8, ",\"activity\":{\"state\":\""

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\",\"details\":\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\",\"timestamps\":{\"start\":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "},\"assets\":{\"large_image\":\"nethersx2\",\"large_text\":\"NetherSX2\"}}},\"nonce\":\"1\"}"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 98
    const/4 v4, 0x1

    invoke-static {v2, v4, v3}, Lxyz/aethersx2/android/DiscordRpcManager;->sendFrame(Ljava/io/OutputStream;ILjava/lang/String;)V

    .line 100
    :goto_8f
    sget-boolean v2, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    if-eqz v2, :cond_a5

    invoke-virtual {v1}, Ljava/net/Socket;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_a5

    invoke-virtual {v1}, Ljava/net/Socket;->isClosed()Z

    move-result v2

    if-nez v2, :cond_a5

    .line 101
    const-wide/16 v2, 0x7d0

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_a4
    .catchall {:try_start_a .. :try_end_a4} :catchall_a6

    goto :goto_8f

    .line 103
    :cond_a5
    goto :goto_ab

    .line 104
    :catchall_a6
    move-exception v1

    .line 71
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_2

    .line 107
    :cond_ab
    :goto_ab
    return-void
.end method

.method private static sendFrame(Ljava/io/OutputStream;ILjava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 110
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    .line 111
    array-length v0, p2

    add-int/lit8 v0, v0, 0x8

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 112
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 113
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 114
    array-length p1, p2

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 115
    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 116
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 117
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    .line 118
    return-void
.end method

.method public static start(Landroid/content/Context;Ljava/lang/String;)V
    .registers 14

    .line 25
    const-string v0, "start_time"

    const-string v1, "Playing NetherSX2 - "

    const-string v2, "state"

    const-string v3, "details"

    const-string v4, "name"

    const-string v5, "NetherSX2"

    if-eqz p1, :cond_f2

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_16

    goto/16 :goto_f2

    .line 26
    :cond_16
    invoke-static {p1}, Lxyz/aethersx2/android/FileHelper;->getFileNameForPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 27
    const-string v6, ".iso"

    invoke-virtual {p1, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_42

    const-string v6, ".chd"

    invoke-virtual {p1, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_42

    const-string v6, ".cso"

    invoke-virtual {p1, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_42

    .line 28
    const-string v6, ".bin"

    invoke-virtual {p1, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_42

    const-string v6, ".gz"

    invoke-virtual {p1, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4f

    .line 29
    :cond_42
    const/16 v6, 0x2e

    invoke-virtual {p1, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    .line 30
    if-lez v6, :cond_4f

    const/4 v7, 0x0

    invoke-virtual {p1, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 32
    :cond_4f
    const-string v6, "%20"

    const-string v7, " "

    invoke-virtual {p1, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 33
    sput-object p1, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    .line 34
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    sput-wide v6, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    .line 35
    const/4 v6, 0x1

    sput-boolean v6, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    .line 37
    if-eqz p0, :cond_db

    .line 39
    :try_start_6b
    new-instance v7, Landroid/content/Intent;

    const-string v10, "com.my.discordrp.ACTION_SET_PRESENCE"

    invoke-direct {v7, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 40
    const-string v10, "application_name"

    invoke-virtual {v7, v10, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 41
    invoke-virtual {v7, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 42
    invoke-virtual {v7, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 43
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v2, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 44
    sget-wide v10, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    mul-long v10, v10, v8

    invoke-virtual {v7, v0, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 45
    const-string v10, "large_image"

    const-string v11, "nethersx2"

    invoke-virtual {v7, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 46
    const-string v10, "large_text"

    invoke-virtual {v7, v10, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    invoke-virtual {p0, v7}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 49
    new-instance v7, Landroid/content/Intent;

    const-string v10, "com.discord.SET_ACTIVITY"

    invoke-direct {v7, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 50
    invoke-virtual {v7, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 51
    invoke-virtual {v7, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 52
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v7, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 53
    sget-wide v1, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    mul-long v1, v1, v8

    invoke-virtual {v7, v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 54
    invoke-virtual {p0, v7}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_d2
    .catchall {:try_start_6b .. :try_end_d2} :catchall_d3

    .line 57
    goto :goto_db

    .line 55
    :catchall_d3
    move-exception p0

    .line 56
    const-string p1, "DiscordRpc"

    const-string v0, "Failed to send broadcast"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 60
    :cond_db
    :goto_db
    new-instance p0, Ljava/lang/Thread;

    new-instance p1, Lxyz/aethersx2/android/DiscordRpcManager$1;

    invoke-direct {p1}, Lxyz/aethersx2/android/DiscordRpcManager$1;-><init>()V

    const-string v0, "DiscordRpcThread"

    invoke-direct {p0, p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    sput-object p0, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;

    .line 66
    invoke-virtual {p0, v6}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 67
    sget-object p0, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;

    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 68
    return-void

    .line 25
    :cond_f2
    :goto_f2
    return-void
.end method

.method public static stop(Landroid/content/Context;)V
    .registers 3

    .line 149
    const/4 v0, 0x0

    sput-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    .line 150
    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sSocket:Ljava/net/Socket;

    if-eqz v0, :cond_10

    .line 152
    :try_start_7
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_a
    .catchall {:try_start_7 .. :try_end_a} :catchall_b

    goto :goto_c

    .line 153
    :catchall_b
    move-exception v0

    :goto_c
    nop

    .line 154
    const/4 v0, 0x0

    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sSocket:Ljava/net/Socket;

    .line 156
    :cond_10
    if-eqz p0, :cond_1f

    .line 158
    :try_start_12
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.my.discordrp.ACTION_CLEAR_PRESENCE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 159
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_1c
    .catchall {:try_start_12 .. :try_end_1c} :catchall_1d

    goto :goto_1e

    .line 160
    :catchall_1d
    move-exception p0

    :goto_1e
    nop

    .line 162
    :cond_1f
    return-void
.end method
