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

    .line 15
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->LOCK:Ljava/lang/Object;

    .line 16
    const/4 v0, 0x0

    sput-boolean v0, Lxyz/aethersx2/android/GameDataResolver;->sInitialized:Z

    .line 18
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x3e80

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    .line 19
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x1f40

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->sNormToTitle:Ljava/util/Map;

    .line 21
    const-string v0, "([A-Za-z]{4})[-_]?([0-9]{3,5})"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->SERIAL_PATTERN:Ljava/util/regex/Pattern;

    .line 22
    const-string v0, "([A-Z]+)([A-Z][a-z])"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->CAMEL_CASE_1:Ljava/util/regex/Pattern;

    .line 23
    const-string v0, "([a-z0-9])([A-Z])"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->CAMEL_CASE_2:Ljava/util/regex/Pattern;

    .line 24
    const-string v0, "([A-Za-z])([0-9])"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->LETTER_NUM:Ljava/util/regex/Pattern;

    .line 25
    const-string v0, "([0-9])([A-Za-z])"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->NUM_LETTER:Ljava/util/regex/Pattern;

    .line 26
    const-string v0, "\\.(iso|chd|cso|bin|gz|cue|mdf|nrg|dump)$"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->EXTENSION_PATTERN:Ljava/util/regex/Pattern;

    .line 27
    const-string v0, "\\(.*?\\)|\\[.*?\\]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->TAGS_PATTERN:Ljava/util/regex/Pattern;

    .line 28
    const-string v0, "[:\\-_.]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->PUNCT_PATTERN:Ljava/util/regex/Pattern;

    .line 29
    const-string v0, "[a-z0-9]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->TOKEN_PATTERN:Ljava/util/regex/Pattern;

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    .line 33
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "1"

    const-string v2, "i"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "2"

    const-string v2, "ii"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "3"

    const-string v2, "iii"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "4"

    const-string v2, "iv"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "5"

    const-string v2, "v"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "6"

    const-string v2, "vi"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "7"

    const-string v2, "vii"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "8"

    const-string v2, "viii"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "9"

    const-string v2, "ix"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    const-string v1, "10"

    const-string v2, "x"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    const/4 v0, 0x0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->sAppContext:Landroid/content/Context;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static cleanRaw(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 71
    const-string v0, ""

    if-eqz p0, :cond_22

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_b

    goto :goto_22

    .line 72
    :cond_b
    const-string v1, "%20"

    const-string v2, " "

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 73
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->EXTENSION_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 74
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 71
    :cond_22
    :goto_22
    return-object v0
.end method

.method public static ensureLoaded(Landroid/content/Context;)V
    .registers 8

    .line 80
    if-eqz p0, :cond_10

    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->sAppContext:Landroid/content/Context;

    if-nez v0, :cond_10

    .line 82
    :try_start_6
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lxyz/aethersx2/android/GameDataResolver;->sAppContext:Landroid/content/Context;
    :try_end_c
    .catchall {:try_start_6 .. :try_end_c} :catchall_d

    .line 85
    goto :goto_10

    .line 83
    :catchall_d
    move-exception v0

    .line 84
    sput-object p0, Lxyz/aethersx2/android/GameDataResolver;->sAppContext:Landroid/content/Context;

    .line 87
    :cond_10
    :goto_10
    sget-boolean v0, Lxyz/aethersx2/android/GameDataResolver;->sInitialized:Z

    if-eqz v0, :cond_15

    return-void

    .line 88
    :cond_15
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 89
    :try_start_18
    sget-boolean v1, Lxyz/aethersx2/android/GameDataResolver;->sInitialized:Z

    if-eqz v1, :cond_1e

    monitor-exit v0

    return-void

    .line 90
    :cond_1e
    if-nez p0, :cond_22

    .line 91
    sget-object p0, Lxyz/aethersx2/android/GameDataResolver;->sAppContext:Landroid/content/Context;
    :try_end_22
    .catchall {:try_start_18 .. :try_end_22} :catchall_112

    .line 93
    :cond_22
    if-nez p0, :cond_2b

    .line 95
    :try_start_24
    invoke-static {}, Lxyz/aethersx2/android/NativeLibrary;->getContext()Landroid/content/Context;

    move-result-object p0
    :try_end_28
    .catchall {:try_start_24 .. :try_end_28} :catchall_29

    .line 96
    :goto_28
    goto :goto_2b

    :catchall_29
    move-exception v1

    goto :goto_28

    .line 98
    :cond_2b
    :goto_2b
    if-nez p0, :cond_34

    .line 100
    :try_start_2d
    invoke-static {}, Lxyz/aethersx2/android/NativeLibrary;->getMainActivity()Lxyz/aethersx2/android/MainActivity;

    move-result-object p0
    :try_end_31
    .catchall {:try_start_2d .. :try_end_31} :catchall_32

    .line 101
    :goto_31
    goto :goto_34

    :catchall_32
    move-exception v1

    goto :goto_31

    .line 103
    :cond_34
    :goto_34
    if-nez p0, :cond_38

    :try_start_36
    monitor-exit v0
    :try_end_37
    .catchall {:try_start_36 .. :try_end_37} :catchall_112

    return-void

    .line 106
    :cond_38
    :try_start_38
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 107
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    const-string v3, "PS2.data.json"

    invoke-virtual {p0, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    .line 108
    new-instance v3, Landroid/util/JsonReader;

    new-instance v4, Ljava/io/InputStreamReader;

    const-string v5, "UTF-8"

    invoke-direct {v4, p0, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Landroid/util/JsonReader;-><init>(Ljava/io/Reader;)V

    .line 109
    invoke-virtual {v3}, Landroid/util/JsonReader;->beginObject()V

    .line 110
    :goto_55
    invoke-virtual {v3}, Landroid/util/JsonReader;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_bb

    .line 111
    invoke-virtual {v3}, Landroid/util/JsonReader;->nextName()Ljava/lang/String;

    move-result-object p0

    .line 112
    invoke-virtual {v3}, Landroid/util/JsonReader;->beginObject()V

    .line 113
    const/4 v4, 0x0

    .line 114
    :goto_63
    invoke-virtual {v3}, Landroid/util/JsonReader;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7e

    .line 115
    invoke-virtual {v3}, Landroid/util/JsonReader;->nextName()Ljava/lang/String;

    move-result-object v5

    .line 116
    const-string v6, "title"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7a

    .line 117
    invoke-virtual {v3}, Landroid/util/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v4

    goto :goto_7d

    .line 119
    :cond_7a
    invoke-virtual {v3}, Landroid/util/JsonReader;->skipValue()V

    .line 121
    :goto_7d
    goto :goto_63

    .line 122
    :cond_7e
    invoke-virtual {v3}, Landroid/util/JsonReader;->endObject()V

    .line 124
    if-eqz v4, :cond_ba

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_ba

    .line 125
    const-string v5, "-"

    const-string v6, ""

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v5

    .line 126
    sget-object v6, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-interface {v6, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    sget-object v5, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v5, p0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    invoke-static {v4}, Lxyz/aethersx2/android/GameDataResolver;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 130
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_ba

    sget-object v5, Lxyz/aethersx2/android/GameDataResolver;->sNormToTitle:Ljava/util/Map;

    invoke-interface {v5, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_ba

    .line 131
    sget-object v5, Lxyz/aethersx2/android/GameDataResolver;->sNormToTitle:Ljava/util/Map;

    invoke-interface {v5, p0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    :cond_ba
    goto :goto_55

    .line 135
    :cond_bb
    invoke-virtual {v3}, Landroid/util/JsonReader;->endObject()V

    .line 136
    invoke-virtual {v3}, Landroid/util/JsonReader;->close()V

    .line 137
    const/4 p0, 0x1

    sput-boolean p0, Lxyz/aethersx2/android/GameDataResolver;->sInitialized:Z

    .line 138
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 139
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
    :try_end_107
    .catchall {:try_start_38 .. :try_end_107} :catchall_108

    .line 142
    goto :goto_110

    .line 140
    :catchall_108
    move-exception p0

    .line 141
    :try_start_109
    const-string v1, "GameDataResolver"

    const-string v2, "Failed to load PS2.data.json"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 143
    :goto_110
    monitor-exit v0

    .line 144
    return-void

    .line 143
    :catchall_112
    move-exception p0

    monitor-exit v0
    :try_end_114
    .catchall {:try_start_109 .. :try_end_114} :catchall_112

    goto :goto_116

    :goto_115
    throw p0

    :goto_116
    goto :goto_115
.end method

.method public static normalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 46
    const-string v0, ""

    if-eqz p0, :cond_8e

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_c

    goto/16 :goto_8e

    .line 47
    :cond_c
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->EXTENSION_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 48
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->TAGS_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 49
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->PUNCT_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const-string v0, " "

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 50
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->CAMEL_CASE_1:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const-string v0, "$1 $2"

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 51
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->CAMEL_CASE_2:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 52
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->LETTER_NUM:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 53
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->NUM_LETTER:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 56
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->TOKEN_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    :goto_65
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_89

    .line 59
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v1

    .line 60
    sget-object v2, Lxyz/aethersx2/android/GameDataResolver;->ROMAN_MAP:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 61
    if-eqz v2, :cond_7a

    .line 62
    move-object v1, v2

    .line 64
    :cond_7a
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_85

    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 65
    :cond_85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    goto :goto_65

    .line 67
    :cond_89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 46
    :cond_8e
    :goto_8e
    return-object v0
.end method

.method public static resolveEntryTitle(Lxyz/aethersx2/android/GameListEntry;)Ljava/lang/String;
    .registers 4

    .line 203
    if-nez p0, :cond_5

    const-string p0, ""

    return-object p0

    .line 204
    :cond_5
    const/4 v0, 0x0

    invoke-static {v0}, Lxyz/aethersx2/android/GameDataResolver;->ensureLoaded(Landroid/content/Context;)V

    .line 206
    iget-object v0, p0, Lxyz/aethersx2/android/GameListEntry;->e:Ljava/lang/String;

    .line 207
    iget-object v1, p0, Lxyz/aethersx2/android/GameListEntry;->d:Ljava/lang/String;

    .line 208
    iget-object v2, p0, Lxyz/aethersx2/android/GameListEntry;->c:Ljava/lang/String;

    .line 209
    invoke-static {v0, v1, v2}, Lxyz/aethersx2/android/GameDataResolver;->resolveTitle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 210
    if-eqz v1, :cond_1e

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1e

    .line 211
    iput-object v1, p0, Lxyz/aethersx2/android/GameListEntry;->e:Ljava/lang/String;

    .line 212
    return-object v1

    .line 215
    :cond_1e
    invoke-static {v0}, Lxyz/aethersx2/android/GameDataResolver;->cleanRaw(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static resolveGameTitle(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 219
    if-eqz p1, :cond_42

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_42

    .line 223
    :cond_9
    invoke-static {p0}, Lxyz/aethersx2/android/GameDataResolver;->ensureLoaded(Landroid/content/Context;)V

    .line 226
    :try_start_c
    invoke-static {}, Lxyz/aethersx2/android/NativeLibrary;->getGameListEntries()[Lxyz/aethersx2/android/GameListEntry;

    move-result-object p0

    .line 227
    if-eqz p0, :cond_3b

    .line 228
    array-length v0, p0

    const/4 v1, 0x0

    :goto_14
    if-ge v1, v0, :cond_3b

    aget-object v2, p0, v1

    .line 229
    if-eqz v2, :cond_37

    iget-object v3, v2, Lxyz/aethersx2/android/GameListEntry;->c:Ljava/lang/String;

    if-eqz v3, :cond_37

    .line 230
    iget-object v3, v2, Lxyz/aethersx2/android/GameListEntry;->c:Ljava/lang/String;

    .line 231
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_32

    invoke-virtual {p1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_32

    invoke-virtual {v3, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_37

    .line 232
    :cond_32
    invoke-static {v2}, Lxyz/aethersx2/android/GameDataResolver;->resolveEntryTitle(Lxyz/aethersx2/android/GameListEntry;)Ljava/lang/String;

    move-result-object p0
    :try_end_36
    .catchall {:try_start_c .. :try_end_36} :catchall_3a

    return-object p0

    .line 228
    :cond_37
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 237
    :catchall_3a
    move-exception p0

    :cond_3b
    nop

    .line 239
    const/4 p0, 0x0

    invoke-static {p0, p0, p1}, Lxyz/aethersx2/android/GameDataResolver;->resolveTitle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 220
    :cond_42
    :goto_42
    const-string p0, "NetherSX2"

    return-object p0
.end method

.method public static resolveTitle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .line 147
    const-string v0, "-"

    const-string v1, ""

    if-eqz p1, :cond_2a

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2a

    .line 148
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 149
    sget-object v2, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 150
    if-nez v2, :cond_27

    .line 151
    sget-object v2, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Ljava/lang/String;

    .line 153
    :cond_27
    if-eqz v2, :cond_2a

    .line 154
    return-object v2

    .line 158
    :cond_2a
    if-eqz p2, :cond_2e

    move-object p1, p2

    goto :goto_2f

    :cond_2e
    move-object p1, v1

    :goto_2f
    if-eqz p0, :cond_32

    move-object v1, p0

    :cond_32
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

    .line 159
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->SERIAL_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 160
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_9f

    .line 161
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    .line 162
    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    .line 163
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 164
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 165
    sget-object v1, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 166
    if-nez v0, :cond_9c

    .line 167
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    .line 169
    :cond_9c
    if-eqz v0, :cond_9f

    .line 170
    return-object v0

    .line 174
    :cond_9f
    if-eqz p0, :cond_a9

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_a9

    move-object p1, p0

    goto :goto_aa

    :cond_a9
    move-object p1, p2

    .line 175
    :goto_aa
    if-eqz p1, :cond_10b

    .line 176
    invoke-static {p1}, Lxyz/aethersx2/android/FileHelper;->getFileNameForPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 177
    if-eqz v0, :cond_b9

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_b9

    .line 178
    move-object p1, v0

    .line 180
    :cond_b9
    invoke-static {p1}, Lxyz/aethersx2/android/GameDataResolver;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 181
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_10b

    .line 182
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->sNormToTitle:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 183
    if-eqz v0, :cond_ce

    .line 184
    return-object v0

    .line 187
    :cond_ce
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x5

    if-lt v0, v1, :cond_10b

    .line 188
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->sNormToTitle:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_df
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 189
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 190
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lt v4, v1, :cond_10a

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_103

    invoke-virtual {v3, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_10a

    .line 191
    :cond_103
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    .line 193
    :cond_10a
    goto :goto_df

    .line 198
    :cond_10b
    if-eqz p0, :cond_114

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_114

    goto :goto_115

    :cond_114
    move-object p0, p2

    .line 199
    :goto_115
    invoke-static {p0}, Lxyz/aethersx2/android/GameDataResolver;->cleanRaw(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
