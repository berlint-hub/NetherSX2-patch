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

    .line 43
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ensureLoaded(Landroid/content/Context;)V
    .registers 8

    .line 71
    sget-boolean v0, Lxyz/aethersx2/android/GameDataResolver;->sInitialized:Z

    if-nez v0, :cond_ee

    if-nez p0, :cond_8

    goto/16 :goto_ee

    .line 72
    :cond_8
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 73
    :try_start_b
    sget-boolean v1, Lxyz/aethersx2/android/GameDataResolver;->sInitialized:Z

    if-eqz v1, :cond_11

    monitor-exit v0
    :try_end_10
    .catchall {:try_start_b .. :try_end_10} :catchall_eb

    return-void

    .line 75
    :cond_11
    :try_start_11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 76
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    const-string v3, "PS2.data.json"

    invoke-virtual {p0, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    .line 77
    new-instance v3, Landroid/util/JsonReader;

    new-instance v4, Ljava/io/InputStreamReader;

    const-string v5, "UTF-8"

    invoke-direct {v4, p0, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Landroid/util/JsonReader;-><init>(Ljava/io/Reader;)V

    .line 78
    invoke-virtual {v3}, Landroid/util/JsonReader;->beginObject()V

    .line 79
    :goto_2e
    invoke-virtual {v3}, Landroid/util/JsonReader;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_94

    .line 80
    invoke-virtual {v3}, Landroid/util/JsonReader;->nextName()Ljava/lang/String;

    move-result-object p0

    .line 81
    invoke-virtual {v3}, Landroid/util/JsonReader;->beginObject()V

    .line 82
    const/4 v4, 0x0

    .line 83
    :goto_3c
    invoke-virtual {v3}, Landroid/util/JsonReader;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_57

    .line 84
    invoke-virtual {v3}, Landroid/util/JsonReader;->nextName()Ljava/lang/String;

    move-result-object v5

    .line 85
    const-string v6, "title"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_53

    .line 86
    invoke-virtual {v3}, Landroid/util/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v4

    goto :goto_56

    .line 88
    :cond_53
    invoke-virtual {v3}, Landroid/util/JsonReader;->skipValue()V

    .line 90
    :goto_56
    goto :goto_3c

    .line 91
    :cond_57
    invoke-virtual {v3}, Landroid/util/JsonReader;->endObject()V

    .line 93
    if-eqz v4, :cond_93

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_93

    .line 94
    const-string v5, "-"

    const-string v6, ""

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v5

    .line 95
    sget-object v6, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-interface {v6, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v5, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v5, p0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    invoke-static {v4}, Lxyz/aethersx2/android/GameDataResolver;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 99
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_93

    sget-object v5, Lxyz/aethersx2/android/GameDataResolver;->sNormToTitle:Ljava/util/Map;

    invoke-interface {v5, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_93

    .line 100
    sget-object v5, Lxyz/aethersx2/android/GameDataResolver;->sNormToTitle:Ljava/util/Map;

    invoke-interface {v5, p0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    :cond_93
    goto :goto_2e

    .line 104
    :cond_94
    invoke-virtual {v3}, Landroid/util/JsonReader;->endObject()V

    .line 105
    invoke-virtual {v3}, Landroid/util/JsonReader;->close()V

    .line 106
    const/4 p0, 0x1

    sput-boolean p0, Lxyz/aethersx2/android/GameDataResolver;->sInitialized:Z

    .line 107
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 108
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
    :try_end_e0
    .catchall {:try_start_11 .. :try_end_e0} :catchall_e1

    .line 111
    goto :goto_e9

    .line 109
    :catchall_e1
    move-exception p0

    .line 110
    :try_start_e2
    const-string v1, "GameDataResolver"

    const-string v2, "Failed to load PS2.data.json"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 112
    :goto_e9
    monitor-exit v0

    .line 113
    return-void

    .line 112
    :catchall_eb
    move-exception p0

    monitor-exit v0
    :try_end_ed
    .catchall {:try_start_e2 .. :try_end_ed} :catchall_eb

    throw p0

    .line 71
    :cond_ee
    :goto_ee
    return-void
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

.method public static resolveGameTitle(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 13

    .line 116
    const-string v0, "-"

    const-string v1, ") -> "

    const-string v2, "GameDataResolver"

    if-eqz p1, :cond_1fa

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_10

    goto/16 :goto_1fa

    .line 120
    :cond_10
    invoke-static {p1}, Lxyz/aethersx2/android/FileHelper;->getFileNameForPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 121
    if-eqz v3, :cond_1c

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1d

    .line 122
    :cond_1c
    move-object v3, p1

    .line 124
    :cond_1d
    sget-object v4, Lxyz/aethersx2/android/GameDataResolver;->EXTENSION_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v4, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 125
    const-string v5, "%20"

    const-string v6, " "

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 128
    :try_start_35
    invoke-static {p0}, Lxyz/aethersx2/android/GameDataResolver;->ensureLoaded(Landroid/content/Context;)V
    :try_end_38
    .catchall {:try_start_35 .. :try_end_38} :catchall_1e2

    .line 131
    :try_start_38
    invoke-static {}, Lxyz/aethersx2/android/NativeLibrary;->getGameListEntries()[Lxyz/aethersx2/android/GameListEntry;

    move-result-object p0

    .line 132
    if-eqz p0, :cond_ce

    .line 133
    array-length v5, p0

    const/4 v6, 0x0

    :goto_40
    if-ge v6, v5, :cond_ce

    aget-object v7, p0, v6

    .line 134
    if-eqz v7, :cond_c9

    invoke-virtual {v7}, Lxyz/aethersx2/android/GameListEntry;->getPath()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_c9

    .line 135
    invoke-virtual {v7}, Lxyz/aethersx2/android/GameListEntry;->getPath()Ljava/lang/String;

    move-result-object v8

    .line 136
    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_62

    invoke-virtual {p1, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_62

    invoke-virtual {v8, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_c9

    .line 137
    :cond_62
    invoke-virtual {v7}, Lxyz/aethersx2/android/GameListEntry;->getSerial()Ljava/lang/String;

    move-result-object v8

    .line 138
    if-eqz v8, :cond_ad

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_ad

    .line 139
    sget-object v9, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-virtual {v8}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 140
    if-nez v9, :cond_8c

    .line 141
    sget-object v9, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-virtual {v8, v0, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 143
    :cond_8c
    if-eqz v9, :cond_ad

    .line 144
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Resolved via GameListEntry serial ("

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    return-object v9

    .line 148
    :cond_ad
    invoke-virtual {v7}, Lxyz/aethersx2/android/GameListEntry;->getTitle()Ljava/lang/String;

    move-result-object v7

    .line 149
    if-eqz v7, :cond_c9

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_c9

    .line 150
    sget-object p0, Lxyz/aethersx2/android/GameDataResolver;->sNormToTitle:Ljava/util/Map;

    invoke-static {v7}, Lxyz/aethersx2/android/GameDataResolver;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_c5
    .catchall {:try_start_38 .. :try_end_c5} :catchall_cd

    .line 151
    if-eqz p0, :cond_c8

    return-object p0

    .line 152
    :cond_c8
    return-object v7

    .line 133
    :cond_c9
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_40

    .line 158
    :catchall_cd
    move-exception p0

    :cond_ce
    nop

    .line 160
    :try_start_cf
    sget-object p0, Lxyz/aethersx2/android/GameDataResolver;->SERIAL_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 161
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_143

    .line 162
    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    .line 163
    const/4 v5, 0x2

    invoke-virtual {p0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    .line 164
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 165
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 166
    sget-object v4, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 167
    if-nez v4, :cond_122

    .line 168
    sget-object v4, Lxyz/aethersx2/android/GameDataResolver;->sSerialToTitle:Ljava/util/Map;

    invoke-interface {v4, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v4, p0

    check-cast v4, Ljava/lang/String;

    .line 170
    :cond_122
    if-eqz v4, :cond_143

    .line 171
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Resolved via path serial regex ("

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    return-object v4

    .line 176
    :cond_143
    invoke-static {v3}, Lxyz/aethersx2/android/GameDataResolver;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 177
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1e1

    .line 178
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->sNormToTitle:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 179
    if-eqz v0, :cond_176

    .line 180
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Resolved via normalized title ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    return-object v0

    .line 184
    :cond_176
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v4, 0x5

    if-lt v0, v4, :cond_1e1

    .line 185
    sget-object v0, Lxyz/aethersx2/android/GameDataResolver;->sNormToTitle:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_187
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1e1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 186
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 187
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-lt v7, v4, :cond_1e0

    invoke-virtual {p0, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1ab

    invoke-virtual {v6, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1e0

    .line 188
    :cond_1ab
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Resolved via prefix match ("

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v4, " ~ "

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_1df
    .catchall {:try_start_cf .. :try_end_1df} :catchall_1e2

    return-object p0

    .line 191
    :cond_1e0
    goto :goto_187

    .line 196
    :cond_1e1
    goto :goto_1f9

    .line 194
    :catchall_1e2
    move-exception p0

    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error resolving game title for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 198
    :goto_1f9
    return-object v3

    .line 117
    :cond_1fa
    :goto_1fa
    const-string p0, "NetherSX2"

    return-object p0
.end method
