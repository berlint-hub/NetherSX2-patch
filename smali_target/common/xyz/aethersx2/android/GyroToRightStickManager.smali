.class public Lxyz/aethersx2/android/GyroToRightStickManager;
.super Ljava/lang/Object;
.source "GyroToRightStickManager.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# static fields
.field private static final AXIS_RZ:I = 0xe

.field private static final AXIS_Z:I = 0xb

.field private static final TAG:Ljava/lang/String; = "GyroAiming"

.field private static sInstance:Lxyz/aethersx2/android/GyroToRightStickManager;


# instance fields
.field private mDeadzone:F

.field private mEnabled:Z

.field private mGyroSensor:Landroid/hardware/Sensor;

.field private mInvertY:Z

.field private mLastX:F

.field private mLastY:F

.field private mSensitivity:F

.field private mSensorManager:Landroid/hardware/SensorManager;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mEnabled:Z

    .line 22
    const v1, 0x3f19999a    # 0.6f

    iput v1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mSensitivity:F

    .line 23
    const v1, 0x3d23d70a    # 0.04f

    iput v1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mDeadzone:F

    .line 24
    iput-boolean v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mInvertY:Z

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastX:F

    .line 26
    iput v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastY:F

    .line 29
    return-void
.end method

.method private register(Landroid/content/Context;)V
    .registers 5

    .line 78
    iget-boolean v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mEnabled:Z

    if-eqz v0, :cond_5

    return-void

    .line 79
    :cond_5
    const-string v0, "sensor"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/SensorManager;

    iput-object p1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mSensorManager:Landroid/hardware/SensorManager;

    .line 80
    iget-object p1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mSensorManager:Landroid/hardware/SensorManager;

    if-eqz p1, :cond_56

    .line 81
    iget-object p1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p1

    iput-object p1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mGyroSensor:Landroid/hardware/Sensor;

    .line 82
    iget-object p1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mGyroSensor:Landroid/hardware/Sensor;

    if-eqz p1, :cond_56

    .line 83
    iget-object p1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mGyroSensor:Landroid/hardware/Sensor;

    const/4 v1, 0x1

    invoke-virtual {p1, p0, v0, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 84
    iput-boolean v1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mEnabled:Z

    .line 85
    iget p1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mSensitivity:F

    iget-boolean v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mInvertY:Z

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Gyroscope to Right Stick enabled (sensitivity="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ", invertY="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ")"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "GyroAiming"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    :cond_56
    return-void
.end method

.method public static declared-synchronized start(Landroid/content/Context;)V
    .registers 7

    const-class v0, Lxyz/aethersx2/android/GyroToRightStickManager;

    monitor-enter v0

    .line 32
    if-nez p0, :cond_7

    monitor-exit v0

    return-void

    .line 34
    :cond_7
    :try_start_7
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 35
    const-string v2, "Pad/GyroToRightStick"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 36
    if-nez v2, :cond_19

    .line 37
    invoke-static {}, Lxyz/aethersx2/android/GyroToRightStickManager;->stop()V
    :try_end_17
    .catchall {:try_start_7 .. :try_end_17} :catchall_60

    .line 38
    monitor-exit v0

    return-void

    .line 41
    :cond_19
    nop

    .line 43
    const/16 v2, 0x3c

    :try_start_1c
    const-string v4, "Pad/GyroSensitivity"

    invoke-interface {v1, v4, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_22} :catch_23
    .catchall {:try_start_1c .. :try_end_22} :catchall_60

    .line 49
    goto :goto_33

    .line 44
    :catch_23
    move-exception v4

    .line 46
    :try_start_24
    const-string v4, "Pad/GyroSensitivity"

    const-string v5, "60"

    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 47
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_30} :catch_31
    .catchall {:try_start_24 .. :try_end_30} :catchall_60

    goto :goto_32

    .line 48
    :catch_31
    move-exception v4

    :goto_32
    nop

    .line 50
    :goto_33
    const/4 v4, 0x5

    if-ge v2, v4, :cond_37

    const/4 v2, 0x5

    .line 51
    :cond_37
    const/16 v4, 0x1f4

    if-le v2, v4, :cond_3d

    const/16 v2, 0x1f4

    .line 52
    :cond_3d
    int-to-float v2, v2

    const/high16 v4, 0x42c80000    # 100.0f

    div-float/2addr v2, v4

    .line 54
    :try_start_41
    const-string v4, "Pad/GyroInvertY"

    invoke-interface {v1, v4, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 56
    sget-object v3, Lxyz/aethersx2/android/GyroToRightStickManager;->sInstance:Lxyz/aethersx2/android/GyroToRightStickManager;

    if-nez v3, :cond_52

    .line 57
    new-instance v3, Lxyz/aethersx2/android/GyroToRightStickManager;

    invoke-direct {v3}, Lxyz/aethersx2/android/GyroToRightStickManager;-><init>()V

    sput-object v3, Lxyz/aethersx2/android/GyroToRightStickManager;->sInstance:Lxyz/aethersx2/android/GyroToRightStickManager;

    .line 59
    :cond_52
    sget-object v3, Lxyz/aethersx2/android/GyroToRightStickManager;->sInstance:Lxyz/aethersx2/android/GyroToRightStickManager;

    iput v2, v3, Lxyz/aethersx2/android/GyroToRightStickManager;->mSensitivity:F

    .line 60
    sget-object v2, Lxyz/aethersx2/android/GyroToRightStickManager;->sInstance:Lxyz/aethersx2/android/GyroToRightStickManager;

    iput-boolean v1, v2, Lxyz/aethersx2/android/GyroToRightStickManager;->mInvertY:Z

    .line 61
    sget-object v1, Lxyz/aethersx2/android/GyroToRightStickManager;->sInstance:Lxyz/aethersx2/android/GyroToRightStickManager;

    invoke-direct {v1, p0}, Lxyz/aethersx2/android/GyroToRightStickManager;->register(Landroid/content/Context;)V
    :try_end_5f
    .catchall {:try_start_41 .. :try_end_5f} :catchall_60

    .line 64
    goto :goto_68

    .line 62
    :catchall_60
    move-exception p0

    .line 63
    :try_start_61
    const-string v1, "GyroAiming"

    const-string v2, "Failed to start gyro aiming"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_68
    .catchall {:try_start_61 .. :try_end_68} :catchall_6a

    .line 65
    :goto_68
    monitor-exit v0

    return-void

    .line 31
    :catchall_6a
    move-exception p0

    :try_start_6b
    monitor-exit v0
    :try_end_6c
    .catchall {:try_start_6b .. :try_end_6c} :catchall_6a

    throw p0
.end method

.method public static declared-synchronized stop()V
    .registers 4

    const-class v0, Lxyz/aethersx2/android/GyroToRightStickManager;

    monitor-enter v0

    .line 69
    :try_start_3
    sget-object v1, Lxyz/aethersx2/android/GyroToRightStickManager;->sInstance:Lxyz/aethersx2/android/GyroToRightStickManager;

    if-eqz v1, :cond_c

    .line 70
    sget-object v1, Lxyz/aethersx2/android/GyroToRightStickManager;->sInstance:Lxyz/aethersx2/android/GyroToRightStickManager;

    invoke-direct {v1}, Lxyz/aethersx2/android/GyroToRightStickManager;->unregister()V
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_d

    .line 74
    :cond_c
    goto :goto_15

    .line 72
    :catchall_d
    move-exception v1

    .line 73
    :try_start_e
    const-string v2, "GyroAiming"

    const-string v3, "Failed to stop gyro aiming"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_15
    .catchall {:try_start_e .. :try_end_15} :catchall_17

    .line 75
    :goto_15
    monitor-exit v0

    return-void

    .line 68
    :catchall_17
    move-exception v1

    :try_start_18
    monitor-exit v0
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_17

    throw v1
.end method

.method private unregister()V
    .registers 4

    .line 91
    iget-boolean v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mEnabled:Z

    if-eqz v0, :cond_32

    iget-object v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mSensorManager:Landroid/hardware/SensorManager;

    if-eqz v0, :cond_32

    .line 92
    iget-object v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 93
    const/4 v0, 0x0

    iput-boolean v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mEnabled:Z

    .line 94
    iget v1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastX:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-nez v1, :cond_1d

    iget v1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastY:F

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_2b

    .line 95
    :cond_1d
    const/16 v1, 0xb

    invoke-static {v0, v1, v2}, Lxyz/aethersx2/android/NativeLibrary;->handleControllerAxisEvent(IIF)V

    .line 96
    const/16 v1, 0xe

    invoke-static {v0, v1, v2}, Lxyz/aethersx2/android/NativeLibrary;->handleControllerAxisEvent(IIF)V

    .line 97
    iput v2, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastX:F

    .line 98
    iput v2, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastY:F

    .line 100
    :cond_2b
    const-string v0, "GyroAiming"

    const-string v1, "Gyroscope to Right Stick disabled"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    :cond_32
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .registers 3

    .line 136
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .registers 7

    .line 106
    if-eqz p1, :cond_6f

    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    if-eqz v0, :cond_6f

    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_10

    goto :goto_6f

    .line 110
    :cond_10
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    .line 111
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v2, 0x2

    aget p1, p1, v2

    .line 113
    iget-boolean v2, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mInvertY:Z

    if-eqz v2, :cond_1f

    goto :goto_20

    :cond_1f
    neg-float v0, v0

    :goto_20
    iget v2, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mSensitivity:F

    mul-float v0, v0, v2

    .line 114
    neg-float p1, p1

    iget v2, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mSensitivity:F

    mul-float p1, p1, v2

    .line 116
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget v3, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mDeadzone:F

    const/4 v4, 0x0

    cmpg-float v2, v2, v3

    if-gez v2, :cond_35

    .line 117
    const/4 p1, 0x0

    .line 119
    :cond_35
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget v3, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mDeadzone:F

    cmpg-float v2, v2, v3

    if-gez v2, :cond_40

    .line 120
    const/4 v0, 0x0

    .line 123
    :cond_40
    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    const/high16 v3, -0x40800000    # -1.0f

    invoke-static {v3, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 124
    invoke-static {v2, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 126
    iget v2, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastX:F

    cmpl-float v2, p1, v2

    if-nez v2, :cond_60

    iget v2, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastY:F

    cmpl-float v2, v0, v2

    if-eqz v2, :cond_6e

    .line 127
    :cond_60
    iput p1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastX:F

    .line 128
    iput v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastY:F

    .line 129
    const/16 v2, 0xb

    invoke-static {v1, v2, p1}, Lxyz/aethersx2/android/NativeLibrary;->handleControllerAxisEvent(IIF)V

    .line 130
    const/16 p1, 0xe

    invoke-static {v1, p1, v0}, Lxyz/aethersx2/android/NativeLibrary;->handleControllerAxisEvent(IIF)V

    .line 132
    :cond_6e
    return-void

    .line 107
    :cond_6f
    :goto_6f
    return-void
.end method
