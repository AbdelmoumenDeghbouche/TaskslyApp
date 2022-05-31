.class public Lapp/todolist/view/GuideBubbleView;
.super Landroid/widget/RelativeLayout;


# instance fields
.field public final a:Landroid/graphics/Path;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public final j:Landroid/graphics/RectF;

.field public final k:Landroid/graphics/Paint;

.field public final l:Landroid/graphics/Paint;

.field public m:I

.field public n:Z

.field public o:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/GuideBubbleView;->a:Landroid/graphics/Path;

    const/4 v0, 0x4

    invoke-static {v0}, Lf/c/a/k/i;->b(I)I

    move-result v1

    iput v1, p0, Lapp/todolist/view/GuideBubbleView;->f:I

    invoke-static {v0}, Lf/c/a/k/i;->b(I)I

    move-result v1

    iput v1, p0, Lapp/todolist/view/GuideBubbleView;->g:I

    invoke-static {v0}, Lf/c/a/k/i;->b(I)I

    move-result v1

    iput v1, p0, Lapp/todolist/view/GuideBubbleView;->h:I

    invoke-static {v0}, Lf/c/a/k/i;->b(I)I

    move-result v0

    iput v0, p0, Lapp/todolist/view/GuideBubbleView;->i:I

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/GuideBubbleView;->j:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/GuideBubbleView;->k:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/GuideBubbleView;->l:Landroid/graphics/Paint;

    const/16 v0, 0x8

    invoke-static {v0}, Lf/c/a/k/i;->b(I)I

    move-result v0

    iput v0, p0, Lapp/todolist/view/GuideBubbleView;->m:I

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lapp/todolist/view/GuideBubbleView;->c(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/GuideBubbleView;->a:Landroid/graphics/Path;

    const/4 v0, 0x4

    invoke-static {v0}, Lf/c/a/k/i;->b(I)I

    move-result v1

    iput v1, p0, Lapp/todolist/view/GuideBubbleView;->f:I

    invoke-static {v0}, Lf/c/a/k/i;->b(I)I

    move-result v1

    iput v1, p0, Lapp/todolist/view/GuideBubbleView;->g:I

    invoke-static {v0}, Lf/c/a/k/i;->b(I)I

    move-result v1

    iput v1, p0, Lapp/todolist/view/GuideBubbleView;->h:I

    invoke-static {v0}, Lf/c/a/k/i;->b(I)I

    move-result v0

    iput v0, p0, Lapp/todolist/view/GuideBubbleView;->i:I

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/GuideBubbleView;->j:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/GuideBubbleView;->k:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/GuideBubbleView;->l:Landroid/graphics/Paint;

    const/16 v0, 0x8

    invoke-static {v0}, Lf/c/a/k/i;->b(I)I

    move-result v0

    iput v0, p0, Lapp/todolist/view/GuideBubbleView;->m:I

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/GuideBubbleView;->c(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p3, Landroid/graphics/Path;

    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/GuideBubbleView;->a:Landroid/graphics/Path;

    const/4 p3, 0x4

    invoke-static {p3}, Lf/c/a/k/i;->b(I)I

    move-result v0

    iput v0, p0, Lapp/todolist/view/GuideBubbleView;->f:I

    invoke-static {p3}, Lf/c/a/k/i;->b(I)I

    move-result v0

    iput v0, p0, Lapp/todolist/view/GuideBubbleView;->g:I

    invoke-static {p3}, Lf/c/a/k/i;->b(I)I

    move-result v0

    iput v0, p0, Lapp/todolist/view/GuideBubbleView;->h:I

    invoke-static {p3}, Lf/c/a/k/i;->b(I)I

    move-result p3

    iput p3, p0, Lapp/todolist/view/GuideBubbleView;->i:I

    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/GuideBubbleView;->j:Landroid/graphics/RectF;

    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/GuideBubbleView;->k:Landroid/graphics/Paint;

    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/GuideBubbleView;->l:Landroid/graphics/Paint;

    const/16 p3, 0x8

    invoke-static {p3}, Lf/c/a/k/i;->b(I)I

    move-result p3

    iput p3, p0, Lapp/todolist/view/GuideBubbleView;->m:I

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/GuideBubbleView;->c(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;IIIIIII)V
    .locals 14

    move-object v0, p0

    move-object v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move/from16 v10, p4

    move/from16 v1, p5

    move/from16 v11, p6

    move/from16 v12, p10

    sub-int v13, v1, p9

    int-to-float v4, v10

    int-to-float v5, v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;)I

    move-result v1

    int-to-float v2, v11

    move/from16 v3, p7

    int-to-float v3, v3

    sub-int v4, v10, v11

    int-to-float v5, v4

    sub-int v6, v13, v12

    int-to-float v6, v6

    invoke-virtual {v8, v2, v3, v5, v6}, Landroid/graphics/RectF;->set(FFFF)V

    iget v3, v0, Lapp/todolist/view/GuideBubbleView;->m:I

    int-to-float v5, v3

    int-to-float v3, v3

    invoke-virtual {p1, v8, v5, v3, v9}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    iget-object v3, v0, Lapp/todolist/view/GuideBubbleView;->a:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->rewind()V

    sub-int v4, v4, p8

    int-to-float v3, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v3, v5

    iget v5, v0, Lapp/todolist/view/GuideBubbleView;->o:I

    const/16 v8, 0x28

    if-nez v5, :cond_0

    invoke-static {v8}, Lf/c/a/k/i;->b(I)I

    move-result v3

    add-int/2addr v3, v11

    :goto_0
    int-to-float v3, v3

    goto :goto_1

    :cond_0
    const/4 v10, 0x2

    if-ne v5, v10, :cond_1

    add-int v3, v11, v4

    invoke-static {v8}, Lf/c/a/k/i;->b(I)I

    move-result v4

    sub-int/2addr v3, v4

    goto :goto_0

    :cond_1
    :goto_1
    iget-object v4, v0, Lapp/todolist/view/GuideBubbleView;->a:Landroid/graphics/Path;

    add-float/2addr v2, v3

    int-to-float v3, v12

    sub-float v5, v2, v3

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Path;->moveTo(FF)V

    iget-object v4, v0, Lapp/todolist/view/GuideBubbleView;->a:Landroid/graphics/Path;

    int-to-float v8, v13

    invoke-virtual {v4, v2, v8}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v4, v0, Lapp/todolist/view/GuideBubbleView;->a:Landroid/graphics/Path;

    add-float/2addr v2, v3

    invoke-virtual {v4, v2, v6}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v2, v0, Lapp/todolist/view/GuideBubbleView;->a:Landroid/graphics/Path;

    invoke-virtual {v2, v5, v6}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v2, v0, Lapp/todolist/view/GuideBubbleView;->a:Landroid/graphics/Path;

    invoke-virtual {p1, v2, v9}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method

.method public final b(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;IIIIIII)V
    .locals 15

    move-object v0, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move/from16 v10, p4

    move/from16 v11, p6

    move/from16 v12, p7

    move/from16 v13, p10

    int-to-float v4, v10

    move/from16 v1, p5

    int-to-float v14, v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v6, 0x0

    move-object/from16 v1, p1

    move v5, v14

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;)I

    move-result v1

    int-to-float v2, v11

    add-int v3, v12, v13

    int-to-float v3, v3

    sub-int v4, v10, v11

    int-to-float v5, v4

    invoke-virtual {v8, v2, v3, v5, v14}, Landroid/graphics/RectF;->set(FFFF)V

    iget v5, v0, Lapp/todolist/view/GuideBubbleView;->m:I

    int-to-float v6, v5

    int-to-float v5, v5

    invoke-virtual {v7, v8, v6, v5, v9}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    iget-object v5, v0, Lapp/todolist/view/GuideBubbleView;->a:Landroid/graphics/Path;

    invoke-virtual {v5}, Landroid/graphics/Path;->rewind()V

    sub-int v4, v4, p8

    int-to-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    iget v6, v0, Lapp/todolist/view/GuideBubbleView;->o:I

    if-nez v6, :cond_0

    div-float/2addr v4, v5

    add-float/2addr v4, v2

    goto :goto_0

    :cond_0
    const/4 v8, 0x2

    if-ne v6, v8, :cond_1

    div-float v5, v4, v5

    add-float/2addr v4, v5

    :cond_1
    :goto_0
    iget-object v5, v0, Lapp/todolist/view/GuideBubbleView;->a:Landroid/graphics/Path;

    add-float/2addr v2, v4

    int-to-float v4, v13

    sub-float v6, v2, v4

    invoke-virtual {v5, v6, v3}, Landroid/graphics/Path;->moveTo(FF)V

    iget-object v5, v0, Lapp/todolist/view/GuideBubbleView;->a:Landroid/graphics/Path;

    int-to-float v8, v12

    invoke-virtual {v5, v2, v8}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v5, v0, Lapp/todolist/view/GuideBubbleView;->a:Landroid/graphics/Path;

    add-float/2addr v2, v4

    invoke-virtual {v5, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v2, v0, Lapp/todolist/view/GuideBubbleView;->a:Landroid/graphics/Path;

    invoke-virtual {v2, v6, v3}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v2, v0, Lapp/todolist/view/GuideBubbleView;->a:Landroid/graphics/Path;

    invoke-virtual {v7, v2, v9}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {v7, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method

.method public final c(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5

    sget-object v0, Lcom/todo/R$styleable;->GuideBubbleView:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p2

    invoke-static {p1}, Lf/c/c/f/g;->t(Landroid/content/Context;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, 0x0

    invoke-virtual {p2, v0, p1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {p2, v2, p1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    const/4 v3, 0x4

    invoke-virtual {p2, v3, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    iput-boolean v3, p0, Lapp/todolist/view/GuideBubbleView;->n:Z

    const/4 v3, 0x5

    invoke-virtual {p2, v3, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    iput v3, p0, Lapp/todolist/view/GuideBubbleView;->o:I

    iget v3, p0, Lapp/todolist/view/GuideBubbleView;->h:I

    const/4 v4, 0x6

    invoke-virtual {p2, v4, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v3

    iput v3, p0, Lapp/todolist/view/GuideBubbleView;->h:I

    iget v3, p0, Lapp/todolist/view/GuideBubbleView;->i:I

    const/4 v4, 0x7

    invoke-virtual {p2, v4, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v3

    iput v3, p0, Lapp/todolist/view/GuideBubbleView;->i:I

    iget v3, p0, Lapp/todolist/view/GuideBubbleView;->f:I

    const/4 v4, 0x2

    invoke-virtual {p2, v4, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v3

    iput v3, p0, Lapp/todolist/view/GuideBubbleView;->f:I

    iget v3, p0, Lapp/todolist/view/GuideBubbleView;->g:I

    const/4 v4, 0x3

    invoke-virtual {p2, v4, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v3

    iput v3, p0, Lapp/todolist/view/GuideBubbleView;->g:I

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    iget-object p2, p0, Lapp/todolist/view/GuideBubbleView;->k:Landroid/graphics/Paint;

    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p2, p0, Lapp/todolist/view/GuideBubbleView;->k:Landroid/graphics/Paint;

    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p2, p0, Lapp/todolist/view/GuideBubbleView;->k:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p2, p0, Lapp/todolist/view/GuideBubbleView;->l:Landroid/graphics/Paint;

    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p2, p0, Lapp/todolist/view/GuideBubbleView;->l:Landroid/graphics/Paint;

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Lapp/todolist/view/GuideBubbleView;->l:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/16 p1, 0x8

    invoke-static {p1}, Lf/c/a/k/i;->b(I)I

    move-result p1

    iput p1, p0, Lapp/todolist/view/GuideBubbleView;->m:I

    iget-boolean p1, p0, Lapp/todolist/view/GuideBubbleView;->n:Z

    if-eqz p1, :cond_0

    iget p1, p0, Lapp/todolist/view/GuideBubbleView;->i:I

    invoke-virtual {p0, v0, p1, v0, v0}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    goto :goto_0

    :cond_0
    iget p1, p0, Lapp/todolist/view/GuideBubbleView;->g:I

    invoke-virtual {p0, v0, v0, v0, p1}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    :goto_0
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 11

    iget-boolean v0, p0, Lapp/todolist/view/GuideBubbleView;->n:Z

    if-eqz v0, :cond_0

    iget-object v2, p0, Lapp/todolist/view/GuideBubbleView;->j:Landroid/graphics/RectF;

    iget-object v3, p0, Lapp/todolist/view/GuideBubbleView;->l:Landroid/graphics/Paint;

    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getHeight()I

    move-result v5

    iget v6, p0, Lapp/todolist/view/GuideBubbleView;->b:I

    iget v7, p0, Lapp/todolist/view/GuideBubbleView;->c:I

    iget v8, p0, Lapp/todolist/view/GuideBubbleView;->d:I

    const/4 v9, 0x0

    iget v10, p0, Lapp/todolist/view/GuideBubbleView;->i:I

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v10}, Lapp/todolist/view/GuideBubbleView;->b(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;IIIIIII)V

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lapp/todolist/view/GuideBubbleView;->j:Landroid/graphics/RectF;

    iget-object v3, p0, Lapp/todolist/view/GuideBubbleView;->l:Landroid/graphics/Paint;

    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getHeight()I

    move-result v5

    iget v6, p0, Lapp/todolist/view/GuideBubbleView;->b:I

    const/4 v7, 0x0

    iget v8, p0, Lapp/todolist/view/GuideBubbleView;->d:I

    iget v9, p0, Lapp/todolist/view/GuideBubbleView;->e:I

    iget v10, p0, Lapp/todolist/view/GuideBubbleView;->g:I

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v10}, Lapp/todolist/view/GuideBubbleView;->a(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;IIIIIII)V

    :goto_0
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    return-void
.end method
