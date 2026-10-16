.class public Lxyz/aethersx2/android/GameListDatabase;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "GameListDatabase.java"


# static fields
.field private static final DATABASE_NAME:Ljava/lang/String; = "gamelist.db"

.field private static final DATABASE_VERSION:I = 0x1

.field private static final TABLE_GAMES:Ljava/lang/String; = "games"

.field private static final TAG:Ljava/lang/String; = "GameListDB"

.field private static sInstance:Lxyz/aethersx2/android/GameListDatabase;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    .line 28
    const/4 v0, 0x0

    const/4 v1, 0x1

    const-string v2, "gamelist.db"

    invoke-direct {p0, p1, v2, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 29
    return-void
.end method

.method public static declared-synchronized clear(Landroid/content/Context;)V
    .registers 5

    const-class v0, Lxyz/aethersx2/android/GameListDatabase;

    monitor-enter v0

    .line 161
    :try_start_3
    invoke-static {p0}, Lxyz/aethersx2/android/GameListDatabase;->getInstance(Landroid/content/Context;)Lxyz/aethersx2/android/GameListDatabase;

    move-result-object p0

    invoke-virtual {p0}, Lxyz/aethersx2/android/GameListDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    .line 162
    const-string v1, "games"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 163
    const-string p0, "GameListDB"

    const-string v1, "Cleared SQLite game list cache"

    invoke-static {p0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_18} :catch_1b
    .catchall {:try_start_3 .. :try_end_18} :catchall_19

    .line 166
    goto :goto_38

    .line 160
    :catchall_19
    move-exception p0

    goto :goto_3a

    .line 164
    :catch_1b
    move-exception p0

    .line 165
    :try_start_1c
    const-string v1, "GameListDB"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to clear SQLite cache: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_38
    .catchall {:try_start_1c .. :try_end_38} :catchall_19

    .line 167
    :goto_38
    monitor-exit v0

    return-void

    .line 160
    :goto_3a
    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lxyz/aethersx2/android/GameListDatabase;
    .registers 3

    const-class v0, Lxyz/aethersx2/android/GameListDatabase;

    monitor-enter v0

    .line 21
    :try_start_3
    sget-object v1, Lxyz/aethersx2/android/GameListDatabase;->sInstance:Lxyz/aethersx2/android/GameListDatabase;

    if-nez v1, :cond_12

    .line 22
    new-instance v1, Lxyz/aethersx2/android/GameListDatabase;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v1, p0}, Lxyz/aethersx2/android/GameListDatabase;-><init>(Landroid/content/Context;)V

    sput-object v1, Lxyz/aethersx2/android/GameListDatabase;->sInstance:Lxyz/aethersx2/android/GameListDatabase;

    .line 24
    :cond_12
    sget-object p0, Lxyz/aethersx2/android/GameListDatabase;->sInstance:Lxyz/aethersx2/android/GameListDatabase;
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_16

    monitor-exit v0

    return-object p0

    .line 20
    :catchall_16
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static getOrUpdateGameList(Landroid/content/Context;ZLxyz/aethersx2/android/AndroidProgressCallback;)[Lxyz/aethersx2/android/GameListEntry;
    .registers 6

    .line 170
    const-string v0, "GameListDB"

    if-nez p1, :cond_2b

    .line 171
    invoke-static {p0}, Lxyz/aethersx2/android/GameListDatabase;->loadEntries(Landroid/content/Context;)[Lxyz/aethersx2/android/GameListEntry;

    move-result-object v1

    .line 172
    if-eqz v1, :cond_2b

    array-length v2, v1

    if-lez v2, :cond_2b

    .line 173
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Returning cached game list from SQLite ("

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    array-length p1, v1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " games, skipped rescan)"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    return-object v1

    .line 177
    :cond_2b
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Scanning game folders via NativeLibrary (forceRescan="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")..."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    const/4 v0, 0x0

    invoke-static {p1, v0, p2}, Lxyz/aethersx2/android/NativeLibrary;->refreshGameList(ZZLxyz/aethersx2/android/AndroidProgressCallback;)V

    .line 179
    invoke-static {}, Lxyz/aethersx2/android/NativeLibrary;->getGameListEntries()[Lxyz/aethersx2/android/GameListEntry;

    move-result-object p1

    .line 180
    if-eqz p1, :cond_57

    array-length p2, p1

    if-lez p2, :cond_57

    .line 181
    invoke-static {p0, p1}, Lxyz/aethersx2/android/GameListDatabase;->saveEntries(Landroid/content/Context;[Lxyz/aethersx2/android/GameListEntry;)V

    .line 183
    :cond_57
    return-object p1
.end method

.method public static declared-synchronized hasEntries(Landroid/content/Context;)Z
    .registers 6

    const-class v0, Lxyz/aethersx2/android/GameListDatabase;

    monitor-enter v0

    .line 57
    const/4 v1, 0x0

    :try_start_4
    invoke-static {p0}, Lxyz/aethersx2/android/GameListDatabase;->getInstance(Landroid/content/Context;)Lxyz/aethersx2/android/GameListDatabase;

    move-result-object p0

    invoke-virtual {p0}, Lxyz/aethersx2/android/GameListDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    .line 58
    const-string v2, "SELECT count(*) FROM games"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 59
    nop

    .line 60
    if-eqz p0, :cond_2b

    .line 61
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_26

    .line 62
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    if-lez v2, :cond_24

    const/4 v2, 0x1

    goto :goto_27

    :cond_24
    const/4 v2, 0x0

    goto :goto_27

    .line 61
    :cond_26
    const/4 v2, 0x0

    .line 64
    :goto_27
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_2a} :catch_2f
    .catchall {:try_start_4 .. :try_end_2a} :catchall_2d

    move v1, v2

    .line 66
    :cond_2b
    monitor-exit v0

    return v1

    .line 56
    :catchall_2d
    move-exception p0

    goto :goto_4e

    .line 67
    :catch_2f
    move-exception p0

    .line 68
    :try_start_30
    const-string v2, "GameListDB"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error checking entries in gamelist.db: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4c
    .catchall {:try_start_30 .. :try_end_4c} :catchall_2d

    .line 69
    monitor-exit v0

    return v1

    .line 56
    :goto_4e
    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized loadEntries(Landroid/content/Context;)[Lxyz/aethersx2/android/GameListEntry;
    .registers 23

    const-class v1, Lxyz/aethersx2/android/GameListDatabase;

    monitor-enter v1

    .line 75
    const/4 v2, 0x0

    :try_start_4
    invoke-static/range {p0 .. p0}, Lxyz/aethersx2/android/GameListDatabase;->getInstance(Landroid/content/Context;)Lxyz/aethersx2/android/GameListDatabase;

    move-result-object v0

    invoke-virtual {v0}, Lxyz/aethersx2/android/GameListDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 76
    const-string v4, "games"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string v10, "title COLLATE NOCASE ASC"

    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_19} :catch_eb
    .catchall {:try_start_4 .. :try_end_19} :catchall_e9

    .line 77
    if-nez v0, :cond_1d

    .line 78
    monitor-exit v1

    return-object v2

    .line 80
    :cond_1d
    :try_start_1d
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 81
    :goto_22
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_b9

    .line 82
    const-string v4, "path"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 83
    if-eqz v8, :cond_40

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_40

    .line 84
    goto :goto_22

    .line 86
    :cond_40
    const-string v4, "serial"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 87
    const-string v4, "title"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 88
    const-string v4, "region"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    .line 89
    const-string v4, "type"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 90
    const-string v4, "total_size"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    .line 91
    const-string v4, "played_time"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    .line 92
    const-string v4, "last_played"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v15

    .line 93
    const-string v4, "modified_time"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v17

    .line 94
    const-string v4, "crc"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v19

    .line 95
    const-string v4, "compat"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v20

    .line 96
    const-string v4, "cover_path"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v21

    .line 98
    new-instance v4, Lxyz/aethersx2/android/GameListEntry;

    move-object v5, v4

    invoke-direct/range {v5 .. v21}, Lxyz/aethersx2/android/GameListEntry;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;JJJJIILjava/lang/String;)V

    .line 103
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    goto/16 :goto_22

    .line 105
    :cond_b9
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 106
    const-string v0, "GameListDB"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Loaded "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " games from SQLite cache (no filesystem rescan)"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    const/4 v0, 0x0

    new-array v0, v0, [Lxyz/aethersx2/android/GameListEntry;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lxyz/aethersx2/android/GameListEntry;
    :try_end_e7
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_e7} :catch_eb
    .catchall {:try_start_1d .. :try_end_e7} :catchall_e9

    monitor-exit v1

    return-object v0

    .line 74
    :catchall_e9
    move-exception v0

    goto :goto_10a

    .line 108
    :catch_eb
    move-exception v0

    .line 109
    :try_start_ec
    const-string v3, "GameListDB"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to load game list from SQLite: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_108
    .catchall {:try_start_ec .. :try_end_108} :catchall_e9

    .line 110
    monitor-exit v1

    return-object v2

    .line 74
    :goto_10a
    monitor-exit v1

    goto :goto_10d

    :goto_10c
    throw v0

    :goto_10d
    goto :goto_10c
.end method

.method public static declared-synchronized saveEntries(Landroid/content/Context;[Lxyz/aethersx2/android/GameListEntry;)V
    .registers 11

    const-class v0, Lxyz/aethersx2/android/GameListDatabase;

    monitor-enter v0

    .line 115
    if-eqz p1, :cond_114

    :try_start_5
    array-length v1, p1
    :try_end_6
    .catchall {:try_start_5 .. :try_end_6} :catchall_111

    if-nez v1, :cond_a

    goto/16 :goto_114

    .line 117
    :cond_a
    :try_start_a
    invoke-static {p0}, Lxyz/aethersx2/android/GameListDatabase;->getInstance(Landroid/content/Context;)Lxyz/aethersx2/android/GameListDatabase;

    move-result-object p0

    invoke-virtual {p0}, Lxyz/aethersx2/android/GameListDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    .line 118
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_15} :catch_f2
    .catchall {:try_start_a .. :try_end_15} :catchall_111

    .line 120
    :try_start_15
    array-length v1, p1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_18
    if-ge v3, v1, :cond_c6

    aget-object v4, p1, v3

    .line 121
    if-eqz v4, :cond_c2

    iget-object v5, v4, Lxyz/aethersx2/android/GameListEntry;->c:Ljava/lang/String;

    if-nez v5, :cond_24

    goto/16 :goto_c2

    .line 122
    :cond_24
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 123
    const-string v6, "path"

    iget-object v7, v4, Lxyz/aethersx2/android/GameListEntry;->c:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    const-string v6, "serial"

    iget-object v7, v4, Lxyz/aethersx2/android/GameListEntry;->d:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    const-string v6, "title"

    iget-object v7, v4, Lxyz/aethersx2/android/GameListEntry;->e:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    const-string v6, "region"

    iget-object v7, v4, Lxyz/aethersx2/android/GameListEntry;->a:Lxyz/aethersx2/android/GameListEntry$b;

    if-eqz v7, :cond_4b

    iget-object v7, v4, Lxyz/aethersx2/android/GameListEntry;->a:Lxyz/aethersx2/android/GameListEntry$b;

    invoke-virtual {v7}, Lxyz/aethersx2/android/GameListEntry$b;->ordinal()I

    move-result v7

    goto :goto_4c

    :cond_4b
    const/4 v7, 0x0

    :goto_4c
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 127
    const-string v6, "type"

    iget-object v7, v4, Lxyz/aethersx2/android/GameListEntry;->b:Lxyz/aethersx2/android/GameListEntry$c;

    if-eqz v7, :cond_60

    iget-object v7, v4, Lxyz/aethersx2/android/GameListEntry;->b:Lxyz/aethersx2/android/GameListEntry$c;

    invoke-virtual {v7}, Lxyz/aethersx2/android/GameListEntry$c;->ordinal()I

    move-result v7

    goto :goto_61

    :cond_60
    const/4 v7, 0x0

    :goto_61
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 128
    const-string v6, "total_size"

    iget-wide v7, v4, Lxyz/aethersx2/android/GameListEntry;->f:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 129
    const-string v6, "played_time"

    iget-wide v7, v4, Lxyz/aethersx2/android/GameListEntry;->g:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 130
    const-string v6, "last_played"

    iget-wide v7, v4, Lxyz/aethersx2/android/GameListEntry;->h:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 131
    const-string v6, "modified_time"

    iget-wide v7, v4, Lxyz/aethersx2/android/GameListEntry;->i:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 132
    const-string v6, "crc"

    iget v7, v4, Lxyz/aethersx2/android/GameListEntry;->j:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 133
    const-string v6, "compat"

    iget-object v7, v4, Lxyz/aethersx2/android/GameListEntry;->k:Lxyz/aethersx2/android/GameListEntry$a;

    if-eqz v7, :cond_ac

    iget-object v7, v4, Lxyz/aethersx2/android/GameListEntry;->k:Lxyz/aethersx2/android/GameListEntry$a;

    invoke-virtual {v7}, Lxyz/aethersx2/android/GameListEntry$a;->ordinal()I

    move-result v7

    goto :goto_ad

    :cond_ac
    const/4 v7, 0x0

    :goto_ad
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 134
    const-string v6, "cover_path"

    iget-object v4, v4, Lxyz/aethersx2/android/GameListEntry;->l:Ljava/lang/String;

    invoke-virtual {v5, v6, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    const-string v4, "games"

    const/4 v6, 0x0

    const/4 v7, 0x5

    invoke-virtual {p0, v4, v6, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    .line 120
    :cond_c2
    :goto_c2
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_18

    .line 137
    :cond_c6
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 138
    const-string v1, "GameListDB"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Successfully saved "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length p1, p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, " games to SQLite cache"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_e8
    .catchall {:try_start_15 .. :try_end_e8} :catchall_ed

    .line 140
    :try_start_e8
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 141
    nop

    .line 144
    goto :goto_10f

    .line 140
    :catchall_ed
    move-exception p1

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 141
    throw p1
    :try_end_f2
    .catch Ljava/lang/Exception; {:try_start_e8 .. :try_end_f2} :catch_f2
    .catchall {:try_start_e8 .. :try_end_f2} :catchall_111

    .line 142
    :catch_f2
    move-exception p0

    .line 143
    :try_start_f3
    const-string p1, "GameListDB"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to save game list to SQLite: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_10f
    .catchall {:try_start_f3 .. :try_end_10f} :catchall_111

    .line 145
    :goto_10f
    monitor-exit v0

    return-void

    .line 114
    :catchall_111
    move-exception p0

    monitor-exit v0

    throw p0

    .line 115
    :cond_114
    :goto_114
    monitor-exit v0

    return-void
.end method

.method public static declared-synchronized updateCoverPath(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    const-class v0, Lxyz/aethersx2/android/GameListDatabase;

    monitor-enter v0

    .line 148
    if-nez p1, :cond_7

    monitor-exit v0

    return-void

    .line 150
    :cond_7
    :try_start_7
    invoke-static {p0}, Lxyz/aethersx2/android/GameListDatabase;->getInstance(Landroid/content/Context;)Lxyz/aethersx2/android/GameListDatabase;

    move-result-object p0

    invoke-virtual {p0}, Lxyz/aethersx2/android/GameListDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    .line 151
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 152
    const-string v2, "cover_path"

    invoke-virtual {v1, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    const-string p2, "games"

    const-string v2, "path = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {p0, p2, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_26} :catch_29
    .catchall {:try_start_7 .. :try_end_26} :catchall_27

    .line 156
    goto :goto_46

    .line 147
    :catchall_27
    move-exception p0

    goto :goto_48

    .line 154
    :catch_29
    move-exception p0

    .line 155
    :try_start_2a
    const-string p1, "GameListDB"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to update cover in SQLite: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_46
    .catchall {:try_start_2a .. :try_end_46} :catchall_27

    .line 157
    :goto_46
    monitor-exit v0

    return-void

    .line 147
    :goto_48
    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 3

    .line 33
    const-string v0, "CREATE TABLE IF NOT EXISTS games (path TEXT PRIMARY KEY,serial TEXT,title TEXT,region INTEGER,type INTEGER,total_size INTEGER,played_time INTEGER,last_played INTEGER,modified_time INTEGER,crc INTEGER,compat INTEGER,cover_path TEXT)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 47
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 4

    .line 51
    const-string p2, "DROP TABLE IF EXISTS games"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 52
    invoke-virtual {p0, p1}, Lxyz/aethersx2/android/GameListDatabase;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 53
    return-void
.end method
