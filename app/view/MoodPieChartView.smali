.class public Lapp/todolist/view/MoodPieChartView;
.super Landroid/view/View;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/todolist/view/MoodPieChartView$a;,
        Lapp/todolist/view/MoodPieChartView$b;
    }
.end annotation


# instance fields
.field public a:I

.field public b:F

.field public c:F

.field public d:F

.field public e:F

.field public final f:Landroid/graphics/RectF;

.field public final g:Landroid/graphics/RectF;

.field public final h:Landroid/graphics/Paint;

.field public final i:Landroid/graphics/Paint;

.field public final j:Landroid/text/TextPaint;

.field public final k:Landroid/graphics/Paint;

.field public final l:Landroid/graphics/Paint;

.field public final m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lapp/todolist/view/MoodPieChartView$b;",
            ">;"
        }
    .end annotation
.end field

.field public final n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lapp/todolist/view/MoodPieChartView$a;",
            ">;"
        }
    .end annotation
.end field

.field public final o:I

.field public final p:I

.field public final q:Landroid/graphics/Matrix;

.field public final r:[F

.field public final s:[F

.field public t:Lapp/todolist/view/MoodPieChartView$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lapp/todolist/view/MoodPieChartView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lapp/todolist/view/MoodPieChartView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/MoodPieChartView;->g:Landroid/graphics/RectF;

    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/MoodPieChartView;->h:Landroid/graphics/Paint;

    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/MoodPieChartView;->i:Landroid/graphics/Paint;

    new-instance p3, Landroid/text/TextPaint;

    invoke-direct {p3}, Landroid/text/TextPaint;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/MoodPieChartView;->j:Landroid/text/TextPaint;

    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/MoodPieChartView;->k:Landroid/graphics/Paint;

    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/MoodPieChartView;->l:Landroid/graphics/Paint;

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/MoodPieChartView;->m:Ljava/util/List;

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/MoodPieChartView;->n:Ljava/util/List;

    const/4 p3, 0x2

    invoke-static {p3}, Lf/c/a/k/i;->b(I)I

    move-result p3

    iput p3, p0, Lapp/todolist/view/MoodPieChartView;->o:I

    const/4 p3, 0x4

    invoke-static {p3}, Lf/c/a/k/i;->b(I)I

    move-result v0

    iput v0, p0, Lapp/todolist/view/MoodPieChartView;->p:I

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/MoodPieChartView;->q:Landroid/graphics/Matrix;

    new-array v0, p3, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lapp/todolist/view/MoodPieChartView;->r:[F

    new-array p3, p3, [F

    fill-array-data p3, :array_1

    iput-object p3, p0, Lapp/todolist/view/MoodPieChartView;->s:[F

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/MoodPieChartView;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    const/4 p1, 0x0

    iput p1, p0, Lapp/todolist/view/MoodPieChartView;->a:I

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->h:Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->h:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setDither(Z)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->h:Landroid/graphics/Paint;

    iget v0, p0, Lapp/todolist/view/MoodPieChartView;->a:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->h:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->l:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->l:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setDither(Z)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->l:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->i:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->i:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setDither(Z)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->i:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->i:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->k:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->k:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setDither(Z)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->k:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->k:Landroid/graphics/Paint;

    invoke-static {p2}, Lf/c/a/k/i;->b(I)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->k:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->j:Landroid/text/TextPaint;

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->j:Landroid/text/TextPaint;

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setDither(Z)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->j:Landroid/text/TextPaint;

    const/16 p2, 0xa

    invoke-static {p2}, Lf/c/a/k/i;->b(I)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setTextSize(F)V

    iget-object p1, p0, Lapp/todolist/view/MoodPieChartView;->j:Landroid/text/TextPaint;

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setColor(I)V

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 13

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget v0, p0, Lapp/todolist/view/MoodPieChartView;->b:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_3

    iget-object v0, p0, Lapp/todolist/view/MoodPieChartView;->m:Ljava/util/List;

    if-eqz v0, :cond_3

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingStart()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    iget-object v2, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    int-to-float v0, v0

    int-to-float v1, v1

    iget v3, p0, Lapp/todolist/view/MoodPieChartView;->b:F

    const/high16 v4, 0x40000000    # 2.0f

    mul-float v5, v3, v4

    add-float/2addr v5, v0

    mul-float v3, v3, v4

    add-float/2addr v3, v1

    invoke-virtual {v2, v0, v1, v5, v3}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v0, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->saveLayer(Landroid/graphics/RectF;Landroid/graphics/Paint;)I

    move-result v0

    iget-object v2, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v2, v4

    iget-object v3, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    div-float/2addr v3, v4

    iget v5, p0, Lapp/todolist/view/MoodPieChartView;->b:F

    iget-object v6, p0, Lapp/todolist/view/MoodPieChartView;->h:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v2, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v2, v4

    iget-object v3, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    div-float/2addr v3, v4

    iget v5, p0, Lapp/todolist/view/MoodPieChartView;->c:F

    iget-object v6, p0, Lapp/todolist/view/MoodPieChartView;->i:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    iget-object v0, p0, Lapp/todolist/view/MoodPieChartView;->g:Landroid/graphics/RectF;

    iget-object v2, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    iget v3, v2, Landroid/graphics/RectF;->left:F

    iget v5, p0, Lapp/todolist/view/MoodPieChartView;->o:I

    int-to-float v6, v5

    add-float/2addr v3, v6

    iget v6, v2, Landroid/graphics/RectF;->top:F

    int-to-float v7, v5

    add-float/2addr v6, v7

    iget v7, v2, Landroid/graphics/RectF;->right:F

    int-to-float v8, v5

    sub-float/2addr v7, v8

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    int-to-float v5, v5

    sub-float/2addr v2, v5

    invoke-virtual {v0, v3, v6, v7, v2}, Landroid/graphics/RectF;->set(FFFF)V

    const/high16 v0, -0x3d4c0000    # -90.0f

    iget-object v2, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    invoke-virtual {p1, v2, v1}, Landroid/graphics/Canvas;->saveLayer(Landroid/graphics/RectF;Landroid/graphics/Paint;)I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    iget-object v5, p0, Lapp/todolist/view/MoodPieChartView;->m:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    const/4 v11, 0x1

    if-ge v3, v5, :cond_1

    iget-object v5, p0, Lapp/todolist/view/MoodPieChartView;->m:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lapp/todolist/view/MoodPieChartView$b;

    iput-object v5, p0, Lapp/todolist/view/MoodPieChartView;->t:Lapp/todolist/view/MoodPieChartView$b;

    iget-object v6, p0, Lapp/todolist/view/MoodPieChartView;->l:Landroid/graphics/Paint;

    iget v5, v5, Lapp/todolist/view/MoodPieChartView$b;->b:I

    invoke-virtual {v6, v5}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v6, p0, Lapp/todolist/view/MoodPieChartView;->g:Landroid/graphics/RectF;

    iget-object v5, p0, Lapp/todolist/view/MoodPieChartView;->t:Lapp/todolist/view/MoodPieChartView$b;

    invoke-virtual {v5}, Lapp/todolist/view/MoodPieChartView$b;->a()F

    move-result v5

    const/high16 v12, 0x43b40000    # 360.0f

    mul-float v8, v5, v12

    const/4 v9, 0x1

    iget-object v10, p0, Lapp/todolist/view/MoodPieChartView;->l:Landroid/graphics/Paint;

    move-object v5, p1

    move v7, v0

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    iget-object v5, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v5

    div-float/2addr v5, v4

    iget-object v6, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    div-float/2addr v6, v4

    iget v7, p0, Lapp/todolist/view/MoodPieChartView;->e:F

    iget-object v8, p0, Lapp/todolist/view/MoodPieChartView;->i:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v5, p0, Lapp/todolist/view/MoodPieChartView;->t:Lapp/todolist/view/MoodPieChartView$b;

    invoke-virtual {v5}, Lapp/todolist/view/MoodPieChartView$b;->a()F

    iget-object v5, p0, Lapp/todolist/view/MoodPieChartView;->n:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v3, v5, :cond_0

    iget-object v5, p0, Lapp/todolist/view/MoodPieChartView;->n:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lapp/todolist/view/MoodPieChartView$a;

    iget-object v6, p0, Lapp/todolist/view/MoodPieChartView;->q:Landroid/graphics/Matrix;

    invoke-virtual {v6}, Landroid/graphics/Matrix;->reset()V

    iget-object v6, p0, Lapp/todolist/view/MoodPieChartView;->q:Landroid/graphics/Matrix;

    iget-object v7, p0, Lapp/todolist/view/MoodPieChartView;->t:Lapp/todolist/view/MoodPieChartView$b;

    invoke-virtual {v7}, Lapp/todolist/view/MoodPieChartView$b;->a()F

    move-result v7

    mul-float v7, v7, v12

    add-float/2addr v7, v0

    iget-object v8, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    move-result v8

    div-float/2addr v8, v4

    iget-object v9, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    invoke-virtual {v9}, Landroid/graphics/RectF;->height()F

    move-result v9

    div-float/2addr v9, v4

    invoke-virtual {v6, v7, v8, v9}, Landroid/graphics/Matrix;->setRotate(FFF)V

    iget-object v6, p0, Lapp/todolist/view/MoodPieChartView;->r:[F

    iget-object v7, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    move-result v7

    div-float/2addr v7, v4

    iget v8, p0, Lapp/todolist/view/MoodPieChartView;->c:F

    add-float/2addr v7, v8

    aput v7, v6, v2

    iget-object v6, p0, Lapp/todolist/view/MoodPieChartView;->r:[F

    iget-object v7, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    move-result v7

    div-float/2addr v7, v4

    aput v7, v6, v11

    iget-object v6, p0, Lapp/todolist/view/MoodPieChartView;->r:[F

    iget-object v7, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    move-result v7

    div-float/2addr v7, v4

    iget v8, p0, Lapp/todolist/view/MoodPieChartView;->d:F

    add-float/2addr v7, v8

    const/4 v8, 0x2

    aput v7, v6, v8

    iget-object v6, p0, Lapp/todolist/view/MoodPieChartView;->r:[F

    iget-object v7, p0, Lapp/todolist/view/MoodPieChartView;->f:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    move-result v7

    div-float/2addr v7, v4

    const/4 v9, 0x3

    aput v7, v6, v9

    iget-object v6, p0, Lapp/todolist/view/MoodPieChartView;->q:Landroid/graphics/Matrix;

    iget-object v7, p0, Lapp/todolist/view/MoodPieChartView;->s:[F

    iget-object v10, p0, Lapp/todolist/view/MoodPieChartView;->r:[F

    invoke-virtual {v6, v7, v10}, Landroid/graphics/Matrix;->mapPoints([F[F)V

    iget-object v6, p0, Lapp/todolist/view/MoodPieChartView;->s:[F

    aget v7, v6, v2

    aget v10, v6, v11

    aget v8, v6, v8

    aget v6, v6, v9

    invoke-virtual {v5, v7, v10, v8, v6}, Lapp/todolist/view/MoodPieChartView$a;->a(FFFF)V

    :cond_0
    iget-object v5, p0, Lapp/todolist/view/MoodPieChartView;->t:Lapp/todolist/view/MoodPieChartView$b;

    invoke-virtual {v5}, Lapp/todolist/view/MoodPieChartView$b;->a()F

    move-result v5

    mul-float v5, v5, v12

    add-float/2addr v0, v5

    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    :cond_1
    iget-object v0, p0, Lapp/todolist/view/MoodPieChartView;->n:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, v11, :cond_2

    iget-object v0, p0, Lapp/todolist/view/MoodPieChartView;->n:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lapp/todolist/view/MoodPieChartView$a;

    iget v4, v2, Lapp/todolist/view/MoodPieChartView$a;->a:F

    iget v5, v2, Lapp/todolist/view/MoodPieChartView$a;->b:F

    iget v6, v2, Lapp/todolist/view/MoodPieChartView$a;->c:F

    iget v7, v2, Lapp/todolist/view/MoodPieChartView$a;->d:F

    iget-object v8, p0, Lapp/todolist/view/MoodPieChartView;->k:Landroid/graphics/Paint;

    move-object v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_1

    :cond_2
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_3
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingStart()I

    move-result p2

    sub-int/2addr p1, p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingEnd()I

    move-result p2

    sub-int/2addr p1, p2

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    sub-int/2addr p2, v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    sub-int/2addr p2, v0

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    int-to-float p1, p1

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr p1, p2

    iput p1, p0, Lapp/todolist/view/MoodPieChartView;->b:F

    iget p2, p0, Lapp/todolist/view/MoodPieChartView;->o:I

    int-to-float p2, p2

    sub-float p2, p1, p2

    iput p2, p0, Lapp/todolist/view/MoodPieChartView;->d:F

    const p2, 0x3ee38e39

    mul-float p1, p1, p2

    iput p1, p0, Lapp/todolist/view/MoodPieChartView;->e:F

    iget p2, p0, Lapp/todolist/view/MoodPieChartView;->p:I

    int-to-float p2, p2

    sub-float/2addr p1, p2

    iput p1, p0, Lapp/todolist/view/MoodPieChartView;->c:F

    return-void
.end method

.method public setPercentInfoList(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lapp/todolist/view/MoodPieChartView$b;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lapp/todolist/view/MoodPieChartView;->m:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lapp/todolist/view/MoodPieChartView;->n:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lapp/todolist/view/MoodPieChartView;->m:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    const/4 v0, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lapp/todolist/view/MoodPieChartView;->n:Ljava/util/List;

    new-instance v2, Lapp/todolist/view/MoodPieChartView$a;

    const/high16 v3, -0x40800000    # -1.0f

    invoke-direct {v2, v3, v3, v3, v3}, Lapp/todolist/view/MoodPieChartView$a;-><init>(FFFF)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
