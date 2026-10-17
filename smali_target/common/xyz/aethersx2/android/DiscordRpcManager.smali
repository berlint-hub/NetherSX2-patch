.class public Lxyz/aethersx2/android/DiscordRpcManager;
.super Ljava/lang/Object;
.source "DiscordRpcManager.java"


# static fields
.field private static final DEFAULT_CLIENT_ID:Ljava/lang/String; = "1560829866645917746"

.field private static final TAG:Ljava/lang/String; = "DiscordRpc"

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

    .line 31
    const/4 v0, 0x0

    sput-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    .line 32
    const/4 v0, 0x0

    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;

    .line 33
    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sLocalSocket:Ljava/net/Socket;

    .line 34
    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sGatewaySocket:Ljava/net/Socket;

    .line 35
    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;

    .line 36
    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    .line 37
    const-wide/16 v0, 0x0

    sput-wide v0, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static escapeJson(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 420
    if-nez p0, :cond_5

    const-string p0, ""

    return-object p0

    .line 421
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

.method private static readIpcFrame(Ljava/io/InputStream;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 397
    const/16 v0, 0x8

    new-array v1, v0, [B

    .line 398
    const/4 v2, 0x0

    move v3, v2

    .line 399
    :goto_6
    if-ge v3, v0, :cond_13

    .line 400
    rsub-int/lit8 v4, v3, 0x8

    invoke-virtual {p0, v1, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    .line 401
    if-gez v4, :cond_11

    return-void

    .line 402
    :cond_11
    add-int/2addr v3, v4

    .line 403
    goto :goto_6

    .line 404
    :cond_13
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 405
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 406
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 407
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 408
    if-lez v0, :cond_39

    const/high16 v1, 0x10000

    if-ge v0, v1, :cond_39

    .line 409
    new-array v1, v0, [B

    .line 410
    nop

    .line 411
    :goto_2c
    if-ge v2, v0, :cond_39

    .line 412
    sub-int v3, v0, v2

    invoke-virtual {p0, v1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    .line 413
    if-gez v3, :cond_37

    return-void

    .line 414
    :cond_37
    add-int/2addr v2, v3

    .line 415
    goto :goto_2c

    .line 417
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

    .line 316
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 317
    const/4 v1, 0x0

    if-gez v0, :cond_8

    return-object v1

    .line 318
    :cond_8
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 319
    if-gez v0, :cond_f

    return-object v1

    .line 320
    :cond_f
    and-int/lit16 v2, v0, 0x80

    const/4 v3, 0x0

    if-eqz v2, :cond_16

    const/4 v2, 0x1

    goto :goto_17

    :cond_16
    move v2, v3

    .line 321
    :goto_17
    const/16 v4, 0x7f

    and-int/2addr v0, v4

    .line 322
    const/16 v5, 0x7e

    const/16 v6, 0x8

    if-ne v0, v5, :cond_2f

    .line 323
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    shl-int/2addr v0, v6

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v4

    and-int/lit16 v4, v4, 0xff

    or-int/2addr v0, v4

    goto :goto_44

    .line 324
    :cond_2f
    if-ne v0, v4, :cond_44

    .line 325
    nop

    .line 326
    const-wide/16 v4, 0x0

    move v0, v3

    :goto_35
    if-ge v0, v6, :cond_43

    shl-long/2addr v4, v6

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v7

    and-int/lit16 v7, v7, 0xff

    int-to-long v7, v7

    or-long/2addr v4, v7

    add-int/lit8 v0, v0, 0x1

    goto :goto_35

    .line 327
    :cond_43
    long-to-int v0, v4

    .line 329
    :cond_44
    :goto_44
    nop

    .line 330
    if-eqz v2, :cond_4d

    .line 331
    const/4 v1, 0x4

    new-array v1, v1, [B

    .line 332
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    .line 334
    :cond_4d
    new-array v4, v0, [B

    .line 335
    move v5, v3

    .line 336
    :goto_50
    if-ge v5, v0, :cond_5d

    .line 337
    sub-int v6, v0, v5

    invoke-virtual {p0, v4, v5, v6}, Ljava/io/InputStream;->read([BII)I

    move-result v6

    .line 338
    if-gez v6, :cond_5b

    goto :goto_5d

    .line 339
    :cond_5b
    add-int/2addr v5, v6

    .line 340
    goto :goto_50

    .line 341
    :cond_5d
    :goto_5d
    if-eqz v2, :cond_71

    if-eqz v1, :cond_71

    .line 342
    nop

    :goto_62
    if-ge v3, v0, :cond_71

    aget-byte p0, v4, v3

    rem-int/lit8 v2, v3, 0x4

    aget-byte v2, v1, v2

    xor-int/2addr p0, v2

    int-to-byte p0, p0

    aput-byte p0, v4, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_62

    .line 344
    :cond_71
    new-instance p0, Ljava/lang/String;

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p0, v4, v0}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object p0
.end method

.method private static runGatewayLoop(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 19

    .line 188
    const-string v1, "DiscordRpc"

    :goto_2
    sget-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    if-eqz v0, :cond_1c3

    .line 189
    nop

    .line 191
    const/4 v2, 0x0

    :try_start_8
    const-string v0, "Connecting to Discord Gateway..."

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocketFactory;

    .line 193
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Ljavax/net/ssl/SSLSocket;
    :try_end_1a
    .catchall {:try_start_8 .. :try_end_1a} :catchall_184

    .line 194
    :try_start_1a
    new-instance v0, Ljava/net/InetSocketAddress;

    const-string v4, "gateway.discord.gg"

    const/16 v5, 0x1bb

    invoke-direct {v0, v4, v5}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    const/16 v4, 0x1f40

    invoke-virtual {v3, v0, v4}, Ljavax/net/ssl/SSLSocket;->connect(Ljava/net/SocketAddress;I)V

    .line 195
    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 196
    sput-object v3, Lxyz/aethersx2/android/DiscordRpcManager;->sGatewaySocket:Ljava/net/Socket;

    .line 198
    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    .line 199
    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 201
    const-string v5, "GET /?v=10&encoding=json HTTP/1.1\r\nHost: gateway.discord.gg\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nSec-WebSocket-Version: 13\r\nUser-Agent: NetherSX2\r\n\r\n"

    .line 208
    sget-object v6, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v5, v6}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/OutputStream;->write([B)V

    .line 209
    invoke-virtual {v4}, Ljava/io/OutputStream;->flush()V

    .line 211
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    sget-object v7, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v6, v0, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v5, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 212
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .line 213
    if-eqz v6, :cond_162

    const-string v7, "101"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_5f

    goto/16 :goto_162

    .line 218
    :cond_5f
    :goto_5f
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_6c

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_6c

    goto :goto_5f

    .line 220
    :cond_6c
    nop

    .line 221
    invoke-static {v0}, Lxyz/aethersx2/android/DiscordRpcManager;->readWsTextFrame(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0
    :try_end_71
    .catchall {:try_start_1a .. :try_end_71} :catchall_182

    .line 222
    const-string v5, "}"

    if-eqz v0, :cond_a3

    :try_start_75
    const-string v6, "heartbeat_interval"

    invoke-virtual {v0, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_a3

    .line 223
    const-string v6, "\"heartbeat_interval\":"

    invoke-virtual {v0, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    .line 224
    if-lez v6, :cond_a3

    .line 225
    const-string v7, ","

    add-int/lit8 v8, v6, 0x15

    invoke-virtual {v0, v7, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7

    .line 226
    if-gez v7, :cond_93

    invoke-virtual {v0, v5, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7
    :try_end_93
    .catchall {:try_start_75 .. :try_end_93} :catchall_182

    .line 227
    :cond_93
    if-le v7, v6, :cond_a3

    .line 229
    :try_start_95
    invoke-virtual {v0, v8, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6
    :try_end_a1
    .catchall {:try_start_95 .. :try_end_a1} :catchall_a2

    .line 230
    goto :goto_a6

    :catchall_a2
    move-exception v0

    .line 235
    :cond_a3
    const-wide/32 v6, 0xa122

    :goto_a6
    const-wide/16 v8, 0x3e8

    if-eqz p2, :cond_c5

    :try_start_aa
    sget-wide v10, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    mul-long/2addr v10, v8

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, ",\"timestamps\":{\"start\":"

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_c7

    :cond_c5
    const-string v0, ""

    .line 236
    :goto_c7
    nop

    .line 239
    invoke-static/range {p0 .. p0}, Lxyz/aethersx2/android/DiscordRpcManager;->escapeJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 252
    invoke-static/range {p1 .. p1}, Lxyz/aethersx2/android/DiscordRpcManager;->escapeJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    sget-object v11, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    .line 253
    invoke-static {v11}, Lxyz/aethersx2/android/DiscordRpcManager;->escapeJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    sget-object v12, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    .line 254
    invoke-static {v12}, Lxyz/aethersx2/android/DiscordRpcManager;->escapeJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "{\"op\":2,\"d\":{\"token\":\""

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v13, "\",\"capabilities\":16381,\"properties\":{\"os\":\"Android\",\"browser\":\"NetherSX2\",\"device\":\"NetherSX2\"},\"presence\":{\"status\":\"online\",\"since\":0,\"activities\":[{\"name\":\"NetherSX2\",\"type\":0,\"application_id\":\""

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v10, "\",\"details\":\""

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v10, "\",\"state\":\"Playing NetherSX2 - "

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v10, "\""

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ",\"assets\":{\"large_image\":\"app\",\"large_text\":\"NetherSX2\"}}],\"afk\":false}}}"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 262
    invoke-static {v4, v0}, Lxyz/aethersx2/android/DiscordRpcManager;->sendWsTextFrame(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 263
    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Sent IDENTIFY to Discord Gateway for game: "

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 266
    :goto_13c
    sget-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    if-eqz v0, :cond_15a

    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocket;->isClosed()Z

    move-result v0

    if-nez v0, :cond_15a

    .line 267
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 268
    sub-long v14, v12, v10

    cmp-long v0, v14, v6

    if-ltz v0, :cond_156

    .line 269
    const-string v0, "{\"op\":1,\"d\":null}"

    invoke-static {v4, v0}, Lxyz/aethersx2/android/DiscordRpcManager;->sendWsTextFrame(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 270
    move-wide v10, v12

    .line 272
    :cond_156
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_159
    .catchall {:try_start_aa .. :try_end_159} :catchall_182

    .line 273
    goto :goto_13c

    .line 277
    :cond_15a
    if-eqz v3, :cond_1a7

    .line 278
    :try_start_15c
    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocket;->close()V
    :try_end_15f
    .catchall {:try_start_15c .. :try_end_15f} :catchall_160

    goto :goto_1a7

    :catchall_160
    move-exception v0

    goto :goto_1a7

    .line 214
    :cond_162
    :goto_162
    :try_start_162
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Gateway handshake failed: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_178
    .catchall {:try_start_162 .. :try_end_178} :catchall_182

    .line 277
    if-eqz v3, :cond_17f

    .line 278
    :try_start_17a
    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocket;->close()V
    :try_end_17d
    .catchall {:try_start_17a .. :try_end_17d} :catchall_17e

    goto :goto_17f

    :catchall_17e
    move-exception v0

    .line 280
    :cond_17f
    :goto_17f
    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sGatewaySocket:Ljava/net/Socket;

    .line 215
    goto :goto_1c3

    .line 274
    :catchall_182
    move-exception v0

    goto :goto_186

    :catchall_184
    move-exception v0

    move-object v3, v2

    .line 275
    :goto_186
    :try_start_186
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Discord Gateway error: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1a0
    .catchall {:try_start_186 .. :try_end_1a0} :catchall_1b7

    .line 277
    if-eqz v3, :cond_1a7

    .line 278
    :try_start_1a2
    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocket;->close()V
    :try_end_1a5
    .catchall {:try_start_1a2 .. :try_end_1a5} :catchall_1a6

    goto :goto_1a7

    :catchall_1a6
    move-exception v0

    .line 280
    :cond_1a7
    :goto_1a7
    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sGatewaySocket:Ljava/net/Socket;

    .line 281
    nop

    .line 282
    sget-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    if-eqz v0, :cond_1b5

    .line 283
    const-wide/16 v2, 0x1388

    :try_start_1b0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1b3
    .catchall {:try_start_1b0 .. :try_end_1b3} :catchall_1b4

    goto :goto_1b5

    :catchall_1b4
    move-exception v0

    .line 285
    :cond_1b5
    :goto_1b5
    goto/16 :goto_2

    .line 277
    :catchall_1b7
    move-exception v0

    move-object v1, v0

    if-eqz v3, :cond_1c0

    .line 278
    :try_start_1bb
    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocket;->close()V
    :try_end_1be
    .catchall {:try_start_1bb .. :try_end_1be} :catchall_1bf

    goto :goto_1c0

    :catchall_1bf
    move-exception v0

    .line 280
    :cond_1c0
    :goto_1c0
    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sGatewaySocket:Ljava/net/Socket;

    .line 281
    throw v1

    .line 286
    :cond_1c3
    :goto_1c3
    return-void
.end method

.method private static runLocalIpcLoop(Ljava/lang/String;)V
    .registers 11

    .line 348
    const/16 v0, 0x193f

    :goto_2
    const/16 v1, 0x1948

    if-gt v0, v1, :cond_c6

    sget-boolean v1, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    if-eqz v1, :cond_c6

    .line 350
    :try_start_a
    new-instance v1, Ljava/net/Socket;

    invoke-direct {v1}, Ljava/net/Socket;-><init>()V

    .line 351
    new-instance v2, Ljava/net/InetSocketAddress;

    const-string v3, "127.0.0.1"

    invoke-direct {v2, v3, v0}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    const/16 v3, 0x190

    invoke-virtual {v1, v2, v3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 352
    sput-object v1, Lxyz/aethersx2/android/DiscordRpcManager;->sLocalSocket:Ljava/net/Socket;

    .line 353
    invoke-virtual {v1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    .line 354
    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .line 356
    invoke-static {p0}, Lxyz/aethersx2/android/DiscordRpcManager;->escapeJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "{\"v\":1,\"client_id\":\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\"}"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 357
    const/4 v5, 0x0

    invoke-static {v2, v5, v4}, Lxyz/aethersx2/android/DiscordRpcManager;->sendIpcFrame(Ljava/io/OutputStream;ILjava/lang/String;)V

    .line 358
    invoke-static {v3}, Lxyz/aethersx2/android/DiscordRpcManager;->readIpcFrame(Ljava/io/InputStream;)V

    .line 360
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    .line 361
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

    .line 362
    nop

    .line 367
    invoke-static {v4}, Lxyz/aethersx2/android/DiscordRpcManager;->escapeJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    .line 368
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

    const-string v4, "},\"assets\":{\"large_image\":\"app\",\"large_text\":\"NetherSX2\"}}},\"nonce\":\"1\"}"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 375
    const/4 v4, 0x1

    invoke-static {v2, v4, v3}, Lxyz/aethersx2/android/DiscordRpcManager;->sendIpcFrame(Ljava/io/OutputStream;ILjava/lang/String;)V

    .line 377
    :goto_aa
    sget-boolean v2, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    if-eqz v2, :cond_c0

    invoke-virtual {v1}, Ljava/net/Socket;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_c0

    invoke-virtual {v1}, Ljava/net/Socket;->isClosed()Z

    move-result v2

    if-nez v2, :cond_c0

    .line 378
    const-wide/16 v2, 0x7d0

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_bf
    .catchall {:try_start_a .. :try_end_bf} :catchall_c1

    goto :goto_aa

    .line 380
    :cond_c0
    goto :goto_c6

    .line 381
    :catchall_c1
    move-exception v1

    .line 348
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_2

    .line 383
    :cond_c6
    :goto_c6
    return-void
.end method

.method private static sendIpcFrame(Ljava/io/OutputStream;ILjava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 386
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    .line 387
    array-length v0, p2

    add-int/lit8 v0, v0, 0x8

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 388
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 389
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 390
    array-length p1, p2

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 391
    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 392
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 393
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    .line 394
    return-void
.end method

.method private static sendWsTextFrame(Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 289
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    .line 290
    array-length v0, p1

    .line 291
    const/4 v1, 0x4

    new-array v1, v1, [B

    fill-array-data v1, :array_6c

    .line 293
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 294
    const/16 v3, 0x81

    invoke-virtual {v2, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 295
    const/16 v3, 0x7e

    if-ge v0, v3, :cond_21

    .line 296
    or-int/lit16 v3, v0, 0x80

    invoke-virtual {v2, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_4d

    .line 297
    :cond_21
    const v3, 0xffff

    const/16 v4, 0xff

    if-gt v0, v3, :cond_39

    .line 298
    const/16 v3, 0xfe

    invoke-virtual {v2, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 299
    shr-int/lit8 v3, v0, 0x8

    and-int/2addr v3, v4

    invoke-virtual {v2, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 300
    and-int/lit16 v3, v0, 0xff

    invoke-virtual {v2, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_4d

    .line 302
    :cond_39
    invoke-virtual {v2, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 303
    const/4 v3, 0x7

    :goto_3d
    if-ltz v3, :cond_4d

    .line 304
    int-to-long v4, v0

    mul-int/lit8 v6, v3, 0x8

    shr-long/2addr v4, v6

    const-wide/16 v6, 0xff

    and-long/2addr v4, v6

    long-to-int v4, v4

    invoke-virtual {v2, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 303
    add-int/lit8 v3, v3, -0x1

    goto :goto_3d

    .line 307
    :cond_4d
    :goto_4d
    invoke-virtual {v2, v1}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 308
    const/4 v3, 0x0

    :goto_51
    if-ge v3, v0, :cond_60

    .line 309
    aget-byte v4, p1, v3

    rem-int/lit8 v5, v3, 0x4

    aget-byte v5, v1, v5

    xor-int/2addr v4, v5

    invoke-virtual {v2, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 308
    add-int/lit8 v3, v3, 0x1

    goto :goto_51

    .line 311
    :cond_60
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 312
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    .line 313
    return-void

    nop

    :array_6c
    .array-data 1
        0x12t
        0x34t
        0x56t
        0x78t
    .end array-data
.end method

.method public static start(Landroid/content/Context;Ljava/lang/String;)V
    .registers 23

    .line 40
    move-object/from16 v1, p0

    const-string v2, "start_time"

    const-string v3, "Playing NetherSX2 - "

    const-string v4, "state"

    const-string v5, "details"

    const-string v6, "name"

    const-string v7, "NetherSX2"

    if-eqz p1, :cond_2e2

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_18

    goto/16 :goto_2e2

    .line 42
    :cond_18
    invoke-static/range {p0 .. p0}, Lxyz/aethersx2/android/DiscordRpcManager;->stop(Landroid/content/Context;)V

    .line 44
    nop

    .line 45
    nop

    .line 46
    nop

    .line 47
    nop

    .line 48
    nop

    .line 50
    const-string v8, ""

    const-string v9, "1560829866645917746"

    const-string v10, "DiscordRpc"

    const/4 v11, 0x1

    if-eqz v1, :cond_72

    .line 52
    :try_start_29
    invoke-static/range {p0 .. p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 53
    const-string v12, "UI/EnableDiscordRpc"

    invoke-interface {v0, v12, v11}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    .line 54
    if-nez v12, :cond_3b

    .line 55
    const-string v0, "Discord RPC disabled by user setting"

    invoke-static {v10, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    return-void

    .line 58
    :cond_3b
    const-string v12, "UI/DiscordToken"

    invoke-interface {v0, v12, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 59
    const-string v12, "UI/DiscordClientId"

    invoke-interface {v0, v12, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12
    :try_end_4f
    .catchall {:try_start_29 .. :try_end_4f} :catchall_69

    .line 60
    :try_start_4f
    invoke-virtual {v12}, Ljava/lang/String;->isEmpty()Z

    move-result v13
    :try_end_53
    .catchall {:try_start_4f .. :try_end_53} :catchall_66

    if-eqz v13, :cond_56

    goto :goto_57

    :cond_56
    move-object v9, v12

    .line 61
    :goto_57
    :try_start_57
    const-string v12, "UI/DiscordShowTime"

    invoke-interface {v0, v12, v11}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12
    :try_end_5d
    .catchall {:try_start_57 .. :try_end_5d} :catchall_69

    .line 62
    :try_start_5d
    const-string v13, "UI/EnableMediaSessionRpc"

    invoke-interface {v0, v13, v11}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0
    :try_end_63
    .catchall {:try_start_5d .. :try_end_63} :catchall_64

    .line 65
    goto :goto_74

    .line 63
    :catchall_64
    move-exception v0

    goto :goto_6b

    :catchall_66
    move-exception v0

    move-object v9, v12

    goto :goto_6a

    :catchall_69
    move-exception v0

    :goto_6a
    move v12, v11

    .line 64
    :goto_6b
    const-string v13, "Failed to read Discord RPC preference"

    invoke-static {v10, v13, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v0, v11

    goto :goto_74

    .line 50
    :cond_72
    move v0, v11

    move v12, v0

    .line 68
    :goto_74
    invoke-static/range {p1 .. p1}, Lxyz/aethersx2/android/FileHelper;->getFileNameForPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 69
    const-string v14, ".iso"

    invoke-virtual {v13, v14}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_a0

    const-string v14, ".chd"

    invoke-virtual {v13, v14}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_a0

    const-string v14, ".cso"

    invoke-virtual {v13, v14}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_a0

    .line 70
    const-string v14, ".bin"

    invoke-virtual {v13, v14}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_a0

    const-string v14, ".gz"

    invoke-virtual {v13, v14}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_ad

    .line 71
    :cond_a0
    const/16 v14, 0x2e

    invoke-virtual {v13, v14}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v14

    .line 72
    if-lez v14, :cond_ad

    const/4 v15, 0x0

    invoke-virtual {v13, v15, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    .line 74
    :cond_ad
    const-string v14, "%20"

    const-string v15, " "

    invoke-virtual {v13, v14, v15}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-static {v1, v0}, Lxyz/aethersx2/android/GameDataResolver;->resolveGameTitle(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 75
    sput-object v13, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    .line 76
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    div-long v14, v14, v16

    sput-wide v14, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    .line 77
    sput-boolean v11, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    .line 79
    if-eqz v1, :cond_2bb

    if-eqz v0, :cond_2bb

    .line 81
    :try_start_cb
    new-instance v14, Landroid/media/session/MediaSession;

    invoke-direct {v14, v1, v7}, Landroid/media/session/MediaSession;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 82
    new-instance v15, Landroid/media/MediaMetadata$Builder;

    invoke-direct {v15}, Landroid/media/MediaMetadata$Builder;-><init>()V

    .line 83
    const-string v0, "android.media.metadata.TITLE"

    invoke-virtual {v15, v0, v13}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    .line 84
    const-string v0, "android.media.metadata.ARTIST"

    const-string v11, "PlayStation 2"

    invoke-virtual {v15, v0, v11}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    .line 85
    const-string v0, "android.media.metadata.ALBUM"

    invoke-virtual {v15, v0, v7}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    .line 86
    const-string v0, "android.media.metadata.DISPLAY_TITLE"

    invoke-virtual {v15, v0, v13}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    .line 87
    const-string v0, "android.media.metadata.DISPLAY_SUBTITLE"

    const-string v11, "Playing on NetherSX2"

    invoke-virtual {v15, v0, v11}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;
    :try_end_f2
    .catchall {:try_start_cb .. :try_end_f2} :catchall_218

    .line 88
    if-eqz v12, :cond_10c

    .line 89
    :try_start_f4
    const-string v0, "android.media.metadata.DURATION"
    :try_end_f6
    .catchall {:try_start_f4 .. :try_end_f6} :catchall_105

    move-object v11, v8

    move-object/from16 v18, v9

    const-wide/32 v8, 0x5265c00

    :try_start_fc
    invoke-virtual {v15, v0, v8, v9}, Landroid/media/MediaMetadata$Builder;->putLong(Ljava/lang/String;J)Landroid/media/MediaMetadata$Builder;
    :try_end_ff
    .catchall {:try_start_fc .. :try_end_ff} :catchall_100

    goto :goto_10f

    .line 130
    :catchall_100
    move-exception v0

    move-object/from16 p1, v11

    goto/16 :goto_21d

    :catchall_105
    move-exception v0

    move-object/from16 v18, v9

    move-object/from16 p1, v8

    goto/16 :goto_21d

    .line 88
    :cond_10c
    move-object v11, v8

    move-object/from16 v18, v9

    .line 93
    :goto_10f
    nop

    .line 94
    :try_start_110
    invoke-static {}, Lxyz/aethersx2/android/NativeLibrary;->getCoversDirectory()Ljava/lang/String;

    move-result-object v0
    :try_end_114
    .catchall {:try_start_110 .. :try_end_114} :catchall_1cf

    .line 95
    const-string v8, ".png"

    const-string v9, ".jpg"

    move-object/from16 p1, v11

    if-eqz v0, :cond_162

    .line 96
    :try_start_11c
    new-instance v11, Ljava/io/File;
    :try_end_11e
    .catchall {:try_start_11c .. :try_end_11e} :catchall_15f

    move/from16 v20, v12

    :try_start_120
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v0, v12}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v12

    if-nez v12, :cond_150

    new-instance v11, Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v0, v12}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    :cond_150
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_164

    .line 99
    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_165

    .line 116
    :catchall_15f
    move-exception v0

    goto/16 :goto_1d2

    .line 95
    :cond_162
    move/from16 v20, v12

    .line 102
    :cond_164
    const/4 v0, 0x0

    :goto_165
    if-nez v0, :cond_1be

    .line 103
    new-instance v11, Ljava/io/File;

    const/4 v12, 0x0

    invoke-virtual {v1, v12}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v12

    move-object/from16 v19, v0

    const-string v0, "covers"

    invoke-direct {v11, v12, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 104
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1c0

    .line 105
    new-instance v0, Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v0, v11, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 106
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_1ad

    new-instance v0, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v0, v11, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 107
    :cond_1ad
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_1c0

    .line 108
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_1c2

    .line 116
    :catchall_1bc
    move-exception v0

    goto :goto_1d4

    .line 102
    :cond_1be
    move-object/from16 v19, v0

    .line 112
    :cond_1c0
    move-object/from16 v0, v19

    :goto_1c2
    if-eqz v0, :cond_1ce

    .line 113
    const-string v8, "android.media.metadata.ALBUM_ART"

    invoke-virtual {v15, v8, v0}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;

    .line 114
    const-string v8, "android.media.metadata.ART"

    invoke-virtual {v15, v8, v0}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;
    :try_end_1ce
    .catchall {:try_start_120 .. :try_end_1ce} :catchall_1bc

    .line 118
    :cond_1ce
    goto :goto_1d9

    .line 116
    :catchall_1cf
    move-exception v0

    move-object/from16 p1, v11

    :goto_1d2
    move/from16 v20, v12

    .line 117
    :goto_1d4
    :try_start_1d4
    const-string v8, "Could not load cover for MediaSession"

    invoke-static {v10, v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 120
    :goto_1d9
    invoke-virtual {v15}, Landroid/media/MediaMetadata$Builder;->build()Landroid/media/MediaMetadata;

    move-result-object v0

    invoke-virtual {v14, v0}, Landroid/media/session/MediaSession;->setMetadata(Landroid/media/MediaMetadata;)V

    .line 122
    new-instance v0, Landroid/media/session/PlaybackState$Builder;

    invoke-direct {v0}, Landroid/media/session/PlaybackState$Builder;-><init>()V

    .line 123
    const-wide/16 v8, 0x7

    invoke-virtual {v0, v8, v9}, Landroid/media/session/PlaybackState$Builder;->setActions(J)Landroid/media/session/PlaybackState$Builder;

    .line 124
    const-wide/16 v8, 0x0

    const/high16 v11, 0x3f800000    # 1.0f

    const/4 v12, 0x3

    invoke-virtual {v0, v12, v8, v9, v11}, Landroid/media/session/PlaybackState$Builder;->setState(IJF)Landroid/media/session/PlaybackState$Builder;

    .line 125
    invoke-virtual {v0}, Landroid/media/session/PlaybackState$Builder;->build()Landroid/media/session/PlaybackState;

    move-result-object v0

    invoke-virtual {v14, v0}, Landroid/media/session/MediaSession;->setPlaybackState(Landroid/media/session/PlaybackState;)V

    .line 127
    const/4 v8, 0x1

    invoke-virtual {v14, v8}, Landroid/media/session/MediaSession;->setActive(Z)V

    .line 128
    sput-object v14, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;

    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "MediaSession active for: "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v10, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_215
    .catchall {:try_start_1d4 .. :try_end_215} :catchall_216

    .line 132
    goto :goto_224

    .line 130
    :catchall_216
    move-exception v0

    goto :goto_21f

    :catchall_218
    move-exception v0

    move-object/from16 p1, v8

    move-object/from16 v18, v9

    :goto_21d
    move/from16 v20, v12

    .line 131
    :goto_21f
    const-string v8, "Failed to start MediaSession"

    invoke-static {v10, v8, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 135
    :goto_224
    :try_start_224
    new-instance v0, Landroid/content/Intent;

    const-string v8, "com.my.discordrp.ACTION_SET_PRESENCE"

    invoke-direct {v0, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 136
    const/16 v8, 0x20

    invoke-virtual {v0, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 137
    const-string v9, "application_name"

    invoke-virtual {v0, v9, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 138
    invoke-virtual {v0, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 139
    invoke-virtual {v0, v5, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 140
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v4, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 141
    sget-wide v11, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    mul-long v11, v11, v16

    invoke-virtual {v0, v2, v11, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 142
    const-string v9, "large_image"

    const-string v11, "app"

    invoke-virtual {v0, v9, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 143
    const-string v9, "large_text"

    invoke-virtual {v0, v9, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 144
    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_265
    .catchall {:try_start_224 .. :try_end_265} :catchall_2b4

    .line 147
    :try_start_265
    new-instance v9, Landroid/content/Intent;

    invoke-direct {v9, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 148
    const-string v0, "com.my.discordrp"

    invoke-virtual {v9, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 149
    invoke-virtual {v1, v9}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_272
    .catchall {:try_start_265 .. :try_end_272} :catchall_273

    goto :goto_274

    .line 150
    :catchall_273
    move-exception v0

    :goto_274
    nop

    .line 152
    :try_start_275
    new-instance v0, Landroid/content/Intent;

    const-string v9, "com.discord.SET_ACTIVITY"

    invoke-direct {v0, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 153
    invoke-virtual {v0, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 154
    invoke-virtual {v0, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 155
    invoke-virtual {v0, v5, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 156
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 157
    sget-wide v3, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    mul-long v3, v3, v16

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 158
    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_2a3
    .catchall {:try_start_275 .. :try_end_2a3} :catchall_2b4

    .line 161
    :try_start_2a3
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 162
    const-string v0, "com.discord"

    invoke-virtual {v2, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 163
    invoke-virtual {v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_2b0
    .catchall {:try_start_2a3 .. :try_end_2b0} :catchall_2b1

    goto :goto_2b2

    .line 164
    :catchall_2b1
    move-exception v0

    :goto_2b2
    nop

    .line 167
    goto :goto_2c1

    .line 165
    :catchall_2b4
    move-exception v0

    .line 166
    const-string v1, "Failed to send broadcast"

    invoke-static {v10, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2c1

    .line 79
    :cond_2bb
    move-object/from16 p1, v8

    move-object/from16 v18, v9

    move/from16 v20, v12

    .line 170
    :goto_2c1
    nop

    .line 171
    nop

    .line 172
    nop

    .line 173
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lxyz/aethersx2/android/DiscordRpcManager$1;

    move-object/from16 v8, p1

    move-object/from16 v9, v18

    move/from16 v12, v20

    invoke-direct {v1, v8, v9, v12}, Lxyz/aethersx2/android/DiscordRpcManager$1;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    const-string v2, "DiscordRpcThread"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;

    .line 183
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 184
    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 185
    return-void

    .line 40
    :cond_2e2
    :goto_2e2
    return-void
.end method

.method public static stop(Landroid/content/Context;)V
    .registers 4

    .line 425
    const/4 v0, 0x0

    sput-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    .line 426
    sget-object v1, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;

    const/4 v2, 0x0

    if-eqz v1, :cond_15

    .line 428
    :try_start_8
    invoke-virtual {v1, v0}, Landroid/media/session/MediaSession;->setActive(Z)V

    .line 429
    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;

    invoke-virtual {v0}, Landroid/media/session/MediaSession;->release()V
    :try_end_10
    .catchall {:try_start_8 .. :try_end_10} :catchall_11

    goto :goto_12

    .line 430
    :catchall_11
    move-exception v0

    :goto_12
    nop

    .line 431
    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;

    .line 433
    :cond_15
    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sGatewaySocket:Ljava/net/Socket;

    if-eqz v0, :cond_21

    .line 435
    :try_start_19
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_1d

    goto :goto_1e

    .line 436
    :catchall_1d
    move-exception v0

    :goto_1e
    nop

    .line 437
    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sGatewaySocket:Ljava/net/Socket;

    .line 439
    :cond_21
    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sLocalSocket:Ljava/net/Socket;

    if-eqz v0, :cond_2d

    .line 441
    :try_start_25
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_28
    .catchall {:try_start_25 .. :try_end_28} :catchall_29

    goto :goto_2a

    .line 442
    :catchall_29
    move-exception v0

    :goto_2a
    nop

    .line 443
    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sLocalSocket:Ljava/net/Socket;

    .line 445
    :cond_2d
    if-eqz p0, :cond_4e

    .line 447
    :try_start_2f
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.my.discordrp.ACTION_CLEAR_PRESENCE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 448
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 449
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 451
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 452
    const-string v0, "com.my.discordrp"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 453
    invoke-virtual {p0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_4b
    .catchall {:try_start_2f .. :try_end_4b} :catchall_4c

    goto :goto_4d

    .line 454
    :catchall_4c
    move-exception p0

    :goto_4d
    nop

    .line 456
    :cond_4e
    return-void
.end method
