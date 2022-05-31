.class public Lapp/todolist/view/GradientEntry;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lapp/todolist/view/GradientEntry;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private colorArray:[I

.field private gradientRadius:F

.field private gradientType:I

.field private name:Ljava/lang/String;

.field private orientation:Landroid/graphics/drawable/GradientDrawable$Orientation;

.field private radiusCenterX:F

.field private radiusCenterY:F

.field private ratioArray:[F


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lapp/todolist/view/GradientEntry$a;

    invoke-direct {v0}, Lapp/todolist/view/GradientEntry$a;-><init>()V

    sput-object v0, Lapp/todolist/view/GradientEntry;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lapp/todolist/view/GradientEntry;->name:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    iput-object v0, p0, Lapp/todolist/view/GradientEntry;->colorArray:[I

    invoke-virtual {p1}, Landroid/os/Parcel;->createFloatArray()[F

    move-result-object v0

    iput-object v0, p0, Lapp/todolist/view/GradientEntry;->ratioArray:[F

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/graphics/drawable/GradientDrawable$Orientation;->values()[Landroid/graphics/drawable/GradientDrawable$Orientation;

    move-result-object v1

    aget-object v0, v1, v0

    :goto_0
    iput-object v0, p0, Lapp/todolist/view/GradientEntry;->orientation:Landroid/graphics/drawable/GradientDrawable$Orientation;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lapp/todolist/view/GradientEntry;->gradientType:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lapp/todolist/view/GradientEntry;->radiusCenterX:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lapp/todolist/view/GradientEntry;->radiusCenterY:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result p1

    iput p1, p0, Lapp/todolist/view/GradientEntry;->gradientRadius:F

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[I[FILandroid/graphics/drawable/GradientDrawable$Orientation;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/todolist/view/GradientEntry;->name:Ljava/lang/String;

    iput-object p2, p0, Lapp/todolist/view/GradientEntry;->colorArray:[I

    iput-object p3, p0, Lapp/todolist/view/GradientEntry;->ratioArray:[F

    iput-object p5, p0, Lapp/todolist/view/GradientEntry;->orientation:Landroid/graphics/drawable/GradientDrawable$Orientation;

    iput p4, p0, Lapp/todolist/view/GradientEntry;->gradientType:I

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getColorArray()[I
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/GradientEntry;->colorArray:[I

    return-object v0
.end method

.method public getGradientRadius()F
    .locals 1

    iget v0, p0, Lapp/todolist/view/GradientEntry;->gradientRadius:F

    return v0
.end method

.method public getGradientType()I
    .locals 1

    iget v0, p0, Lapp/todolist/view/GradientEntry;->gradientType:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/GradientEntry;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOrientation()Landroid/graphics/drawable/GradientDrawable$Orientation;
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/GradientEntry;->orientation:Landroid/graphics/drawable/GradientDrawable$Orientation;

    return-object v0
.end method

.method public getRadiusCenterX()F
    .locals 1

    iget v0, p0, Lapp/todolist/view/GradientEntry;->radiusCenterX:F

    return v0
.end method

.method public getRadiusCenterY()F
    .locals 1

    iget v0, p0, Lapp/todolist/view/GradientEntry;->radiusCenterY:F

    return v0
.end method

.method public getRatioArray()[F
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/GradientEntry;->ratioArray:[F

    return-object v0
.end method

.method public setColorArray([I)V
    .locals 0

    iput-object p1, p0, Lapp/todolist/view/GradientEntry;->colorArray:[I

    return-void
.end method

.method public setGradientRadius(F)V
    .locals 0

    iput p1, p0, Lapp/todolist/view/GradientEntry;->gradientRadius:F

    return-void
.end method

.method public setGradientType(I)V
    .locals 0

    iput p1, p0, Lapp/todolist/view/GradientEntry;->gradientType:I

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lapp/todolist/view/GradientEntry;->name:Ljava/lang/String;

    return-void
.end method

.method public setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V
    .locals 0

    iput-object p1, p0, Lapp/todolist/view/GradientEntry;->orientation:Landroid/graphics/drawable/GradientDrawable$Orientation;

    return-void
.end method

.method public setRadiusCenterX(F)V
    .locals 0

    iput p1, p0, Lapp/todolist/view/GradientEntry;->radiusCenterX:F

    return-void
.end method

.method public setRadiusCenterY(F)V
    .locals 0

    iput p1, p0, Lapp/todolist/view/GradientEntry;->radiusCenterY:F

    return-void
.end method

.method public setRatioArray([F)V
    .locals 0

    iput-object p1, p0, Lapp/todolist/view/GradientEntry;->ratioArray:[F

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    iget-object p2, p0, Lapp/todolist/view/GradientEntry;->name:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object p2, p0, Lapp/todolist/view/GradientEntry;->colorArray:[I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeIntArray([I)V

    iget-object p2, p0, Lapp/todolist/view/GradientEntry;->ratioArray:[F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloatArray([F)V

    iget-object p2, p0, Lapp/todolist/view/GradientEntry;->orientation:Landroid/graphics/drawable/GradientDrawable$Orientation;

    if-nez p2, :cond_0

    const/4 p2, -0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/graphics/drawable/GradientDrawable$Orientation;->ordinal()I

    move-result p2

    :goto_0
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lapp/todolist/view/GradientEntry;->gradientType:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lapp/todolist/view/GradientEntry;->radiusCenterX:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lapp/todolist/view/GradientEntry;->radiusCenterY:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lapp/todolist/view/GradientEntry;->gradientRadius:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    return-void
.end method
