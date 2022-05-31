.class public Lapp/todolist/view/DiaryImageView;
.super Landroid/view/View;


# instance fields
.field public a:Le/a/y/d;

.field public final b:Landroid/graphics/PointF;

.field public c:Le/a/y/d;

.field public d:Le/a/t/d;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/graphics/PointF;

    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    iput-object p1, p0, Lapp/todolist/view/DiaryImageView;->b:Landroid/graphics/PointF;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Landroid/graphics/PointF;

    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    iput-object p1, p0, Lapp/todolist/view/DiaryImageView;->b:Landroid/graphics/PointF;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Landroid/graphics/PointF;

    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    iput-object p1, p0, Lapp/todolist/view/DiaryImageView;->b:Landroid/graphics/PointF;

    return-void
.end method


# virtual methods
.method public getImageInfo()Le/a/y/d;
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/DiaryImageView;->a:Le/a/y/d;

    return-object v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    iget-object v0, p0, Lapp/todolist/view/DiaryImageView;->a:Le/a/y/d;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1, v1}, Le/a/y/d;->l(Landroid/graphics/Canvas;ZZ)V

    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    iget-object p1, p0, Lapp/todolist/view/DiaryImageView;->a:Le/a/y/d;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Le/a/y/d;->j()F

    move-result p1

    float-to-int p1, p1

    iget-object p2, p0, Lapp/todolist/view/DiaryImageView;->a:Le/a/y/d;

    invoke-virtual {p2}, Le/a/y/d;->i()F

    move-result p2

    float-to-int p2, p2

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iget-object v2, p0, Lapp/todolist/view/DiaryImageView;->b:Landroid/graphics/PointF;

    invoke-virtual {v2, v0, v1}, Landroid/graphics/PointF;->set(FF)V

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    iget-object v0, p0, Lapp/todolist/view/DiaryImageView;->a:Le/a/y/d;

    invoke-virtual {v0}, Le/a/y/d;->f()Ljava/util/List;

    move-result-object v0

    iget-object v2, p0, Lapp/todolist/view/DiaryImageView;->b:Landroid/graphics/PointF;

    invoke-static {v0, v2}, Le/a/x/i;->a(Ljava/util/List;Landroid/graphics/PointF;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object p1, p0, Lapp/todolist/view/DiaryImageView;->a:Le/a/y/d;

    iput-object p1, p0, Lapp/todolist/view/DiaryImageView;->c:Le/a/y/d;

    return v1

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_5

    iget-object p1, p0, Lapp/todolist/view/DiaryImageView;->c:Le/a/y/d;

    iget-object v0, p0, Lapp/todolist/view/DiaryImageView;->a:Le/a/y/d;

    if-ne p1, v0, :cond_3

    invoke-virtual {v0}, Le/a/y/d;->f()Ljava/util/List;

    move-result-object p1

    iget-object v0, p0, Lapp/todolist/view/DiaryImageView;->b:Landroid/graphics/PointF;

    invoke-static {p1, v0}, Le/a/x/i;->a(Ljava/util/List;Landroid/graphics/PointF;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lapp/todolist/view/DiaryImageView;->a:Le/a/y/d;

    invoke-virtual {p1}, Le/a/y/d;->g()Ljava/util/List;

    move-result-object p1

    iget-object v0, p0, Lapp/todolist/view/DiaryImageView;->b:Landroid/graphics/PointF;

    invoke-static {p1, v0}, Le/a/x/i;->a(Ljava/util/List;Landroid/graphics/PointF;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lapp/todolist/view/DiaryImageView;->d:Le/a/t/d;

    if-eqz p1, :cond_3

    iget-object v0, p0, Lapp/todolist/view/DiaryImageView;->a:Le/a/y/d;

    invoke-interface {p1, v0}, Le/a/t/d;->a(Le/a/y/d;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lapp/todolist/view/DiaryImageView;->a:Le/a/y/d;

    invoke-virtual {p1}, Le/a/y/d;->h()Ljava/util/List;

    move-result-object p1

    iget-object v0, p0, Lapp/todolist/view/DiaryImageView;->b:Landroid/graphics/PointF;

    invoke-static {p1, v0}, Le/a/x/i;->a(Ljava/util/List;Landroid/graphics/PointF;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lapp/todolist/view/DiaryImageView;->d:Le/a/t/d;

    if-eqz p1, :cond_3

    iget-object v0, p0, Lapp/todolist/view/DiaryImageView;->a:Le/a/y/d;

    invoke-interface {p1, v0}, Le/a/t/d;->c(Le/a/y/d;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lapp/todolist/view/DiaryImageView;->d:Le/a/t/d;

    if-eqz p1, :cond_3

    iget-object v0, p0, Lapp/todolist/view/DiaryImageView;->a:Le/a/y/d;

    invoke-interface {p1, v0}, Le/a/t/d;->b(Le/a/y/d;)V

    :cond_3
    :goto_0
    iget-object p1, p0, Lapp/todolist/view/DiaryImageView;->c:Le/a/y/d;

    if-eqz p1, :cond_4

    goto :goto_1

    :cond_4
    const/4 v1, 0x0

    :goto_1
    const/4 p1, 0x0

    iput-object p1, p0, Lapp/todolist/view/DiaryImageView;->c:Le/a/y/d;

    return v1

    :cond_5
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public setDiaryImageClickListener(Le/a/t/d;)V
    .locals 0

    iput-object p1, p0, Lapp/todolist/view/DiaryImageView;->d:Le/a/t/d;

    return-void
.end method

.method public setImageInfo(Le/a/y/d;)V
    .locals 0

    iput-object p1, p0, Lapp/todolist/view/DiaryImageView;->a:Le/a/y/d;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
