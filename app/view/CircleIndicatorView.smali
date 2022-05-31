.class public Lapp/todolist/view/CircleIndicatorView;
.super Landroid/view/View;


# instance fields
.field public a:F

.field public b:F

.field public c:F

.field public d:F

.field public e:Landroid/graphics/Paint;

.field public f:Landroid/graphics/Paint;

.field public g:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/high16 v0, 0x40e00000    # 7.0f

    iput v0, p0, Lapp/todolist/view/CircleIndicatorView;->c:F

    const/high16 v0, 0x40a00000    # 5.0f

    iput v0, p0, Lapp/todolist/view/CircleIndicatorView;->d:F

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/CircleIndicatorView;->e:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/CircleIndicatorView;->f:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Lapp/todolist/view/CircleIndicatorView;->a(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p2, 0x40e00000    # 7.0f

    iput p2, p0, Lapp/todolist/view/CircleIndicatorView;->c:F

    const/high16 p2, 0x40a00000    # 5.0f

    iput p2, p0, Lapp/todolist/view/CircleIndicatorView;->d:F

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lapp/todolist/view/CircleIndicatorView;->e:Landroid/graphics/Paint;

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lapp/todolist/view/CircleIndicatorView;->f:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Lapp/todolist/view/CircleIndicatorView;->a(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p2, 0x40e00000    # 7.0f

    iput p2, p0, Lapp/todolist/view/CircleIndicatorView;->c:F

    const/high16 p2, 0x40a00000    # 5.0f

    iput p2, p0, Lapp/todolist/view/CircleIndicatorView;->d:F

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lapp/todolist/view/CircleIndicatorView;->e:Landroid/graphics/Paint;

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lapp/todolist/view/CircleIndicatorView;->f:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Lapp/todolist/view/CircleIndicatorView;->a(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .locals 3

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700ae

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lapp/todolist/view/CircleIndicatorView;->b:F

    iget-object v0, p0, Lapp/todolist/view/CircleIndicatorView;->e:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lapp/todolist/view/CircleIndicatorView;->e:Landroid/graphics/Paint;

    const/4 v2, -0x1

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lapp/todolist/view/CircleIndicatorView;->e:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lapp/todolist/view/CircleIndicatorView;->f:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lapp/todolist/view/CircleIndicatorView;->f:Landroid/graphics/Paint;

    const v1, 0x7f06012a

    invoke-static {p1, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Lapp/todolist/view/CircleIndicatorView;->f:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget v0, p0, Lapp/todolist/view/CircleIndicatorView;->a:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v2

    iget v4, p0, Lapp/todolist/view/CircleIndicatorView;->d:F

    mul-float v3, v3, v4

    iget v4, p0, Lapp/todolist/view/CircleIndicatorView;->c:F

    div-float/2addr v3, v4

    iget v4, p0, Lapp/todolist/view/CircleIndicatorView;->a:F

    sub-float v5, v4, v1

    mul-float v5, v5, v3

    add-float/2addr v5, v0

    sub-float/2addr v4, v1

    iget v1, p0, Lapp/todolist/view/CircleIndicatorView;->b:F

    mul-float v4, v4, v1

    add-float/2addr v5, v4

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, v5

    div-float/2addr v4, v2

    const/4 v5, 0x0

    :goto_0
    int-to-float v6, v5

    iget v7, p0, Lapp/todolist/view/CircleIndicatorView;->a:F

    cmpg-float v6, v6, v7

    if-gez v6, :cond_2

    iget v6, p0, Lapp/todolist/view/CircleIndicatorView;->g:I

    if-ne v6, v5, :cond_0

    move v7, v0

    goto :goto_1

    :cond_0
    move v7, v3

    :goto_1
    add-float v8, v4, v7

    if-ne v6, v5, :cond_1

    iget-object v6, p0, Lapp/todolist/view/CircleIndicatorView;->e:Landroid/graphics/Paint;

    goto :goto_2

    :cond_1
    iget-object v6, p0, Lapp/todolist/view/CircleIndicatorView;->f:Landroid/graphics/Paint;

    :goto_2
    invoke-virtual {p1, v8, v1, v7, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    mul-float v7, v7, v2

    iget v6, p0, Lapp/todolist/view/CircleIndicatorView;->b:F

    add-float/2addr v7, v6

    add-float/2addr v4, v7

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public setCount(I)V
    .locals 0

    if-gez p1, :cond_0

    const/4 p1, 0x0

    :cond_0
    int-to-float p1, p1

    iput p1, p0, Lapp/todolist/view/CircleIndicatorView;->a:F

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public setCurIndex(I)V
    .locals 0

    iput p1, p0, Lapp/todolist/view/CircleIndicatorView;->g:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
