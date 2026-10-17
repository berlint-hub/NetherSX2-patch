.class public Lxyz/aethersx2/android/GameDataResolver;
.super Ljava/lang/Object;
.source "GameDataResolver.java"


# static fields
.field private static final CAMEL_CASE_1:Ljava/util/regex/Pattern;

.field private static final CAMEL_CASE_2:Ljava/util/regex/Pattern;

.field private static final EXTENSION_PATTERN:Ljava/util/regex/Pattern;

.field private static final LETTER_NUM:Ljava/util/regex/Pattern;

.field private static final LOCK:Ljava/lang/Object;

.field private static final NUM_LETTER:Ljava/util/regex/Pattern;

.field private static final PUNCT_PATTERN:Ljava/util/regex/Pattern;

.field private static final ROMAN_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final SERIAL_PATTERN:Ljava/util/regex/Pattern;

.field private static final TAG:Ljava/lang/String; = "GameDataResolver"

.field private static final TAGS_PATTERN:Ljava/util/regex/Pattern;

.field private static final TOKEN_PATTERN:Ljava/util/regex/Pattern;

.field private static sAppContext:Landroid/content/Context;

.field private static volatile sInitialized:Z

.field private static final sNormToTitle:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sSerialToTitle:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 16
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->LOCK:Ljava/lang/Object;

    .line 17
    const/4 v0, 0x0

    sput-boolean v0, Lxyz/aethersx2/android/GameDataResolver;->sInitialized:Z

    .line 19
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x3e80

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    .line 20
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x1f40

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->sNormToTitle:Ljava/util/Map;

    .line 22
    const-string v0, "(?i)([A-Za-z]{4})[-_\\s]?([0-9]{3})[._]?([0-9]{2})|([A-Za-z]{4})[-_\\s]?([0-9]{5})"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->SERIAL_PATTERN:Ljava/util/regex/Pattern;

    .line 23
    const-string v0, "([A-Z]+)([A-Z][a-z])"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->CAMEL_CASE_1:Ljava/util/regex/Pattern;

    .line 24
    const-string v0, "([a-z0-9])([A-Z])"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->CAMEL_CASE_2:Ljava/util/regex/Pattern;

    .line 25
    const-string v0, "([A-Za-z])([0-9])"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->LETTER_NUM:Ljava/util/regex/Pattern;

    .line 26
    const-string v0, "([0-9])([A-Za-z])"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->NUM_LETTER:Ljava/util/regex/Pattern;

    .line 27
    const-string v0, "\\.(iso|chd|cso|bin|gz|cue|mdf|nrg|dump)$"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->EXTENSION_PATTERN:Ljava/util/regex/Pattern;

    .line 28
    const-string v0, "\\(.*?\\)|\\[.*?\\]|\\{.*?\\}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->TAGS_PATTERN:Ljava/util/regex/Pattern;

    .line 29
    const-string v0, "[:\\-_.,\'!&?]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->PUNCT_PATTERN:Ljava/util/regex/Pattern;

    .line 30
    const-string v0, "[a-z0-9]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->TOKEN_PATTERN:Ljava/util/regex/Pattern;

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    .line 34
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "1"

    const-string v2, "i"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "2"

    const-string v2, "ii"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "3"

    const-string v2, "iii"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "4"

    const-string v2, "iv"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "5"

    const-string v2, "v"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "6"

    const-string v2, "vi"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "7"

    const-string v2, "vii"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "8"

    const-string v2, "viii"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "9"

    const-string v2, "ix"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "10"

    const-string v2, "x"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    const/4 v0, 0x0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->sAppContext:Landroid/content/Context;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static cleanRaw(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 90
    const-string v0, ""

    if-eqz p0, :cond_22

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_b

    goto :goto_22

    .line 91
    :cond_b
    const-string v1, "%20"

    const-string v2, " "

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 92
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->EXTENSION_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 93
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 90
    :cond_22
    :goto_22
    return-object v0
.end method

.method public static ensureLoaded(Landroid/content/Context;)V
    .registers 8

    .line 139
    if-eqz p0, :cond_14

    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->sAppContext:Landroid/content/Context;

    if-nez v0, :cond_14

    .line 141
    :try_start_6
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 142
    if-eqz v0, :cond_d

    goto :goto_e

    :cond_d
    move-object v0, p0

    :goto_e
    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->sAppContext:Landroid/content/Context;
    :try_end_10
    .catchall {:try_start_6 .. :try_end_10} :catchall_11

    .line 145
    goto :goto_14

    .line 143
    :catchall_11
    move-exception v0

    .line 144
    sput-object p0, Lxyz/aethersx2/android/GameDataResolver;->sAppContext:Landroid/content/Context;

    .line 147
    :cond_14
    :goto_14
    sget-boolean v0, Lxyz/aethersx2/android/GameDataResolver;->sInitialized:Z

    if-eqz v0, :cond_19

    return-void

    .line 148
    :cond_19
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 149
    :try_start_1c
    sget-boolean v1, Lxyz/aethersx2/android/GameDataResolver;->sInitialized:Z

    if-eqz v1, :cond_22

    monitor-exit v0

    return-void

    .line 150
    :cond_22
    invoke-static {p0}, Lxyz/aethersx2/android/GameDataResolver;->getValidContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p0

    .line 151
    if-nez p0, :cond_2a

    monitor-exit v0

    return-void

    .line 152
    :cond_2a
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->sAppContext:Landroid/content/Context;

    if-nez v1, :cond_30

    .line 153
    sput-object p0, Lxyz/aethersx2/android/GameDataResolver;->sAppContext:Landroid/content/Context;
    :try_end_30
    .catchall {:try_start_1c .. :try_end_30} :catchall_11b

    .line 157
    :cond_30
    :try_start_30
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 158
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    const-string v3, "PS2.data.json"

    invoke-virtual {p0, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    .line 159
    new-instance v3, Landroid/util/JsonReader;

    new-instance v4, Ljava/io/InputStreamReader;

    const-string v5, "UTF-8"

    invoke-direct {v4, p0, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Landroid/util/JsonReader;-><init>(Ljava/io/Reader;)V

    .line 160
    invoke-virtual {v3}, Landroid/util/JsonReader;->beginObject()V

    .line 161
    :goto_4d
    invoke-virtual {v3}, Landroid/util/JsonReader;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_c4

    .line 162
    invoke-virtual {v3}, Landroid/util/JsonReader;->nextName()Ljava/lang/String;

    move-result-object p0

    .line 163
    invoke-virtual {v3}, Landroid/util/JsonReader;->beginObject()V

    .line 164
    const/4 v4, 0x0

    .line 165
    :goto_5b
    invoke-virtual {v3}, Landroid/util/JsonReader;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_76

    .line 166
    invoke-virtual {v3}, Landroid/util/JsonReader;->nextName()Ljava/lang/String;

    move-result-object v5

    .line 167
    const-string v6, "title"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_72

    .line 168
    invoke-virtual {v3}, Landroid/util/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v4

    goto :goto_75

    .line 170
    :cond_72
    invoke-virtual {v3}, Landroid/util/JsonReader;->skipValue()V

    .line 172
    :goto_75
    goto :goto_5b

    .line 173
    :cond_76
    invoke-virtual {v3}, Landroid/util/JsonReader;->endObject()V

    .line 175
    if-eqz v4, :cond_c3

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_c3

    .line 176
    invoke-static {p0}, Lxyz/aethersx2/android/GameDataResolver;->normalizeSerial(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 177
    if-eqz v5, :cond_8c

    .line 178
    sget-object v6, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-interface {v6, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    :cond_8c
    const-string v5, "[^A-Za-z0-9]"

    const-string v6, ""

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v5

    .line 181
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_a3

    .line 182
    sget-object v6, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-interface {v6, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    :cond_a3
    sget-object v5, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v5, p0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    invoke-static {v4}, Lxyz/aethersx2/android/GameDataResolver;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 187
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_c3

    sget-object v5, Lxyz/aethersx2/android/GameDataResolver;->sNormToTitle:Ljava/util/Map;

    invoke-interface {v5, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c3

    .line 188
    sget-object v5, Lxyz/aethersx2/android/GameDataResolver;->sNormToTitle:Ljava/util/Map;

    invoke-interface {v5, p0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    :cond_c3
    goto :goto_4d

    .line 192
    :cond_c4
    invoke-virtual {v3}, Landroid/util/JsonReader;->endObject()V

    .line 193
    invoke-virtual {v3}, Landroid/util/JsonReader;->close()V

    .line 194
    const/4 p0, 0x1

    sput-boolean p0, Lxyz/aethersx2/android/GameDataResolver;->sInitialized:Z

    .line 195
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 196
    const-string p0, "GameDataResolver"

    sub-long/2addr v3, v1

    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    sget-object v2, Lxyz/aethersx2/android/GameDataResolver;->sNormToTitle:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Loaded PS2 database in "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "ms: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " serials, "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " normalized titles"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_110
    .catchall {:try_start_30 .. :try_end_110} :catchall_111

    .line 199
    goto :goto_119

    .line 197
    :catchall_111
    move-exception p0

    .line 198
    :try_start_112
    const-string v1, "GameDataResolver"

    const-string v2, "Failed to load PS2.data.json"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 200
    :goto_119
    monitor-exit v0

    .line 201
    return-void

    .line 200
    :catchall_11b
    move-exception p0

    monitor-exit v0
    :try_end_11d
    .catchall {:try_start_112 .. :try_end_11d} :catchall_11b

    goto :goto_11f

    :goto_11e
    throw p0

    :goto_11f
    goto :goto_11e
.end method

.method public static getValidContext(Landroid/content/Context;)Landroid/content/Context;
    .registers 5

    .line 99
    if-eqz p0, :cond_c

    .line 101
    :try_start_2
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0
    :try_end_6
    .catchall {:try_start_2 .. :try_end_6} :catchall_9

    .line 102
    if-eqz v0, :cond_a

    return-object v0

    .line 103
    :catchall_9
    move-exception v0

    :cond_a
    nop

    .line 104
    return-object p0

    .line 106
    :cond_c
    sget-object p0, Lxyz/aethersx2/android/GameDataResolver;->sAppContext:Landroid/content/Context;

    if-eqz p0, :cond_13

    .line 107
    sget-object p0, Lxyz/aethersx2/android/GameDataResolver;->sAppContext:Landroid/content/Context;

    return-object p0

    .line 110
    :cond_13
    :try_start_13
    invoke-static {}, Lxyz/aethersx2/android/NativeLibrary;->getContext()Landroid/content/Context;

    move-result-object p0
    :try_end_17
    .catchall {:try_start_13 .. :try_end_17} :catchall_23

    .line 111
    if-eqz p0, :cond_24

    .line 113
    :try_start_19
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0
    :try_end_1d
    .catchall {:try_start_19 .. :try_end_1d} :catchall_20

    .line 114
    if-eqz v0, :cond_21

    return-object v0

    .line 115
    :catchall_20
    move-exception v0

    :cond_21
    nop

    .line 116
    return-object p0

    .line 118
    :catchall_23
    move-exception p0

    :cond_24
    nop

    .line 120
    const/4 p0, 0x0

    const/4 v0, 0x0

    :try_start_27
    const-string v1, "android.app.ActivityThread"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 121
    const-string v2, "currentApplication"

    new-array v3, v0, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 122
    new-array v2, v0, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 123
    instance-of v2, v1, Landroid/content/Context;

    if-eqz v2, :cond_43

    .line 124
    check-cast v1, Landroid/content/Context;
    :try_end_41
    .catchall {:try_start_27 .. :try_end_41} :catchall_42

    return-object v1

    .line 126
    :catchall_42
    move-exception v1

    :cond_43
    nop

    .line 128
    :try_start_44
    const-string v1, "android.app.AppGlobals"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 129
    const-string v2, "getInitialApplication"

    new-array v3, v0, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 130
    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 131
    instance-of v1, v0, Landroid/content/Context;

    if-eqz v1, :cond_60

    .line 132
    check-cast v0, Landroid/content/Context;
    :try_end_5e
    .catchall {:try_start_44 .. :try_end_5e} :catchall_5f

    return-object v0

    .line 134
    :catchall_5f
    move-exception v0

    :cond_60
    nop

    .line 135
    return-object p0
.end method

.method public static normalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 65
    const-string v0, ""

    if-eqz p0, :cond_8e

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_c

    goto/16 :goto_8e

    .line 66
    :cond_c
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->EXTENSION_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 67
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->TAGS_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 68
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->PUNCT_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const-string v0, " "

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 69
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->CAMEL_CASE_1:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const-string v0, "$1 $2"

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 70
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->CAMEL_CASE_2:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 71
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->LETTER_NUM:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 72
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->NUM_LETTER:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 75
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->TOKEN_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    :goto_65
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_89

    .line 78
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v1

    .line 79
    sget-object v2, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 80
    if-eqz v2, :cond_7a

    .line 81
    move-object v1, v2

    .line 83
    :cond_7a
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_85

    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 84
    :cond_85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    goto :goto_65

    .line 86
    :cond_89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 65
    :cond_8e
    :goto_8e
    return-object v0
.end method

.method public static normalizeSerial(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 47
    if-eqz p0, :cond_8f

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    goto/16 :goto_8f

    .line 48
    :cond_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_11
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_3d

    .line 50
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 51
    const/16 v4, 0x41

    if-lt v3, v4, :cond_23

    const/16 v4, 0x5a

    if-le v3, v4, :cond_33

    :cond_23
    const/16 v4, 0x61

    if-lt v3, v4, :cond_2b

    const/16 v4, 0x7a

    if-le v3, v4, :cond_33

    :cond_2b
    const/16 v4, 0x30

    if-lt v3, v4, :cond_3a

    const/16 v4, 0x39

    if-gt v3, v4, :cond_3a

    .line 52
    :cond_33
    invoke-static {v3}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 49
    :cond_3a
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 55
    :cond_3d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 56
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const-string v2, "-"

    const/16 v3, 0x9

    const/4 v4, 0x4

    if-ne v0, v3, :cond_6a

    .line 57
    invoke-virtual {p0, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 58
    :cond_6a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v3, :cond_8e

    .line 59
    invoke-virtual {p0, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 61
    :cond_8e
    return-object p0

    .line 47
    :cond_8f
    :goto_8f
    const/4 p0, 0x0

    return-object p0
.end method

.method public static resolveEntryTitle(Lxyz/aethersx2/android/GameListEntry;)Ljava/lang/String;
    .registers 4

    .line 266
    if-nez p0, :cond_5

    const-string p0, ""

    return-object p0

    .line 267
    :cond_5
    const/4 v0, 0x0

    invoke-static {v0}, Lxyz/aethersx2/android/GameDataResolver;->ensureLoaded(Landroid/content/Context;)V

    .line 269
    iget-object v0, p0, Lxyz/aethersx2/android/GameListEntry;->e:Ljava/lang/String;

    .line 270
    iget-object v1, p0, Lxyz/aethersx2/android/GameListEntry;->d:Ljava/lang/String;

    .line 271
    iget-object v2, p0, Lxyz/aethersx2/android/GameListEntry;->c:Ljava/lang/String;

    .line 272
    invoke-static {v0, v1, v2}, Lxyz/aethersx2/android/GameDataResolver;->resolveTitle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 273
    if-eqz v1, :cond_1e

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1e

    .line 274
    iput-object v1, p0, Lxyz/aethersx2/android/GameListEntry;->e:Ljava/lang/String;

    .line 275
    return-object v1

    .line 278
    :cond_1e
    invoke-static {v0}, Lxyz/aethersx2/android/GameDataResolver;->cleanRaw(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static resolveGameTitle(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 282
    if-eqz p1, :cond_42

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_42

    .line 286
    :cond_9
    invoke-static {p0}, Lxyz/aethersx2/android/GameDataResolver;->ensureLoaded(Landroid/content/Context;)V

    .line 289
    :try_start_c
    invoke-static {}, Lxyz/aethersx2/android/NativeLibrary;->getGameListEntries()[Lxyz/aethersx2/android/GameListEntry;

    move-result-object p0

    .line 290
    if-eqz p0, :cond_3b

    .line 291
    array-length v0, p0

    const/4 v1, 0x0

    :goto_14
    if-ge v1, v0, :cond_3b

    aget-object v2, p0, v1

    .line 292
    if-eqz v2, :cond_37

    iget-object v3, v2, Lxyz/aethersx2/android/GameListEntry;->c:Ljava/lang/String;

    if-eqz v3, :cond_37

    .line 293
    iget-object v3, v2, Lxyz/aethersx2/android/GameListEntry;->c:Ljava/lang/String;

    .line 294
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_32

    invoke-virtual {p1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_32

    invoke-virtual {v3, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_37

    .line 295
    :cond_32
    invoke-static {v2}, Lxyz/aethersx2/android/GameDataResolver;->resolveEntryTitle(Lxyz/aethersx2/android/GameListEntry;)Ljava/lang/String;

    move-result-object p0
    :try_end_36
    .catchall {:try_start_c .. :try_end_36} :catchall_3a

    return-object p0

    .line 291
    :cond_37
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 300
    :catchall_3a
    move-exception p0

    :cond_3b
    nop

    .line 302
    const/4 p0, 0x0

    invoke-static {p0, p0, p1}, Lxyz/aethersx2/android/GameDataResolver;->resolveTitle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 283
    :cond_42
    :goto_42
    const-string p0, "NetherSX2"

    return-object p0
.end method

.method public static resolveTitle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .line 204
    const-string v0, ""

    if-eqz p1, :cond_45

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_45

    .line 205
    invoke-static {p1}, Lxyz/aethersx2/android/GameDataResolver;->normalizeSerial(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 206
    if-eqz v1, :cond_1b

    .line 207
    sget-object v2, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 208
    if-eqz v1, :cond_1b

    return-object v1

    .line 210
    :cond_1b
    const-string v1, "[^A-Za-z0-9]"

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    .line 211
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_36

    .line 212
    sget-object v2, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 213
    if-eqz v1, :cond_36

    return-object v1

    .line 215
    :cond_36
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 216
    if-eqz p1, :cond_45

    return-object p1

    .line 219
    :cond_45
    if-eqz p2, :cond_49

    move-object p1, p2

    goto :goto_4a

    :cond_49
    move-object p1, v0

    :goto_4a
    if-eqz p0, :cond_4e

    move-object v1, p0

    goto :goto_4f

    :cond_4e
    move-object v1, v0

    :goto_4f
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, " "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 220
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->SERIAL_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 221
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    const/4 v2, 0x5

    if-eqz v1, :cond_e4

    .line 223
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "-"

    if-eqz v3, :cond_a8

    .line 224
    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x2

    invoke-virtual {p1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x3

    invoke-virtual {p1, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_ca

    .line 226
    :cond_a8
    const/4 v1, 0x4

    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 228
    :goto_ca
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 229
    if-nez v1, :cond_e1

    .line 230
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-virtual {p1, v4, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    .line 232
    :cond_e1
    if-eqz v1, :cond_e4

    .line 233
    return-object v1

    .line 237
    :cond_e4
    if-eqz p0, :cond_ee

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_ee

    move-object p1, p0

    goto :goto_ef

    :cond_ee
    move-object p1, p2

    .line 238
    :goto_ef
    if-eqz p1, :cond_14f

    .line 239
    invoke-static {p1}, Lxyz/aethersx2/android/FileHelper;->getFileNameForPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 240
    if-eqz v0, :cond_fe

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_fe

    .line 241
    move-object p1, v0

    .line 243
    :cond_fe
    invoke-static {p1}, Lxyz/aethersx2/android/GameDataResolver;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 244
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_14f

    .line 245
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->sNormToTitle:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 246
    if-eqz v0, :cond_113

    .line 247
    return-object v0

    .line 250
    :cond_113
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v2, :cond_14f

    .line 251
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->sNormToTitle:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_123
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 252
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 253
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lt v4, v2, :cond_14e

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_147

    invoke-virtual {v3, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_14e

    .line 254
    :cond_147
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    .line 256
    :cond_14e
    goto :goto_123

    .line 261
    :cond_14f
    if-eqz p0, :cond_158

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_158

    goto :goto_159

    :cond_158
    move-object p0, p2

    .line 262
    :goto_159
    invoke-static {p0}, Lxyz/aethersx2/android/GameDataResolver;->cleanRaw(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
