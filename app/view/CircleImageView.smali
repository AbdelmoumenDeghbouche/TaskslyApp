.class public Lapp/todolist/view/CircleImageView;
.super Lapp/todolist/view/ImageViewSquare;


# instance fields
.field public final n:Landroid/graphics/PorterDuffXfermode;

.field public final o:Landroid/graphics/RectF;

.field public final p:Landroid/graphics/Path;

.field public final q:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lapp/todolist/view/CircleImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lapp/todolist/view/CircleImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Lapp/todolist/view/ImageViewSquare;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p3, Landroid/graphics/PorterDuffXfermode;

    sget-object v0, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p3, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p3, p0, Lapp/todolist/view/CircleImageView;->n:Landroid/graphics/PorterDuffXfermode;

    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/CircleImageView;->o:Landroid/graphics/RectF;

    new-instance p3, Landroid/graphics/Path;

    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/CircleImageView;->p:Landroid/graphics/Path;

    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/CircleImageView;->q:Landroid/graphics/Paint;

    invoke-direct {p0, p1, p2}, Lapp/todolist/view/CircleImageView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    iget-object p1, p0, Lapp/todolist/view/CircleImageView;->q:Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lapp/todolist/view/CircleImageView;->q:Landroid/graphics/Paint;

    iget-object p2, p0, Lapp/todolist/view/CircleImageView;->n:Landroid/graphics/PorterDuffXfermode;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    iget-object p1, p0, Lapp/todolist/view/CircleImageView;->q:Landroid/graphics/Paint;

    const/high16 p2, -0x1000000

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    invoke-virtual {p0}, Landroid/widget/ImageView;->getWidth()I

    move-result v0

    iget-object v1, p0, Lapp/todolist/view/CircleImageView;->o:Landroid/graphics/RectF;

    int-to-float v0, v0

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2, v0, v0}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v1, p0, Lapp/todolist/view/CircleImageView;->o:Landroid/graphics/RectF;

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->saveLayer(Landroid/graphics/RectF;Landroid/graphics/Paint;)I

    move-result v1

    invoke-super {p0, p1}, Lapp/todolist/view/MediaCoverView;->onDraw(Landroid/graphics/Canvas;)V

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    iget-object v2, p0, Lapp/todolist/view/CircleImageView;->p:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->rewind()V

    iget-object v2, p0, Lapp/todolist/view/CircleImageView;->p:Landroid/graphics/Path;

    sget-object v3, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    invoke-virtual {v2, v0, v0, v0, v3}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    iget-object v0, p0, Lapp/todolist/view/CircleImageView;->p:Landroid/graphics/Path;

    iget-object v2, p0, Lapp/todolist/view/CircleImageView;->q:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method
