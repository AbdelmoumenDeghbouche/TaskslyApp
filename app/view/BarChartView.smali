.class public Lapp/todolist/view/BarChartView;
.super Landroid/view/View;


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Paint;

.field public e:Landroid/graphics/Paint;

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:Landroid/graphics/Rect;

.field public p:Landroid/graphics/Rect;

.field public q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public t:I

.field public u:I

.field public v:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lapp/todolist/view/BarChartView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lapp/todolist/view/BarChartView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x6

    iput p2, p0, Lapp/todolist/view/BarChartView;->f:I

    const/16 p2, 0x1d

    iput p2, p0, Lapp/todolist/view/BarChartView;->g:I

    const/16 p2, 0x8

    iput p2, p0, Lapp/todolist/view/BarChartView;->h:I

    const/16 p2, 0x14

    iput p2, p0, Lapp/todolist/view/BarChartView;->i:I

    const/16 p2, 0x28

    iput p2, p0, Lapp/todolist/view/BarChartView;->j:I

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lapp/todolist/view/BarChartView;->q:Ljava/util/List;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lapp/todolist/view/BarChartView;->r:Ljava/util/List;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lapp/todolist/view/BarChartView;->s:Ljava/util/List;

    iput-object p1, p0, Lapp/todolist/view/BarChartView;->a:Landroid/content/Context;

    invoke-virtual {p0, p1}, Lapp/todolist/view/BarChartView;->a(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .locals 7

    invoke-static {p1}, Lf/c/c/f/g;->t(Landroid/content/Context;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x5c

    invoke-static {p1, v1}, Lf/c/c/f/g;->v(Landroid/content/Context;I)I

    move-result v1

    const/16 v2, 0x36

    invoke-static {p1, v2}, Lf/c/c/f/g;->v(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070061

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iget v3, p0, Lapp/todolist/view/BarChartView;->n:I

    sub-int/2addr v2, v3

    iget v3, p0, Lapp/todolist/view/BarChartView;->t:I

    sub-int/2addr v2, v3

    iget-object v3, p0, Lapp/todolist/view/BarChartView;->r:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    div-int/2addr v2, v3

    iput v2, p0, Lapp/todolist/view/BarChartView;->g:I

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0700b1

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lapp/todolist/view/BarChartView;->f:I

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v5, 0x7f0700b4

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lapp/todolist/view/BarChartView;->h:I

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v5, 0x7f0700a6

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lapp/todolist/view/BarChartView;->i:I

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lapp/todolist/view/BarChartView;->n:I

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lapp/todolist/view/BarChartView;->u:I

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f07009f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lapp/todolist/view/BarChartView;->t:I

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0700ae

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lapp/todolist/view/BarChartView;->v:I

    new-instance v2, Landroid/graphics/BlurMaskFilter;

    sget-object v3, Landroid/graphics/BlurMaskFilter$Blur;->INNER:Landroid/graphics/BlurMaskFilter$Blur;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v2, v5, v3}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lapp/todolist/view/BarChartView;->b:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, p0, Lapp/todolist/view/BarChartView;->b:Landroid/graphics/Paint;

    const/high16 v6, 0x40800000    # 4.0f

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v3, p0, Lapp/todolist/view/BarChartView;->b:Landroid/graphics/Paint;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    iget-object v2, p0, Lapp/todolist/view/BarChartView;->b:Landroid/graphics/Paint;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/BarChartView;->c:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lapp/todolist/view/BarChartView;->c:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lapp/todolist/view/BarChartView;->c:Landroid/graphics/Paint;

    const/high16 v2, 0x40000000    # 2.0f

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/BarChartView;->d:Landroid/graphics/Paint;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f07009e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v0, p0, Lapp/todolist/view/BarChartView;->d:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Lapp/todolist/view/BarChartView;->d:Landroid/graphics/Paint;

    invoke-virtual {p1, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lapp/todolist/view/BarChartView;->d:Landroid/graphics/Paint;

    invoke-virtual {p1, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lapp/todolist/view/BarChartView;->e:Landroid/graphics/Paint;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object p1, p0, Lapp/todolist/view/BarChartView;->e:Landroid/graphics/Paint;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Lapp/todolist/view/BarChartView;->e:Landroid/graphics/Paint;

    invoke-virtual {p1, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lapp/todolist/view/BarChartView;->e:Landroid/graphics/Paint;

    invoke-virtual {p1, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lapp/todolist/view/BarChartView;->p:Landroid/graphics/Rect;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lapp/todolist/view/BarChartView;->o:Landroid/graphics/Rect;

    iget-object p1, p0, Lapp/todolist/view/BarChartView;->r:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    const/4 v0, 0x0

    if-lez p1, :cond_0

    iget-object p1, p0, Lapp/todolist/view/BarChartView;->d:Landroid/graphics/Paint;

    iget-object v1, p0, Lapp/todolist/view/BarChartView;->r:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    sub-int/2addr v2, v4

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lapp/todolist/view/BarChartView;->r:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    sub-int/2addr v3, v4

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v3, p0, Lapp/todolist/view/BarChartView;->p:Landroid/graphics/Rect;

    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    :cond_0
    iget-object p1, p0, Lapp/todolist/view/BarChartView;->p:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result p1

    iget-object v1, p0, Lapp/todolist/view/BarChartView;->o:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lapp/todolist/view/BarChartView;->m:I

    iget-object p1, p0, Lapp/todolist/view/BarChartView;->r:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    const/4 v1, 0x2

    if-lt p1, v1, :cond_1

    iget-object p1, p0, Lapp/todolist/view/BarChartView;->r:Ljava/util/List;

    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v1, p0, Lapp/todolist/view/BarChartView;->r:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sub-int/2addr p1, v0

    iput p1, p0, Lapp/todolist/view/BarChartView;->j:I

    :cond_1
    iget p1, p0, Lapp/todolist/view/BarChartView;->m:I

    add-int/2addr p1, v4

    iget v0, p0, Lapp/todolist/view/BarChartView;->f:I

    add-int/2addr p1, v0

    iput p1, p0, Lapp/todolist/view/BarChartView;->k:I

    iget p1, p0, Lapp/todolist/view/BarChartView;->g:I

    iget-object v0, p0, Lapp/todolist/view/BarChartView;->r:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v4

    mul-int p1, p1, v0

    iget v0, p0, Lapp/todolist/view/BarChartView;->u:I

    add-int/2addr p1, v0

    iput p1, p0, Lapp/todolist/view/BarChartView;->l:I

    return-void
.end method

.method public b(Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0, p1}, Lapp/todolist/view/BarChartView;->c(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lapp/todolist/view/BarChartView;->d(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public final c(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1}, Ljava/util/Collections;->max(Ljava/util/Collection;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x8

    if-gt v1, v2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    rem-int/lit8 v1, v1, 0x4

    if-nez v1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    add-int/lit8 v2, p1, 0x4

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    rem-int/lit8 v1, v1, 0x4

    rsub-int/lit8 v1, v1, 0x4

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    add-int v2, p1, v1

    :goto_0
    div-int/lit8 v2, v2, 0x4

    const/4 p1, 0x0

    const/4 v1, 0x0

    :goto_1
    const/4 v3, 0x5

    if-ge v1, v3, :cond_2

    mul-int v3, v1, v2

    add-int/2addr v3, p1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    return-object v0
.end method

.method public d(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lapp/todolist/view/BarChartView;->q:Ljava/util/List;

    iput-object p2, p0, Lapp/todolist/view/BarChartView;->s:Ljava/util/List;

    iput-object p3, p0, Lapp/todolist/view/BarChartView;->r:Ljava/util/List;

    iget-object p1, p0, Lapp/todolist/view/BarChartView;->a:Landroid/content/Context;

    invoke-virtual {p0, p1}, Lapp/todolist/view/BarChartView;->a(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 14
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DrawAllocation"
        }
    .end annotation

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    const-string v0, "TAG"

    const-string v1, "onDraw()"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p0, Lapp/todolist/view/BarChartView;->k:I

    int-to-float v2, v0

    iget v1, p0, Lapp/todolist/view/BarChartView;->l:I

    int-to-float v3, v1

    int-to-float v4, v0

    iget-object v0, p0, Lapp/todolist/view/BarChartView;->r:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v7, 0x1

    sub-int/2addr v0, v7

    iget v5, p0, Lapp/todolist/view/BarChartView;->g:I

    mul-int v0, v0, v5

    sub-int/2addr v1, v0

    int-to-float v5, v1

    iget-object v6, p0, Lapp/todolist/view/BarChartView;->c:Landroid/graphics/Paint;

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget v0, p0, Lapp/todolist/view/BarChartView;->k:I

    int-to-float v2, v0

    iget v1, p0, Lapp/todolist/view/BarChartView;->l:I

    int-to-float v3, v1

    iget-object v1, p0, Lapp/todolist/view/BarChartView;->q:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget v4, p0, Lapp/todolist/view/BarChartView;->i:I

    mul-int v1, v1, v4

    add-int/2addr v0, v1

    iget v1, p0, Lapp/todolist/view/BarChartView;->h:I

    iget-object v4, p0, Lapp/todolist/view/BarChartView;->q:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/2addr v4, v7

    mul-int v1, v1, v4

    add-int/2addr v0, v1

    int-to-float v4, v0

    iget v0, p0, Lapp/todolist/view/BarChartView;->l:I

    int-to-float v5, v0

    iget-object v6, p0, Lapp/todolist/view/BarChartView;->c:Landroid/graphics/Paint;

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lapp/todolist/view/BarChartView;->r:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iget-object v3, p0, Lapp/todolist/view/BarChartView;->d:Landroid/graphics/Paint;

    iget-object v4, p0, Lapp/todolist/view/BarChartView;->r:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lapp/todolist/view/BarChartView;->r:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v3, v4, v0, v5, v2}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    iget-object v3, p0, Lapp/todolist/view/BarChartView;->r:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Lapp/todolist/view/BarChartView;->k:I

    sub-int/2addr v4, v7

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    sub-int/2addr v4, v2

    iget v2, p0, Lapp/todolist/view/BarChartView;->f:I

    sub-int/2addr v4, v2

    int-to-float v2, v4

    iget v4, p0, Lapp/todolist/view/BarChartView;->l:I

    iget v5, p0, Lapp/todolist/view/BarChartView;->g:I

    mul-int v5, v5, v1

    sub-int/2addr v4, v5

    iget v5, p0, Lapp/todolist/view/BarChartView;->u:I

    add-int/2addr v4, v5

    int-to-float v4, v4

    iget-object v5, p0, Lapp/todolist/view/BarChartView;->d:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v2, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget v1, p0, Lapp/todolist/view/BarChartView;->k:I

    iget v2, p0, Lapp/todolist/view/BarChartView;->f:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    const/4 v2, 0x0

    :goto_1
    iget-object v3, p0, Lapp/todolist/view/BarChartView;->s:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    :try_start_0
    new-instance v3, Landroid/graphics/RectF;

    iget v4, p0, Lapp/todolist/view/BarChartView;->l:I

    int-to-double v4, v4

    iget-object v6, p0, Lapp/todolist/view/BarChartView;->q:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-double v8, v6

    iget v6, p0, Lapp/todolist/view/BarChartView;->g:I

    int-to-double v10, v6

    const-wide/high16 v12, 0x3ff0000000000000L    # 1.0

    mul-double v10, v10, v12

    iget v6, p0, Lapp/todolist/view/BarChartView;->j:I

    int-to-double v12, v6

    div-double/2addr v10, v12

    mul-double v8, v8, v10

    sub-double/2addr v4, v8

    double-to-float v4, v4

    iget v5, p0, Lapp/todolist/view/BarChartView;->i:I

    int-to-float v5, v5

    add-float/2addr v5, v1

    iget v6, p0, Lapp/todolist/view/BarChartView;->l:I

    int-to-float v6, v6

    invoke-direct {v3, v1, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance v4, Landroid/graphics/Path;

    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    const/16 v5, 0x8

    new-array v5, v5, [F

    iget v6, p0, Lapp/todolist/view/BarChartView;->v:I

    int-to-float v8, v6

    aput v8, v5, v0

    int-to-float v8, v6

    aput v8, v5, v7

    int-to-float v8, v6

    const/4 v9, 0x2

    aput v8, v5, v9

    const/4 v8, 0x3

    int-to-float v6, v6

    aput v6, v5, v8

    const/4 v6, 0x4

    const/4 v8, 0x0

    aput v8, v5, v6

    const/4 v6, 0x5

    aput v8, v5, v6

    const/4 v6, 0x6

    aput v8, v5, v6

    const/4 v6, 0x7

    aput v8, v5, v6

    sget-object v6, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    invoke-virtual {v4, v3, v5, v6}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    iget-object v3, p0, Lapp/todolist/view/BarChartView;->b:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iget-object v4, p0, Lapp/todolist/view/BarChartView;->e:Landroid/graphics/Paint;

    iget-object v5, p0, Lapp/todolist/view/BarChartView;->s:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iget-object v6, p0, Lapp/todolist/view/BarChartView;->s:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v4, v5, v0, v6, v3}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    iget v4, p0, Lapp/todolist/view/BarChartView;->i:I

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v3

    sub-int/2addr v4, v3

    div-int/2addr v4, v9

    iget-object v3, p0, Lapp/todolist/view/BarChartView;->s:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    int-to-float v4, v4

    add-float/2addr v4, v1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v5

    iget v6, p0, Lapp/todolist/view/BarChartView;->f:I

    sub-int/2addr v5, v6

    int-to-float v5, v5

    iget-object v6, p0, Lapp/todolist/view/BarChartView;->e:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget v3, p0, Lapp/todolist/view/BarChartView;->i:I

    int-to-float v3, v3

    add-float/2addr v3, v1

    iget v1, p0, Lapp/todolist/view/BarChartView;->h:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    int-to-float v1, v1

    add-float/2addr v3, v1

    move v1, v3

    goto :goto_2

    :catch_0
    move-exception v3

    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    :cond_1
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "heightSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v1, "widthSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TAG"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lapp/todolist/view/BarChartView;->r:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    div-int v0, p2, v0

    iput v0, p0, Lapp/todolist/view/BarChartView;->g:I

    iget v0, p0, Lapp/todolist/view/BarChartView;->k:I

    sub-int v0, p1, v0

    iget v1, p0, Lapp/todolist/view/BarChartView;->f:I

    sub-int/2addr v0, v1

    iget-object v1, p0, Lapp/todolist/view/BarChartView;->s:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget v2, p0, Lapp/todolist/view/BarChartView;->i:I

    mul-int v1, v1, v2

    sub-int/2addr v0, v1

    iget-object v1, p0, Lapp/todolist/view/BarChartView;->s:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    div-int/2addr v0, v1

    iput v0, p0, Lapp/todolist/view/BarChartView;->h:I

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700a3

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sub-int v0, p2, v0

    iget v1, p0, Lapp/todolist/view/BarChartView;->f:I

    sub-int/2addr v0, v1

    iput v0, p0, Lapp/todolist/view/BarChartView;->l:I

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method
