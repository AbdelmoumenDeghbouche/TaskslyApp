.class public Lapp/todolist/view/SlideLinearLayout;
.super Landroid/widget/LinearLayout;


# static fields
.field public static q:I = 0xf0


# instance fields
.field public a:F

.field public b:F

.field public c:F

.field public d:F

.field public e:F

.field public f:Z

.field public g:I

.field public h:Landroid/widget/Scroller;

.field public i:Landroid/view/VelocityTracker;

.field public j:I

.field public k:Landroid/view/GestureDetector;

.field public l:Lf/c/a/h/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf/c/a/h/e<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public m:Z

.field public n:Lapp/todolist/view/SlideView;

.field public o:Z

.field public p:Landroid/view/View;


# direct methods
.method public static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lapp/todolist/view/SlideLinearLayout;->m:Z

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lapp/todolist/view/SlideLinearLayout;->e(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lapp/todolist/view/SlideLinearLayout;->m:Z

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/SlideLinearLayout;->e(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, 0x0

    iput-boolean p3, p0, Lapp/todolist/view/SlideLinearLayout;->m:Z

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/SlideLinearLayout;->e(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic a(Lapp/todolist/view/SlideLinearLayout;IIIIFF)Z
    .locals 0

    invoke-virtual/range {p0 .. p6}, Lapp/todolist/view/SlideLinearLayout;->h(IIIIFF)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lapp/todolist/view/SlideLinearLayout;)Lf/c/a/h/e;
    .locals 0

    iget-object p0, p0, Lapp/todolist/view/SlideLinearLayout;->l:Lf/c/a/h/e;

    return-object p0
.end method


# virtual methods
.method public c()V
    .locals 2

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScrollX()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Landroid/widget/LinearLayout;->scrollTo(II)V

    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->invalidate()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->p:Landroid/view/View;

    if-nez v0, :cond_1

    const v0, 0x7f0a053b

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->p:Landroid/view/View;

    :cond_1
    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->p:Landroid/view/View;

    const/4 v1, 0x4

    invoke-static {v0, v1}, Le/a/x/m;->B(Landroid/view/View;I)V

    :goto_0
    return-void
.end method

.method public computeScroll()V
    .locals 2

    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->h:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->h:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    iget-object v1, p0, Lapp/todolist/view/SlideLinearLayout;->h:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrY()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Landroid/widget/LinearLayout;->scrollTo(II)V

    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->invalidate()V

    :cond_0
    return-void
.end method

.method public d(Landroid/view/MotionEvent;)V
    .locals 6

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScrollX()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-eqz p1, :cond_b

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-eq p1, v2, :cond_3

    if-eq p1, v3, :cond_0

    goto/16 :goto_4

    :cond_0
    iget p1, p0, Lapp/todolist/view/SlideLinearLayout;->e:F

    sub-float/2addr p1, v1

    float-to-int p1, p1

    invoke-static {p0}, Le/a/x/m;->j(Landroid/view/View;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    add-int/2addr v0, p1

    if-gtz v0, :cond_2

    iget v2, p0, Lapp/todolist/view/SlideLinearLayout;->g:I

    neg-int v2, v2

    if-lt v0, v2, :cond_2

    invoke-virtual {p0, p1, v3}, Landroid/widget/LinearLayout;->scrollBy(II)V

    goto :goto_0

    :cond_1
    add-int/2addr v0, p1

    if-ltz v0, :cond_2

    iget v2, p0, Lapp/todolist/view/SlideLinearLayout;->g:I

    if-gt v0, v2, :cond_2

    invoke-virtual {p0, p1, v3}, Landroid/widget/LinearLayout;->scrollBy(II)V

    :cond_2
    :goto_0
    iput v1, p0, Lapp/todolist/view/SlideLinearLayout;->e:F

    goto/16 :goto_4

    :cond_3
    iget p1, p0, Lapp/todolist/view/SlideLinearLayout;->g:I

    if-nez p1, :cond_4

    sget p1, Lapp/todolist/view/SlideLinearLayout;->q:I

    invoke-static {p1}, Lf/c/a/k/i;->b(I)I

    move-result p1

    iput p1, p0, Lapp/todolist/view/SlideLinearLayout;->g:I

    :cond_4
    iget-object p1, p0, Lapp/todolist/view/SlideLinearLayout;->i:Landroid/view/VelocityTracker;

    const/16 v1, 0x3e8

    invoke-virtual {p1, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    iget-object p1, p0, Lapp/todolist/view/SlideLinearLayout;->i:Landroid/view/VelocityTracker;

    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result p1

    invoke-static {p0}, Le/a/x/m;->j(Landroid/view/View;)Z

    move-result v1

    const/4 v2, -0x1

    const/4 v4, 0x0

    const-string v5, "home_task_dragleft"

    if-eqz v1, :cond_7

    const/high16 v1, 0x44160000    # 600.0f

    cmpl-float v1, p1, v1

    if-gtz v1, :cond_6

    cmpl-float p1, p1, v4

    if-lez p1, :cond_5

    iget p1, p0, Lapp/todolist/view/SlideLinearLayout;->g:I

    div-int/2addr p1, v3

    if-gt v0, p1, :cond_5

    goto :goto_1

    :cond_5
    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->l()V

    goto :goto_3

    :cond_6
    :goto_1
    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->n()V

    invoke-static {}, Le/a/r/c;->c()Le/a/r/c;

    move-result-object p1

    invoke-virtual {p1, v5}, Le/a/r/c;->d(Ljava/lang/String;)V

    iget-object p1, p0, Lapp/todolist/view/SlideLinearLayout;->l:Lf/c/a/h/e;

    if-eqz p1, :cond_a

    invoke-interface {p1, p0, v2}, Lf/c/a/h/e;->a(Ljava/lang/Object;I)V

    goto :goto_3

    :cond_7
    const/high16 v1, -0x3bea0000    # -600.0f

    cmpg-float v1, p1, v1

    if-ltz v1, :cond_9

    cmpg-float p1, p1, v4

    if-gez p1, :cond_8

    iget p1, p0, Lapp/todolist/view/SlideLinearLayout;->g:I

    div-int/2addr p1, v3

    if-lt v0, p1, :cond_8

    goto :goto_2

    :cond_8
    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->l()V

    goto :goto_3

    :cond_9
    :goto_2
    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->n()V

    invoke-static {}, Le/a/r/c;->c()Le/a/r/c;

    move-result-object p1

    invoke-virtual {p1, v5}, Le/a/r/c;->d(Ljava/lang/String;)V

    iget-object p1, p0, Lapp/todolist/view/SlideLinearLayout;->l:Lf/c/a/h/e;

    if-eqz p1, :cond_a

    invoke-interface {p1, p0, v2}, Lf/c/a/h/e;->a(Ljava/lang/Object;I)V

    :cond_a
    :goto_3
    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->j()V

    const-string p1, "onTouchEvent"

    const-string v0, "ACTION_UP deliverTouchEvent = "

    invoke-static {p1, v0}, Lf/c/a/k/c;->b(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_4

    :cond_b
    iput v1, p0, Lapp/todolist/view/SlideLinearLayout;->e:F

    :goto_4
    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->invalidate()V

    return-void
.end method

.method public final e(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    new-instance p2, Landroid/widget/Scroller;

    invoke-direct {p2, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lapp/todolist/view/SlideLinearLayout;->h:Landroid/widget/Scroller;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    iput p1, p0, Lapp/todolist/view/SlideLinearLayout;->j:I

    new-instance p1, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    new-instance v0, Lapp/todolist/view/SlideLinearLayout$a;

    invoke-direct {v0, p0}, Lapp/todolist/view/SlideLinearLayout$a;-><init>(Lapp/todolist/view/SlideLinearLayout;)V

    invoke-direct {p1, p2, v0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p1, p0, Lapp/todolist/view/SlideLinearLayout;->k:Landroid/view/GestureDetector;

    return-void
.end method

.method public f()Z
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->n:Lapp/todolist/view/SlideView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lapp/todolist/view/SlideView;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public g()Z
    .locals 1

    iget-boolean v0, p0, Lapp/todolist/view/SlideLinearLayout;->o:Z

    return v0
.end method

.method public final h(IIIIFF)Z
    .locals 0

    int-to-float p1, p1

    cmpl-float p1, p5, p1

    if-ltz p1, :cond_0

    int-to-float p1, p3

    cmpg-float p1, p5, p1

    if-gtz p1, :cond_0

    int-to-float p1, p2

    cmpl-float p1, p6, p1

    if-ltz p1, :cond_0

    int-to-float p1, p4

    cmpg-float p1, p6, p1

    if-gtz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final i(Landroid/view/MotionEvent;)V
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->i:Landroid/view/VelocityTracker;

    if-nez v0, :cond_0

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->i:Landroid/view/VelocityTracker;

    :cond_0
    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->i:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    return-void
.end method

.method public invalidate()V
    .locals 2

    invoke-super {p0}, Landroid/widget/LinearLayout;->invalidate()V

    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->p:Landroid/view/View;

    if-nez v0, :cond_0

    const v0, 0x7f0a053b

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->p:Landroid/view/View;

    :cond_0
    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->p:Landroid/view/View;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScrollX()I

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    const/4 v1, 0x4

    :goto_0
    invoke-static {v0, v1}, Le/a/x/m;->B(Landroid/view/View;I)V

    return-void
.end method

.method public final j()V
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->i:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->i:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->i:Landroid/view/VelocityTracker;

    :cond_0
    return-void
.end method

.method public final k()V
    .locals 2

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-boolean v1, p0, Lapp/todolist/view/SlideLinearLayout;->f:Z

    if-eqz v1, :cond_0

    instance-of v1, v0, Lapp/todolist/view/SlideWrapperRecyclerView;

    if-eqz v1, :cond_0

    check-cast v0, Lapp/todolist/view/SlideWrapperRecyclerView;

    invoke-virtual {v0, p0}, Lapp/todolist/view/SlideWrapperRecyclerView;->b(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public l()V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lapp/todolist/view/SlideLinearLayout;->m(I)V

    return-void
.end method

.method public m(I)V
    .locals 6

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScrollX()I

    move-result v1

    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->h:Landroid/widget/Scroller;

    neg-int v3, v1

    if-gtz p1, :cond_0

    move v5, v1

    goto :goto_0

    :cond_0
    move v5, p1

    :goto_0
    const/4 v2, 0x0

    const/4 v4, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    return-void
.end method

.method public n()V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lapp/todolist/view/SlideLinearLayout;->o(I)V

    return-void
.end method

.method public o(I)V
    .locals 6

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScrollX()I

    move-result v1

    invoke-static {p0}, Le/a/x/m;->j(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-gtz p1, :cond_0

    iget p1, p0, Lapp/todolist/view/SlideLinearLayout;->g:I

    neg-int p1, p1

    sub-int/2addr p1, v1

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    :cond_0
    move v5, p1

    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->h:Landroid/widget/Scroller;

    const/4 v2, 0x0

    iget p1, p0, Lapp/todolist/view/SlideLinearLayout;->g:I

    neg-int p1, p1

    sub-int v3, p1, v1

    const/4 v4, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    goto :goto_0

    :cond_1
    if-gtz p1, :cond_2

    iget p1, p0, Lapp/todolist/view/SlideLinearLayout;->g:I

    sub-int/2addr p1, v1

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    :cond_2
    move v5, p1

    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->h:Landroid/widget/Scroller;

    const/4 v2, 0x0

    iget p1, p0, Lapp/todolist/view/SlideLinearLayout;->g:I

    sub-int v3, p1, v1

    const/4 v4, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    :goto_0
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    iget-boolean v0, p0, Lapp/todolist/view/SlideLinearLayout;->m:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_7

    if-eq v0, v2, :cond_6

    const/4 v3, 0x2

    if-eq v0, v3, :cond_1

    const/4 p1, 0x3

    if-eq v0, p1, :cond_6

    goto/16 :goto_3

    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v3, p0, Lapp/todolist/view/SlideLinearLayout;->a:F

    sub-float/2addr v0, v3

    iput v0, p0, Lapp/todolist/view/SlideLinearLayout;->c:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iget v3, p0, Lapp/todolist/view/SlideLinearLayout;->b:F

    sub-float/2addr v0, v3

    iput v0, p0, Lapp/todolist/view/SlideLinearLayout;->d:F

    iget-boolean v0, p0, Lapp/todolist/view/SlideLinearLayout;->f:Z

    if-nez v0, :cond_3

    invoke-static {p0}, Le/a/x/m;->j(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lapp/todolist/view/SlideLinearLayout;->c:F

    neg-float v0, v0

    goto :goto_0

    :cond_2
    iget v0, p0, Lapp/todolist/view/SlideLinearLayout;->c:F

    :goto_0
    iget v3, p0, Lapp/todolist/view/SlideLinearLayout;->j:I

    int-to-float v3, v3

    cmpl-float v0, v0, v3

    if-ltz v0, :cond_3

    invoke-virtual {p0, p1}, Lapp/todolist/view/SlideLinearLayout;->setSlideViewXY(Landroid/view/MotionEvent;)V

    invoke-virtual {p0, v2}, Lapp/todolist/view/SlideLinearLayout;->setSlideViewNeedDraw(Z)V

    iput-boolean v2, p0, Lapp/todolist/view/SlideLinearLayout;->o:Z

    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, " Math.abs(offsetX) = "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lapp/todolist/view/SlideLinearLayout;->c:F

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "onInterceptTouchEvent"

    invoke-static {v0, p1}, Lf/c/a/k/c;->b(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " Math.abs(offsetX) >= Math.abs(offsetY) = "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lapp/todolist/view/SlideLinearLayout;->c:F

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    iget v4, p0, Lapp/todolist/view/SlideLinearLayout;->d:F

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_4

    const/4 v3, 0x1

    goto :goto_1

    :cond_4
    const/4 v3, 0x0

    :goto_1
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lf/c/a/k/c;->b(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->f()Z

    move-result p1

    if-nez p1, :cond_5

    iget p1, p0, Lapp/todolist/view/SlideLinearLayout;->c:F

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget v3, p0, Lapp/todolist/view/SlideLinearLayout;->j:I

    int-to-float v3, v3

    cmpl-float p1, p1, v3

    if-lez p1, :cond_5

    iget p1, p0, Lapp/todolist/view/SlideLinearLayout;->c:F

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget v3, p0, Lapp/todolist/view/SlideLinearLayout;->d:F

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float p1, p1, v3

    if-ltz p1, :cond_5

    iget-boolean p1, p0, Lapp/todolist/view/SlideLinearLayout;->f:Z

    if-nez p1, :cond_5

    iput-boolean v2, p0, Lapp/todolist/view/SlideLinearLayout;->f:Z

    iput-boolean v2, p0, Lapp/todolist/view/SlideLinearLayout;->o:Z

    :cond_5
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isScrollHorizontal = "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, p0, Lapp/todolist/view/SlideLinearLayout;->f:Z

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lf/c/a/k/c;->b(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isNeedDrawLine() = "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->f()Z

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lf/c/a/k/c;->b(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    :cond_6
    invoke-virtual {p0, v1}, Lapp/todolist/view/SlideLinearLayout;->setSlideViewNeedDraw(Z)V

    goto :goto_3

    :cond_7
    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->h:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->h:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    :cond_8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lapp/todolist/view/SlideLinearLayout;->a:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lapp/todolist/view/SlideLinearLayout;->b:F

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScrollX()I

    move-result p1

    if-eqz p1, :cond_9

    const/4 p1, 0x1

    goto :goto_2

    :cond_9
    const/4 p1, 0x0

    :goto_2
    iput-boolean p1, p0, Lapp/todolist/view/SlideLinearLayout;->f:Z

    invoke-virtual {p0, v1}, Lapp/todolist/view/SlideLinearLayout;->setSlideViewNeedDraw(Z)V

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setLongClickable(Z)V

    iget-boolean p1, p0, Lapp/todolist/view/SlideLinearLayout;->f:Z

    iput-boolean p1, p0, Lapp/todolist/view/SlideLinearLayout;->o:Z

    :goto_3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_c

    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->f()Z

    move-result v0

    if-nez v0, :cond_b

    iget-boolean v0, p0, Lapp/todolist/view/SlideLinearLayout;->f:Z

    if-eqz v0, :cond_a

    goto :goto_4

    :cond_a
    const/4 v0, 0x0

    goto :goto_5

    :cond_b
    :goto_4
    const/4 v0, 0x1

    :goto_5
    invoke-interface {p1, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->k()V

    :cond_c
    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->f()Z

    move-result p1

    if-nez p1, :cond_d

    iget-boolean p1, p0, Lapp/todolist/view/SlideLinearLayout;->f:Z

    if-eqz p1, :cond_e

    :cond_d
    const/4 v1, 0x1

    :cond_e
    return v1
.end method

.method public onLayout(ZIIII)V
    .locals 0

    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    const p1, 0x7f0a053b

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lapp/todolist/view/SlideLinearLayout;->p:Landroid/view/View;

    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p1

    const/4 p2, 0x2

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    iput p1, p0, Lapp/todolist/view/SlideLinearLayout;->g:I

    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "closeTouch = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lapp/todolist/view/SlideLinearLayout;->m:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onTouchEvent"

    invoke-static {v1, v0}, Lf/c/a/k/c;->b(Ljava/lang/String;Ljava/lang/Object;)V

    iget-boolean v0, p0, Lapp/todolist/view/SlideLinearLayout;->m:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_0
    invoke-virtual {p0, p1}, Lapp/todolist/view/SlideLinearLayout;->i(Landroid/view/MotionEvent;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isScrollHorizontal = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lapp/todolist/view/SlideLinearLayout;->f:Z

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lf/c/a/k/c;->b(Ljava/lang/String;Ljava/lang/Object;)V

    iget-boolean v0, p0, Lapp/todolist/view/SlideLinearLayout;->f:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->k:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0, p1}, Lapp/todolist/view/SlideLinearLayout;->d(Landroid/view/MotionEvent;)V

    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-ne p1, v1, :cond_2

    iput-boolean v2, p0, Lapp/todolist/view/SlideLinearLayout;->f:Z

    :cond_2
    return v1

    :cond_3
    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->f()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-eqz v0, :cond_6

    const/4 v3, 0x0

    if-eq v0, v1, :cond_5

    const/4 v1, 0x2

    if-eq v0, v1, :cond_4

    const/4 v1, 0x3

    if-eq v0, v1, :cond_5

    invoke-virtual {p0, v3, v3, v3, v3}, Lapp/todolist/view/SlideLinearLayout;->r(FFFF)V

    invoke-virtual {p0, v2}, Lapp/todolist/view/SlideLinearLayout;->setSlideViewNeedDraw(Z)V

    goto :goto_0

    :cond_4
    invoke-virtual {p0, p1}, Lapp/todolist/view/SlideLinearLayout;->setSlideViewXY(Landroid/view/MotionEvent;)V

    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->p()V

    goto :goto_0

    :cond_5
    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->q()V

    invoke-virtual {p0, v3, v3, v3, v3}, Lapp/todolist/view/SlideLinearLayout;->r(FFFF)V

    invoke-virtual {p0, v2}, Lapp/todolist/view/SlideLinearLayout;->setSlideViewNeedDraw(Z)V

    goto :goto_0

    :cond_6
    invoke-virtual {p0, v2}, Lapp/todolist/view/SlideLinearLayout;->setSlideViewNeedDraw(Z)V

    :cond_7
    :goto_0
    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->j()V

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public p()V
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->n:Lapp/todolist/view/SlideView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    :cond_0
    return-void
.end method

.method public q()V
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->n:Lapp/todolist/view/SlideView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lapp/todolist/view/SlideView;->e()V

    :cond_0
    return-void
.end method

.method public r(FFFF)V
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->n:Lapp/todolist/view/SlideView;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3, p4}, Lapp/todolist/view/SlideView;->d(FFFF)V

    :cond_0
    return-void
.end method

.method public s()V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lapp/todolist/view/SlideLinearLayout;->t(I)V

    return-void
.end method

.method public setCloseTouch(Z)V
    .locals 0

    iput-boolean p1, p0, Lapp/todolist/view/SlideLinearLayout;->m:Z

    return-void
.end method

.method public setOnItemClickListener(Lf/c/a/h/e;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lf/c/a/h/e<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lapp/todolist/view/SlideLinearLayout;->l:Lf/c/a/h/e;

    return-void
.end method

.method public setSlideView(Lapp/todolist/view/SlideView;)V
    .locals 0

    iput-object p1, p0, Lapp/todolist/view/SlideLinearLayout;->n:Lapp/todolist/view/SlideView;

    return-void
.end method

.method public setSlideViewNeedDraw(Z)V
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/SlideLinearLayout;->n:Lapp/todolist/view/SlideView;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lapp/todolist/view/SlideView;->setNeedDrawLine(Z)V

    :cond_0
    return-void
.end method

.method public setSlideViewXY(Landroid/view/MotionEvent;)V
    .locals 3

    iget v0, p0, Lapp/todolist/view/SlideLinearLayout;->a:F

    iget v1, p0, Lapp/todolist/view/SlideLinearLayout;->b:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {p0, v0, v1, v2, p1}, Lapp/todolist/view/SlideLinearLayout;->r(FFFF)V

    return-void
.end method

.method public setSlideWrapperRecyclerView(Lapp/todolist/view/SlideWrapperRecyclerView;)V
    .locals 0

    return-void
.end method

.method public t(I)V
    .locals 1

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScrollX()I

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lapp/todolist/view/SlideLinearLayout;->m(I)V

    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->invalidate()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lapp/todolist/view/SlideLinearLayout;->p:Landroid/view/View;

    if-nez p1, :cond_1

    const p1, 0x7f0a053b

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lapp/todolist/view/SlideLinearLayout;->p:Landroid/view/View;

    :cond_1
    iget-object p1, p0, Lapp/todolist/view/SlideLinearLayout;->p:Landroid/view/View;

    const/4 v0, 0x4

    invoke-static {p1, v0}, Le/a/x/m;->B(Landroid/view/View;I)V

    :goto_0
    return-void
.end method

.method public u(I)V
    .locals 0

    invoke-virtual {p0, p1}, Lapp/todolist/view/SlideLinearLayout;->o(I)V

    invoke-virtual {p0}, Lapp/todolist/view/SlideLinearLayout;->invalidate()V

    return-void
.end method
