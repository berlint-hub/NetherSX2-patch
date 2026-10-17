.class public Lxyz/aethersx2/android/DiscordRpcManager;
.super Ljava/lang/Object;
.source "DiscordRpcManager.java"


# static fields
.field private static final CLIENT_ID:Ljava/lang/String; = "1196160538965807185"

.field private static final TAG:Ljava/lang/String; = "DiscordRpc"

.field private static sCurrentGame:Ljava/lang/String;

.field private static sMediaSession:Landroid/media/session/MediaSession;

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

    .line 26
    const/4 v0, 0x0

    sput-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    .line 27
    const/4 v0, 0x0

    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;

    .line 28
    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sSocket:Ljava/net/Socket;

    .line 29
    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;

    .line 30
    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    .line 31
    const-wide/16 v0, 0x0

    sput-wide v0, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static escapeJson(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 240
    if-nez p0, :cond_5

    const-string p0, ""

    return-object p0

    .line 241
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

    .line 217
    const/16 v0, 0x8

    new-array v1, v0, [B

    .line 218
    const/4 v2, 0x0

    move v3, v2

    .line 219
    :goto_6
    if-ge v3, v0, :cond_13

    .line 220
    rsub-int/lit8 v4, v3, 0x8

    invoke-virtual {p0, v1, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    .line 221
    if-gez v4, :cond_11

    return-void

    .line 222
    :cond_11
    add-int/2addr v3, v4

    .line 223
    goto :goto_6

    .line 224
    :cond_13
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 225
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 226
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 227
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 228
    if-lez v0, :cond_39

    const/high16 v1, 0x10000

    if-ge v0, v1, :cond_39

    .line 229
    new-array v1, v0, [B

    .line 230
    nop

    .line 231
    :goto_2c
    if-ge v2, v0, :cond_39

    .line 232
    sub-int v3, v0, v2

    invoke-virtual {p0, v1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    .line 233
    if-gez v3, :cond_37

    return-void

    .line 234
    :cond_37
    add-int/2addr v2, v3

    .line 235
    goto :goto_2c

    .line 237
    :cond_39
    return-void
.end method

.method private static runRpcLoop()V
    .registers 10

    .line 167
    const/16 v0, 0x193f

    :goto_2
    const/16 v1, 0x1948

    if-gt v0, v1, :cond_ab

    sget-boolean v1, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    if-eqz v1, :cond_ab

    .line 169
    :try_start_a
    new-instance v1, Ljava/net/Socket;

    invoke-direct {v1}, Ljava/net/Socket;-><init>()V

    .line 170
    new-instance v2, Ljava/net/InetSocketAddress;

    const-string v3, "127.0.0.1"

    invoke-direct {v2, v3, v0}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    const/16 v3, 0x190

    invoke-virtual {v1, v2, v3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 171
    sput-object v1, Lxyz/aethersx2/android/DiscordRpcManager;->sSocket:Ljava/net/Socket;

    .line 172
    invoke-virtual {v1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    .line 173
    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .line 175
    const-string v4, "{\"v\":1,\"client_id\":\"1196160538965807185\"}"

    .line 176
    const/4 v5, 0x0

    invoke-static {v2, v5, v4}, Lxyz/aethersx2/android/DiscordRpcManager;->sendFrame(Ljava/io/OutputStream;ILjava/lang/String;)V

    .line 177
    invoke-static {v3}, Lxyz/aethersx2/android/DiscordRpcManager;->readFrame(Ljava/io/InputStream;)V

    .line 179
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    .line 180
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

    .line 181
    nop

    .line 186
    invoke-static {v4}, Lxyz/aethersx2/android/DiscordRpcManager;->escapeJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    .line 187
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

    .line 194
    const/4 v4, 0x1

    invoke-static {v2, v4, v3}, Lxyz/aethersx2/android/DiscordRpcManager;->sendFrame(Ljava/io/OutputStream;ILjava/lang/String;)V

    .line 196
    :goto_8f
    sget-boolean v2, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    if-eqz v2, :cond_a5

    invoke-virtual {v1}, Ljava/net/Socket;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_a5

    invoke-virtual {v1}, Ljava/net/Socket;->isClosed()Z

    move-result v2

    if-nez v2, :cond_a5

    .line 197
    const-wide/16 v2, 0x7d0

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_a4
    .catchall {:try_start_a .. :try_end_a4} :catchall_a6

    goto :goto_8f

    .line 199
    :cond_a5
    goto :goto_ab

    .line 200
    :catchall_a6
    move-exception v1

    .line 167
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_2

    .line 203
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

    .line 206
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    .line 207
    array-length v0, p2

    add-int/lit8 v0, v0, 0x8

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 208
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 209
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 210
    array-length p1, p2

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 211
    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 212
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 213
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    .line 214
    return-void
.end method

.method public static start(Landroid/content/Context;Ljava/lang/String;)V
    .registers 18

    .line 34
    move-object/from16 v1, p0

    const-string v2, "start_time"

    const-string v3, "Playing NetherSX2 - "

    const-string v4, "state"

    const-string v5, "details"

    const-string v6, "name"

    const-string v7, "NetherSX2"

    if-eqz p1, :cond_279

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_18

    goto/16 :goto_279

    .line 36
    :cond_18
    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;

    const/4 v8, 0x0

    const/4 v9, 0x0

    if-eqz v0, :cond_2b

    .line 38
    :try_start_1e
    invoke-virtual {v0, v8}, Landroid/media/session/MediaSession;->setActive(Z)V

    .line 39
    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;

    invoke-virtual {v0}, Landroid/media/session/MediaSession;->release()V
    :try_end_26
    .catchall {:try_start_1e .. :try_end_26} :catchall_27

    goto :goto_28

    .line 40
    :catchall_27
    move-exception v0

    :goto_28
    nop

    .line 41
    sput-object v9, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;

    .line 44
    :cond_2b
    const/4 v10, 0x1

    const-string v11, "DiscordRpc"

    if-eqz v1, :cond_49

    .line 46
    :try_start_30
    invoke-static/range {p0 .. p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 47
    const-string v12, "UI/EnableDiscordRpc"

    invoke-interface {v0, v12, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_42

    .line 48
    const-string v0, "Discord RPC disabled by user setting"

    invoke-static {v11, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_41
    .catchall {:try_start_30 .. :try_end_41} :catchall_43

    .line 49
    return-void

    .line 53
    :cond_42
    goto :goto_49

    .line 51
    :catchall_43
    move-exception v0

    .line 52
    const-string v12, "Failed to read Discord RPC preference"

    invoke-static {v11, v12, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 56
    :cond_49
    :goto_49
    invoke-static/range {p1 .. p1}, Lxyz/aethersx2/android/FileHelper;->getFileNameForPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 57
    const-string v12, ".iso"

    invoke-virtual {v0, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_75

    const-string v12, ".chd"

    invoke-virtual {v0, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_75

    const-string v12, ".cso"

    invoke-virtual {v0, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_75

    .line 58
    const-string v12, ".bin"

    invoke-virtual {v0, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_75

    const-string v12, ".gz"

    invoke-virtual {v0, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_81

    .line 59
    :cond_75
    const/16 v12, 0x2e

    invoke-virtual {v0, v12}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v12

    .line 60
    if-lez v12, :cond_81

    invoke-virtual {v0, v8, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 62
    :cond_81
    const-string v8, "%20"

    const-string v12, " "

    invoke-virtual {v0, v8, v12}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 63
    sput-object v8, Lxyz/aethersx2/android/DiscordRpcManager;->sCurrentGame:Ljava/lang/String;

    .line 64
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    const-wide/16 v14, 0x3e8

    div-long/2addr v12, v14

    sput-wide v12, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    .line 65
    sput-boolean v10, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    .line 67
    if-eqz v1, :cond_261

    .line 69
    :try_start_9c
    new-instance v12, Landroid/media/session/MediaSession;

    invoke-direct {v12, v1, v7}, Landroid/media/session/MediaSession;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 70
    new-instance v13, Landroid/media/MediaMetadata$Builder;

    invoke-direct {v13}, Landroid/media/MediaMetadata$Builder;-><init>()V

    .line 71
    const-string v0, "android.media.metadata.TITLE"

    invoke-virtual {v13, v0, v8}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    .line 72
    const-string v0, "android.media.metadata.ARTIST"

    const-string v14, "PlayStation 2"

    invoke-virtual {v13, v0, v14}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    .line 73
    const-string v0, "android.media.metadata.ALBUM"

    invoke-virtual {v13, v0, v7}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    .line 74
    const-string v0, "android.media.metadata.DISPLAY_TITLE"

    invoke-virtual {v13, v0, v8}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    .line 75
    const-string v0, "android.media.metadata.DISPLAY_SUBTITLE"

    const-string v14, "Playing on NetherSX2"

    invoke-virtual {v13, v0, v14}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    .line 76
    const-string v0, "android.media.metadata.DURATION"

    const-wide/32 v14, 0x5265c00

    invoke-virtual {v13, v0, v14, v15}, Landroid/media/MediaMetadata$Builder;->putLong(Ljava/lang/String;J)Landroid/media/MediaMetadata$Builder;
    :try_end_cb
    .catchall {:try_start_9c .. :try_end_cb} :catchall_1c3

    .line 79
    nop

    .line 80
    :try_start_cc
    invoke-static {}, Lxyz/aethersx2/android/NativeLibrary;->getCoversDirectory()Ljava/lang/String;

    move-result-object v0
    :try_end_d0
    .catchall {:try_start_cc .. :try_end_d0} :catchall_180

    .line 81
    const-string v14, ".png"

    const-string v15, ".jpg"

    if-eqz v0, :cond_117

    .line 82
    :try_start_d6
    new-instance v10, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v10, v0, v9}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_108

    new-instance v10, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v10, v0, v9}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    :cond_108
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_117

    .line 85
    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_118

    .line 88
    :cond_117
    const/4 v0, 0x0

    :goto_118
    if-nez v0, :cond_16f

    .line 89
    new-instance v9, Ljava/io/File;

    const/4 v10, 0x0

    invoke-virtual {v1, v10}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v10

    move-object/from16 p1, v0

    const-string v0, "covers"

    invoke-direct {v9, v10, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 90
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_171

    .line 91
    new-instance v0, Ljava/io/File;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v0, v9, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 92
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_160

    new-instance v0, Ljava/io/File;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v0, v9, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 93
    :cond_160
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_171

    .line 94
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_173

    .line 88
    :cond_16f
    move-object/from16 p1, v0

    .line 98
    :cond_171
    move-object/from16 v0, p1

    :goto_173
    if-eqz v0, :cond_17f

    .line 99
    const-string v9, "android.media.metadata.ALBUM_ART"

    invoke-virtual {v13, v9, v0}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;

    .line 100
    const-string v9, "android.media.metadata.ART"

    invoke-virtual {v13, v9, v0}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;
    :try_end_17f
    .catchall {:try_start_d6 .. :try_end_17f} :catchall_180

    .line 104
    :cond_17f
    goto :goto_186

    .line 102
    :catchall_180
    move-exception v0

    .line 103
    :try_start_181
    const-string v9, "Could not load cover for MediaSession"

    invoke-static {v11, v9, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 106
    :goto_186
    invoke-virtual {v13}, Landroid/media/MediaMetadata$Builder;->build()Landroid/media/MediaMetadata;

    move-result-object v0

    invoke-virtual {v12, v0}, Landroid/media/session/MediaSession;->setMetadata(Landroid/media/MediaMetadata;)V

    .line 108
    new-instance v0, Landroid/media/session/PlaybackState$Builder;

    invoke-direct {v0}, Landroid/media/session/PlaybackState$Builder;-><init>()V

    .line 109
    const-wide/16 v9, 0x7

    invoke-virtual {v0, v9, v10}, Landroid/media/session/PlaybackState$Builder;->setActions(J)Landroid/media/session/PlaybackState$Builder;

    .line 110
    const-wide/16 v9, 0x0

    const/high16 v13, 0x3f800000    # 1.0f

    const/4 v14, 0x3

    invoke-virtual {v0, v14, v9, v10, v13}, Landroid/media/session/PlaybackState$Builder;->setState(IJF)Landroid/media/session/PlaybackState$Builder;

    .line 111
    invoke-virtual {v0}, Landroid/media/session/PlaybackState$Builder;->build()Landroid/media/session/PlaybackState;

    move-result-object v0

    invoke-virtual {v12, v0}, Landroid/media/session/MediaSession;->setPlaybackState(Landroid/media/session/PlaybackState;)V

    .line 113
    const/4 v9, 0x1

    invoke-virtual {v12, v9}, Landroid/media/session/MediaSession;->setActive(Z)V

    .line 114
    sput-object v12, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;

    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "MediaSession active for: "

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v11, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1c2
    .catchall {:try_start_181 .. :try_end_1c2} :catchall_1c3

    .line 118
    goto :goto_1c9

    .line 116
    :catchall_1c3
    move-exception v0

    .line 117
    const-string v9, "Failed to start MediaSession"

    invoke-static {v11, v9, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 121
    :goto_1c9
    :try_start_1c9
    new-instance v0, Landroid/content/Intent;

    const-string v9, "com.my.discordrp.ACTION_SET_PRESENCE"

    invoke-direct {v0, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 122
    const/16 v9, 0x20

    invoke-virtual {v0, v9}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 123
    const-string v10, "application_name"

    invoke-virtual {v0, v10, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 124
    invoke-virtual {v0, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 125
    invoke-virtual {v0, v5, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 126
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v4, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 127
    sget-wide v12, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    const-wide/16 v14, 0x3e8

    mul-long/2addr v12, v14

    invoke-virtual {v0, v2, v12, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 128
    const-string v10, "large_image"

    const-string v12, "nethersx2"

    invoke-virtual {v0, v10, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 129
    const-string v10, "large_text"

    invoke-virtual {v0, v10, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 130
    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_20b
    .catchall {:try_start_1c9 .. :try_end_20b} :catchall_25b

    .line 133
    :try_start_20b
    new-instance v10, Landroid/content/Intent;

    invoke-direct {v10, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 134
    const-string v0, "com.my.discordrp"

    invoke-virtual {v10, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 135
    invoke-virtual {v1, v10}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_218
    .catchall {:try_start_20b .. :try_end_218} :catchall_219

    goto :goto_21a

    .line 136
    :catchall_219
    move-exception v0

    :goto_21a
    nop

    .line 138
    :try_start_21b
    new-instance v0, Landroid/content/Intent;

    const-string v10, "com.discord.SET_ACTIVITY"

    invoke-direct {v0, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 139
    invoke-virtual {v0, v9}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 140
    invoke-virtual {v0, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 141
    invoke-virtual {v0, v5, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 142
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 143
    sget-wide v3, Lxyz/aethersx2/android/DiscordRpcManager;->sStartTimeSeconds:J

    const-wide/16 v5, 0x3e8

    mul-long/2addr v3, v5

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 144
    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_24a
    .catchall {:try_start_21b .. :try_end_24a} :catchall_25b

    .line 147
    :try_start_24a
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 148
    const-string v0, "com.discord"

    invoke-virtual {v2, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 149
    invoke-virtual {v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_257
    .catchall {:try_start_24a .. :try_end_257} :catchall_258

    goto :goto_259

    .line 150
    :catchall_258
    move-exception v0

    :goto_259
    nop

    .line 153
    goto :goto_261

    .line 151
    :catchall_25b
    move-exception v0

    .line 152
    const-string v1, "Failed to send broadcast"

    invoke-static {v11, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 156
    :cond_261
    :goto_261
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lxyz/aethersx2/android/DiscordRpcManager$1;

    invoke-direct {v1}, Lxyz/aethersx2/android/DiscordRpcManager$1;-><init>()V

    const-string v2, "DiscordRpcThread"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    sput-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;

    .line 162
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 163
    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sWorkerThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 164
    return-void

    .line 34
    :cond_279
    :goto_279
    return-void
.end method

.method public static stop(Landroid/content/Context;)V
    .registers 4

    .line 245
    const/4 v0, 0x0

    sput-boolean v0, Lxyz/aethersx2/android/DiscordRpcManager;->sRunning:Z

    .line 246
    sget-object v1, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;

    const/4 v2, 0x0

    if-eqz v1, :cond_15

    .line 248
    :try_start_8
    invoke-virtual {v1, v0}, Landroid/media/session/MediaSession;->setActive(Z)V

    .line 249
    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;

    invoke-virtual {v0}, Landroid/media/session/MediaSession;->release()V
    :try_end_10
    .catchall {:try_start_8 .. :try_end_10} :catchall_11

    goto :goto_12

    .line 250
    :catchall_11
    move-exception v0

    :goto_12
    nop

    .line 251
    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sMediaSession:Landroid/media/session/MediaSession;

    .line 253
    :cond_15
    sget-object v0, Lxyz/aethersx2/android/DiscordRpcManager;->sSocket:Ljava/net/Socket;

    if-eqz v0, :cond_21

    .line 255
    :try_start_19
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_1d

    goto :goto_1e

    .line 256
    :catchall_1d
    move-exception v0

    :goto_1e
    nop

    .line 257
    sput-object v2, Lxyz/aethersx2/android/DiscordRpcManager;->sSocket:Ljava/net/Socket;

    .line 259
    :cond_21
    if-eqz p0, :cond_42

    .line 261
    :try_start_23
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.my.discordrp.ACTION_CLEAR_PRESENCE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 262
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 263
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 265
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 266
    const-string v0, "com.my.discordrp"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 267
    invoke-virtual {p0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_3f
    .catchall {:try_start_23 .. :try_end_3f} :catchall_40

    goto :goto_41

    .line 268
    :catchall_40
    move-exception p0

    :goto_41
    nop

    .line 270
    :cond_42
    return-void
.end method
