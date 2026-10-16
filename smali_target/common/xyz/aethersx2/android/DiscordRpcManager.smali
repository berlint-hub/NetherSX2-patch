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

    .line 20
    const/4 v0, 0x0

    sput-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    .line 21
    const/4 v0, 0x0

    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;

    .line 22
    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sSocket:Ljava/net/Socket;

    .line 23
    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    .line 24
    const-wide/16 v0, 0x0

    sput-wide v0, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static escapeJson(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 173
    if-nez p0, :cond_5

    const-string p0, ""

    return-object p0

    .line 174
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

    .line 150
    const/16 v0, 0x8

    new-array v1, v0, [B

    .line 151
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 152
    :goto_6
    if-ge v3, v0, :cond_13

    .line 153
    rsub-int/lit8 v4, v3, 0x8

    invoke-virtual {p0, v1, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    .line 154
    if-gez v4, :cond_11

    return-void

    .line 155
    :cond_11
    add-int/2addr v3, v4

    .line 156
    goto :goto_6

    .line 157
    :cond_13
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 158
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 159
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 160
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 161
    if-lez v0, :cond_39

    const/high16 v1, 0x10000

    if-ge v0, v1, :cond_39

    .line 162
    new-array v1, v0, [B

    .line 163
    nop

    .line 164
    :goto_2c
    if-ge v2, v0, :cond_39

    .line 165
    sub-int v3, v0, v2

    invoke-virtual {p0, v1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    .line 166
    if-gez v3, :cond_37

    return-void

    .line 167
    :cond_37
    add-int/2addr v2, v3

    .line 168
    goto :goto_2c

    .line 170
    :cond_39
    return-void
.end method

.method private static runRpcLoop()V
    .registers 10

    .line 100
    const/16 v0, 0x193f

    :goto_2
    const/16 v1, 0x1948

    if-gt v0, v1, :cond_ab

    sget-boolean v1, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    if-eqz v1, :cond_ab

    .line 102
    :try_start_a
    new-instance v1, Ljava/net/Socket;

    invoke-direct {v1}, Ljava/net/Socket;-><init>()V

    .line 103
    new-instance v2, Ljava/net/InetSocketAddress;

    const-string v3, "127.0.0.1"

    invoke-direct {v2, v3, v0}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    const/16 v3, 0x190

    invoke-virtual {v1, v2, v3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 104
    sput-object v1, Lxyz/aethersx2/android/DiscordRpcManager;->sSocket:Ljava/net/Socket;

    .line 105
    invoke-virtual {v1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    .line 106
    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .line 108
    const-string v4, "{\"v\":1,\"client_id\":\"1196160538965807185\"}"

    .line 109
    const/4 v5, 0x0

    invoke-static {v2, v5, v4}, Lxyz/aethersx2/android/DiscordRpcManager;->sendFrame(Ljava/io/OutputStream;ILjava/lang/String;)V

    .line 110
    invoke-static {v3}, Lxyz/aethersx2/android/DiscordRpcManager;->readFrame(Ljava/io/InputStream;)V

    .line 112
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    .line 113
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

    .line 114
    nop

    .line 119
    invoke-static {v4}, Lxyz/aethersx2/android/DiscordRpcManager;->escapeJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    .line 120
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

    .line 127
    const/4 v4, 0x1

    invoke-static {v2, v4, v3}, Lxyz/aethersx2/android/DiscordRpcManager;->sendFrame(Ljava/io/OutputStream;ILjava/lang/String;)V

    .line 129
    :goto_8f
    sget-boolean v2, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    if-eqz v2, :cond_a5

    invoke-virtual {v1}, Ljava/net/Socket;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_a5

    invoke-virtual {v1}, Ljava/net/Socket;->isClosed()Z

    move-result v2

    if-nez v2, :cond_a5

    .line 130
    const-wide/16 v2, 0x7d0

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_a4
    .catchall {:try_start_a .. :try_end_a4} :catchall_a6

    goto :goto_8f

    .line 132
    :cond_a5
    goto :goto_ab

    .line 133
    :catchall_a6
    move-exception v1

    .line 100
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_2

    .line 136
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

    .line 139
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    .line 140
    array-length v0, p2

    add-int/lit8 v0, v0, 0x8

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 141
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 142
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 143
    array-length p1, p2

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 144
    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 145
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 146
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    .line 147
    return-void
.end method

.method public static start(Landroid/content/Context;Ljava/lang/String;)V
    .registers 16

    .line 27
    const-string v0, "start_time"

    const-string v1, "Playing NetherSX2 - "

    const-string v2, "state"

    const-string v3, "details"

    const-string v4, "name"

    const-string v5, "NetherSX2"

    if-eqz p1, :cond_135

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_16

    goto/16 :goto_135

    .line 29
    :cond_16
    const-string v6, "DiscordRpc"

    const/4 v7, 0x1

    if-eqz p0, :cond_34

    .line 31
    :try_start_1b
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v8

    .line 32
    const-string v9, "UI/EnableDiscordRpc"

    invoke-interface {v8, v9, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-nez v8, :cond_2d

    .line 33
    const-string v8, "Discord RPC disabled by user setting"

    invoke-static {v6, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2c
    .catchall {:try_start_1b .. :try_end_2c} :catchall_2e

    .line 34
    return-void

    .line 38
    :cond_2d
    goto :goto_34

    .line 36
    :catchall_2e
    move-exception v8

    .line 37
    const-string v9, "Failed to read Discord RPC preference"

    invoke-static {v6, v9, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 41
    :cond_34
    :goto_34
    invoke-static {p1}, Lxyz/aethersx2/android/FileHelper;->getFileNameForPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 42
    const-string v8, ".iso"

    invoke-virtual {p1, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_60

    const-string v8, ".chd"

    invoke-virtual {p1, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_60

    const-string v8, ".cso"

    invoke-virtual {p1, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_60

    .line 43
    const-string v8, ".bin"

    invoke-virtual {p1, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_60

    const-string v8, ".gz"

    invoke-virtual {p1, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_6d

    .line 44
    :cond_60
    const/16 v8, 0x2e

    invoke-virtual {p1, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v8

    .line 45
    if-lez v8, :cond_6d

    const/4 v9, 0x0

    invoke-virtual {p1, v9, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 47
    :cond_6d
    const-string v8, "%20"

    const-string v9, " "

    invoke-virtual {p1, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 48
    sput-object p1, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    sput-wide v8, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    .line 50
    sput-boolean v7, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    .line 52
    if-eqz p0, :cond_11e

    .line 54
    :try_start_88
    new-instance v8, Landroid/content/Intent;

    const-string v9, "com.my.discordrp.ACTION_SET_PRESENCE"

    invoke-direct {v8, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 55
    const/16 v9, 0x20

    invoke-virtual {v8, v9}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 56
    const-string v12, "application_name"

    invoke-virtual {v8, v12, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 57
    invoke-virtual {v8, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 58
    invoke-virtual {v8, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 59
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v2, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 60
    sget-wide v12, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    mul-long v12, v12, v10

    invoke-virtual {v8, v0, v12, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 61
    const-string v12, "large_image"

    const-string v13, "nethersx2"

    invoke-virtual {v8, v12, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 62
    const-string v12, "large_text"

    invoke-virtual {v8, v12, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 63
    invoke-virtual {p0, v8}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_c9
    .catchall {:try_start_88 .. :try_end_c9} :catchall_118

    .line 66
    :try_start_c9
    new-instance v12, Landroid/content/Intent;

    invoke-direct {v12, v8}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 67
    const-string v8, "com.my.discordrp"

    invoke-virtual {v12, v8}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 68
    invoke-virtual {p0, v12}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_d6
    .catchall {:try_start_c9 .. :try_end_d6} :catchall_d7

    goto :goto_d8

    .line 69
    :catchall_d7
    move-exception v8

    :goto_d8
    nop

    .line 71
    :try_start_d9
    new-instance v8, Landroid/content/Intent;

    const-string v12, "com.discord.SET_ACTIVITY"

    invoke-direct {v8, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 72
    invoke-virtual {v8, v9}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 73
    invoke-virtual {v8, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 74
    invoke-virtual {v8, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 75
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v8, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 76
    sget-wide v1, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    mul-long v1, v1, v10

    invoke-virtual {v8, v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 77
    invoke-virtual {p0, v8}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_107
    .catchall {:try_start_d9 .. :try_end_107} :catchall_118

    .line 80
    :try_start_107
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1, v8}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 81
    const-string v0, "com.discord"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 82
    invoke-virtual {p0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_114
    .catchall {:try_start_107 .. :try_end_114} :catchall_115

    goto :goto_116

    .line 83
    :catchall_115
    move-exception p0

    :goto_116
    nop

    .line 86
    goto :goto_11e

    .line 84
    :catchall_118
    move-exception p0

    .line 85
    const-string p1, "Failed to send broadcast"

    invoke-static {v6, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 89
    :cond_11e
    :goto_11e
    new-instance p0, Ljava/lang/Thread;

    new-instance p1, Lxyz/aethersx2/android/DiscordRpcManager$1;

    invoke-direct {p1}, Lxyz/aethersx2/android/DiscordRpcManager$1;-><init>()V

    const-string v0, "DiscordRpcThread"

    invoke-direct {p0, p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    sput-object p0, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;

    .line 95
    invoke-virtual {p0, v7}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 96
    sget-object p0, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;

    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 97
    return-void

    .line 27
    :cond_135
    :goto_135
    return-void
.end method

.method public static stop(Landroid/content/Context;)V
    .registers 3

    .line 178
    const/4 v0, 0x0

    sput-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    .line 179
    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sSocket:Ljava/net/Socket;

    if-eqz v0, :cond_10

    .line 181
    :try_start_7
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_a
    .catchall {:try_start_7 .. :try_end_a} :catchall_b

    goto :goto_c

    .line 182
    :catchall_b
    move-exception v0

    :goto_c
    nop

    .line 183
    const/4 v0, 0x0

    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sSocket:Ljava/net/Socket;

    .line 185
    :cond_10
    if-eqz p0, :cond_31

    .line 187
    :try_start_12
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.my.discordrp.ACTION_CLEAR_PRESENCE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 188
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 189
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 191
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 192
    const-string v0, "com.my.discordrp"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 193
    invoke-virtual {p0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_2e
    .catchall {:try_start_12 .. :try_end_2e} :catchall_2f

    goto :goto_30

    .line 194
    :catchall_2f
    move-exception p0

    :goto_30
    nop

    .line 196
    :cond_31
    return-void
.end method
