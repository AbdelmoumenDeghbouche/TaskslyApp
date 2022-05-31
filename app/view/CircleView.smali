.class public Lapp/todolist/view/CircleView;
.super Landroid/view/View;


# instance fields
.field public a:I

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Paint;

.field public e:Landroid/graphics/Paint;

.field public f:Landroid/graphics/Paint;

.field public g:Landroid/graphics/Paint;

.field public h:Z

.field public i:Landroid/graphics/drawable/Drawable;

.field public j:Landroid/graphics/drawable/Drawable;

.field public k:Landroid/graphics/drawable/Drawable;

.field public l:Landroid/graphics/drawable/Drawable;

.field public m:Landroid/graphics/drawable/Drawable;

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:Landroid/graphics/Rect;

.field public s:Landroid/graphics/RectF;

.field public t:I

.field public u:I

.field public v:Z

.field public w:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lapp/todolist/view/CircleView;->s:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0}, Lapp/todolist/view/CircleView;->a()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lapp/todolist/view/CircleView;->s:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0}, Lapp/todolist/view/CircleView;->a()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lapp/todolist/view/CircleView;->s:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0}, Lapp/todolist/view/CircleView;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    invoke-static {}, Lapp/todolist/MainApplication;->m()Lapp/todolist/MainApplication;

    move-result-object v0

    const v1, 0x7f08019f

    invoke-static {v0, v1}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lapp/todolist/view/CircleView;->j:Landroid/graphics/drawable/Drawable;

    const v1, 0x7f08019d

    invoke-static {v0, v1}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    const v1, 0x7f080098

    invoke-static {v0, v1}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lapp/todolist/view/CircleView;->k:Landroid/graphics/drawable/Drawable;

    const v1, 0x7f0800ba

    invoke-static {v0, v1}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lapp/todolist/view/CircleView;->l:Landroid/graphics/drawable/Drawable;

    const v1, 0x7f0800bb

    invoke-static {v0, v1}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lapp/todolist/view/CircleView;->m:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_0

    const-string v2, "#FAD031"

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    :cond_0
    const v1, 0x7f060061

    invoke-static {v0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    const v1, 0x7f0601d0

    invoke-static {v0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060157

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060152

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0700a5

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0700a9

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0700a2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    iput v2, p0, Lapp/todolist/view/CircleView;->p:I

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0700a0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    iput v0, p0, Lapp/todolist/view/CircleView;->q:I

    iget-object v0, p0, Lapp/todolist/view/CircleView;->j:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    iput v0, p0, Lapp/todolist/view/CircleView;->n:I

    iget-object v0, p0, Lapp/todolist/view/CircleView;->j:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    iput v0, p0, Lapp/todolist/view/CircleView;->o:I

    :cond_1
    iget-object v0, p0, Lapp/todolist/view/CircleView;->c:Landroid/graphics/Paint;

    const/4 v2, 0x1

    if-nez v0, :cond_2

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/CircleView;->c:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->c:Landroid/graphics/Paint;

    iget v3, p0, Lapp/todolist/view/CircleView;->a:I

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->c:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    :cond_2
    iget-object v0, p0, Lapp/todolist/view/CircleView;->d:Landroid/graphics/Paint;

    if-nez v0, :cond_3

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/CircleView;->d:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->d:Landroid/graphics/Paint;

    const-string v3, "#FFFFFF"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->d:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    :cond_3
    iget-object v0, p0, Lapp/todolist/view/CircleView;->e:Landroid/graphics/Paint;

    if-nez v0, :cond_4

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/CircleView;->e:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->e:Landroid/graphics/Paint;

    int-to-float v3, v1

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->e:Landroid/graphics/Paint;

    iget v3, p0, Lapp/todolist/view/CircleView;->a:I

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->e:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    :cond_4
    iget-object v0, p0, Lapp/todolist/view/CircleView;->f:Landroid/graphics/Paint;

    if-nez v0, :cond_5

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/CircleView;->f:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->f:Landroid/graphics/Paint;

    int-to-float v3, v1

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->f:Landroid/graphics/Paint;

    const/high16 v3, -0x1000000

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->f:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    :cond_5
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/CircleView;->g:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->g:Landroid/graphics/Paint;

    const/4 v3, -0x1

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->g:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->b:Landroid/graphics/Paint;

    if-nez v0, :cond_6

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/CircleView;->b:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->b:Landroid/graphics/Paint;

    const-string v2, "#14000000"

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->b:Landroid/graphics/Paint;

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->b:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    :cond_6
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-boolean v0, p0, Lapp/todolist/view/CircleView;->v:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->s:Landroid/graphics/RectF;

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    iget v0, p0, Lapp/todolist/view/CircleView;->a:I

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lapp/todolist/view/CircleView;->h:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v1, v0

    iget-object v0, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    iget v2, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v2, v0

    iget-object v0, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iget-object v3, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object v3, p0, Lapp/todolist/view/CircleView;->f:Landroid/graphics/Paint;

    const/high16 v4, -0x1000000

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    int-to-float v1, v1

    int-to-float v2, v2

    int-to-float v0, v0

    iget-object v3, p0, Lapp/todolist/view/CircleView;->f:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v0, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->left:I

    iget v2, p0, Lapp/todolist/view/CircleView;->u:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->left:I

    iget v1, v0, Landroid/graphics/Rect;->top:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->top:I

    iget v1, v0, Landroid/graphics/Rect;->right:I

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->right:I

    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    iget-object v1, p0, Lapp/todolist/view/CircleView;->l:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->l:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget-object p1, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    iget v0, p1, Landroid/graphics/Rect;->right:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    goto/16 :goto_1

    :cond_0
    iget-object v0, p0, Lapp/todolist/view/CircleView;->l:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->l:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget-object p1, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    iget v0, p1, Landroid/graphics/Rect;->right:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    goto/16 :goto_1

    :cond_1
    iget-object v0, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v1, v0

    iget-object v0, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    iget v2, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v2, v0

    iget-object v0, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iget-object v3, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-boolean v3, p0, Lapp/todolist/view/CircleView;->h:Z

    if-eqz v3, :cond_3

    iget-boolean v3, p0, Lapp/todolist/view/CircleView;->w:Z

    if-eqz v3, :cond_2

    int-to-float v3, v1

    int-to-float v4, v2

    int-to-float v0, v0

    iget-object v5, p0, Lapp/todolist/view/CircleView;->c:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v0, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v5, p0, Lapp/todolist/view/CircleView;->b:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v0, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->j:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lapp/todolist/view/CircleView;->i:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_7

    iget v3, p0, Lapp/todolist/view/CircleView;->n:I

    div-int/lit8 v3, v3, 0x2

    sub-int v3, v1, v3

    iget v4, p0, Lapp/todolist/view/CircleView;->o:I

    div-int/lit8 v4, v4, 0x2

    sub-int v4, v2, v4

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v1, v3

    mul-int/lit8 v2, v2, 0x2

    sub-int/2addr v2, v4

    invoke-virtual {v0, v3, v4, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->i:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto/16 :goto_1

    :cond_2
    int-to-float v1, v1

    int-to-float v2, v2

    int-to-float v3, v0

    iget-object v4, p0, Lapp/todolist/view/CircleView;->e:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget v3, p0, Lapp/todolist/view/CircleView;->u:I

    sub-int v3, v0, v3

    int-to-float v3, v3

    iget-object v4, p0, Lapp/todolist/view/CircleView;->c:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget v3, p0, Lapp/todolist/view/CircleView;->u:I

    sub-int/2addr v0, v3

    int-to-float v0, v0

    iget-object v3, p0, Lapp/todolist/view/CircleView;->b:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v0, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_1

    :cond_3
    int-to-float v1, v1

    int-to-float v2, v2

    int-to-float v0, v0

    iget-object v3, p0, Lapp/todolist/view/CircleView;->c:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v0, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v3, p0, Lapp/todolist/view/CircleView;->b:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v0, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_1

    :cond_4
    iget-object v0, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->s:Landroid/graphics/RectF;

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    iget v0, p0, Lapp/todolist/view/CircleView;->a:I

    if-nez v0, :cond_5

    iget-object v0, p0, Lapp/todolist/view/CircleView;->s:Landroid/graphics/RectF;

    iget v1, p0, Lapp/todolist/view/CircleView;->t:I

    int-to-float v2, v1

    int-to-float v1, v1

    iget-object v3, p0, Lapp/todolist/view/CircleView;->g:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->k:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lapp/todolist/view/CircleView;->r:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->k:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_1

    :cond_5
    iget-boolean v0, p0, Lapp/todolist/view/CircleView;->h:Z

    if-eqz v0, :cond_6

    iget-object v0, p0, Lapp/todolist/view/CircleView;->s:Landroid/graphics/RectF;

    iget v1, p0, Lapp/todolist/view/CircleView;->t:I

    int-to-float v2, v1

    int-to-float v1, v1

    iget-object v3, p0, Lapp/todolist/view/CircleView;->e:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->s:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget v2, p0, Lapp/todolist/view/CircleView;->u:I

    int-to-float v3, v2

    add-float/2addr v1, v3

    iput v1, v0, Landroid/graphics/RectF;->left:F

    iget v1, v0, Landroid/graphics/RectF;->top:F

    int-to-float v3, v2

    add-float/2addr v1, v3

    iput v1, v0, Landroid/graphics/RectF;->top:F

    iget v1, v0, Landroid/graphics/RectF;->right:F

    int-to-float v3, v2

    sub-float/2addr v1, v3

    iput v1, v0, Landroid/graphics/RectF;->right:F

    iget v1, v0, Landroid/graphics/RectF;->bottom:F

    int-to-float v2, v2

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    iget v1, p0, Lapp/todolist/view/CircleView;->t:I

    int-to-float v2, v1

    int-to-float v1, v1

    iget-object v3, p0, Lapp/todolist/view/CircleView;->c:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_0

    :cond_6
    iget-object v0, p0, Lapp/todolist/view/CircleView;->s:Landroid/graphics/RectF;

    iget v1, p0, Lapp/todolist/view/CircleView;->t:I

    int-to-float v2, v1

    int-to-float v1, v1

    iget-object v3, p0, Lapp/todolist/view/CircleView;->c:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    :goto_0
    iget-object v0, p0, Lapp/todolist/view/CircleView;->s:Landroid/graphics/RectF;

    iget v1, p0, Lapp/todolist/view/CircleView;->t:I

    int-to-float v2, v1

    int-to-float v1, v1

    iget-object v3, p0, Lapp/todolist/view/CircleView;->b:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    :cond_7
    :goto_1
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    return-void
.end method

.method public setBgColor(Ljava/lang/Integer;)V
    .locals 0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    return-void
.end method

.method public setColor(I)V
    .locals 1

    iget v0, p0, Lapp/todolist/view/CircleView;->a:I

    if-eq v0, p1, :cond_2

    iput p1, p0, Lapp/todolist/view/CircleView;->a:I

    iget-object v0, p0, Lapp/todolist/view/CircleView;->c:Landroid/graphics/Paint;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lapp/todolist/view/CircleView;->e:Landroid/graphics/Paint;

    if-nez v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Lapp/todolist/view/CircleView;->a()V

    :cond_1
    iget-object v0, p0, Lapp/todolist/view/CircleView;->c:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lapp/todolist/view/CircleView;->e:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    :cond_2
    return-void
.end method

.method public setCorner(I)V
    .locals 0

    iput p1, p0, Lapp/todolist/view/CircleView;->t:I

    return-void
.end method

.method public setDrawCircle(Z)V
    .locals 0

    iput-boolean p1, p0, Lapp/todolist/view/CircleView;->v:Z

    return-void
.end method

.method public setPicked(Z)V
    .locals 1

    iget-boolean v0, p0, Lapp/todolist/view/CircleView;->h:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lapp/todolist/view/CircleView;->h:Z

    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    :cond_0
    return-void
.end method

.method public setSelectGap(I)V
    .locals 0

    iput p1, p0, Lapp/todolist/view/CircleView;->u:I

    return-void
.end method

.method public setUseDone(Z)V
    .locals 0

    iput-boolean p1, p0, Lapp/todolist/view/CircleView;->w:Z

    return-void
.end method

.method public setViewPadding(I)V
    .locals 0

    invoke-virtual {p0, p1, p1, p1, p1}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method
