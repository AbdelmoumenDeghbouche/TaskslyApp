.class public Lapp/todolist/view/SlideLinearLayout$a;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lapp/todolist/view/SlideLinearLayout;->e(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lapp/todolist/view/SlideLinearLayout;


# direct methods
.method public constructor <init>(Lapp/todolist/view/SlideLinearLayout;)V
    .locals 0

    iput-object p1, p0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 18

    move-object/from16 v0, p0

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    const v2, 0x7f0a053b

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getScrollX()I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v1, :cond_7

    iget-object v5, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    const v6, 0x7f0a052c

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iget-object v6, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    const v7, 0x7f0a0534

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iget-object v7, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    const v8, 0x7f0a0547

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v7

    iget-object v8, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    const v9, 0x7f0a0549

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v9

    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v10

    add-int v12, v9, v10

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v9

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v10

    add-int v13, v9, v10

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v9

    invoke-virtual {v5}, Landroid/view/View;->getRight()I

    move-result v10

    add-int v14, v9, v10

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v9

    invoke-virtual {v5}, Landroid/view/View;->getBottom()I

    move-result v10

    add-int v15, v9, v10

    iget-object v11, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    int-to-float v9, v2

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v10

    add-float v16, v9, v10

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v17

    invoke-static/range {v11 .. v17}, Lapp/todolist/view/SlideLinearLayout;->a(Lapp/todolist/view/SlideLinearLayout;IIIIFF)Z

    move-result v10

    if-eqz v10, :cond_1

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-virtual {v1}, Lapp/todolist/view/SlideLinearLayout;->s()V

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setLongClickable(Z)V

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-static {v1}, Lapp/todolist/view/SlideLinearLayout;->b(Lapp/todolist/view/SlideLinearLayout;)Lf/c/a/h/e;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-static {v1}, Lapp/todolist/view/SlideLinearLayout;->b(Lapp/todolist/view/SlideLinearLayout;)Lf/c/a/h/e;

    move-result-object v1

    const/4 v2, 0x2

    invoke-interface {v1, v5, v2}, Lf/c/a/h/e;->a(Ljava/lang/Object;I)V

    :cond_0
    return v3

    :cond_1
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v5

    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    move-result v10

    add-int v12, v5, v10

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v5

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v10

    add-int v13, v5, v10

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v5

    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    move-result v10

    add-int v14, v5, v10

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v5

    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    move-result v10

    add-int v15, v5, v10

    iget-object v11, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    add-float v16, v9, v5

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v17

    invoke-static/range {v11 .. v17}, Lapp/todolist/view/SlideLinearLayout;->a(Lapp/todolist/view/SlideLinearLayout;IIIIFF)Z

    move-result v5

    if-eqz v5, :cond_3

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-virtual {v1}, Lapp/todolist/view/SlideLinearLayout;->s()V

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setLongClickable(Z)V

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-static {v1}, Lapp/todolist/view/SlideLinearLayout;->b(Lapp/todolist/view/SlideLinearLayout;)Lf/c/a/h/e;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-static {v1}, Lapp/todolist/view/SlideLinearLayout;->b(Lapp/todolist/view/SlideLinearLayout;)Lf/c/a/h/e;

    move-result-object v1

    invoke-interface {v1, v6, v3}, Lf/c/a/h/e;->a(Ljava/lang/Object;I)V

    :cond_2
    return v3

    :cond_3
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v5

    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v6

    add-int v11, v5, v6

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v5

    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v6

    add-int v12, v5, v6

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v5

    invoke-virtual {v7}, Landroid/view/View;->getRight()I

    move-result v6

    add-int v13, v5, v6

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v5

    invoke-virtual {v7}, Landroid/view/View;->getBottom()I

    move-result v6

    add-int v14, v5, v6

    iget-object v10, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    add-float v15, v9, v5

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v16

    invoke-static/range {v10 .. v16}, Lapp/todolist/view/SlideLinearLayout;->a(Lapp/todolist/view/SlideLinearLayout;IIIIFF)Z

    move-result v5

    if-eqz v5, :cond_5

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-virtual {v1}, Lapp/todolist/view/SlideLinearLayout;->s()V

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setLongClickable(Z)V

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-static {v1}, Lapp/todolist/view/SlideLinearLayout;->b(Lapp/todolist/view/SlideLinearLayout;)Lf/c/a/h/e;

    move-result-object v1

    if-eqz v1, :cond_4

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-static {v1}, Lapp/todolist/view/SlideLinearLayout;->b(Lapp/todolist/view/SlideLinearLayout;)Lf/c/a/h/e;

    move-result-object v1

    invoke-interface {v1, v7, v4}, Lf/c/a/h/e;->a(Ljava/lang/Object;I)V

    :cond_4
    return v3

    :cond_5
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v5

    invoke-virtual {v8}, Landroid/view/View;->getLeft()I

    move-result v6

    add-int v11, v5, v6

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v5

    invoke-virtual {v8}, Landroid/view/View;->getTop()I

    move-result v6

    add-int v12, v5, v6

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v5

    invoke-virtual {v8}, Landroid/view/View;->getRight()I

    move-result v6

    add-int v13, v5, v6

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    invoke-virtual {v8}, Landroid/view/View;->getBottom()I

    move-result v5

    add-int v14, v1, v5

    iget-object v10, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    add-float v15, v9, v1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v16

    invoke-static/range {v10 .. v16}, Lapp/todolist/view/SlideLinearLayout;->a(Lapp/todolist/view/SlideLinearLayout;IIIIFF)Z

    move-result v1

    if-eqz v1, :cond_7

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-virtual {v1}, Lapp/todolist/view/SlideLinearLayout;->s()V

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setLongClickable(Z)V

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-static {v1}, Lapp/todolist/view/SlideLinearLayout;->b(Lapp/todolist/view/SlideLinearLayout;)Lf/c/a/h/e;

    move-result-object v1

    if-eqz v1, :cond_6

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-static {v1}, Lapp/todolist/view/SlideLinearLayout;->b(Lapp/todolist/view/SlideLinearLayout;)Lf/c/a/h/e;

    move-result-object v1

    const/4 v2, 0x3

    invoke-interface {v1, v8, v2}, Lf/c/a/h/e;->a(Ljava/lang/Object;I)V

    :cond_6
    return v3

    :cond_7
    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    const v5, 0x7f0a0522

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_8

    iget-object v5, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v6

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v7

    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v8

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v9

    int-to-float v1, v2

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    add-float v10, v1, v2

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    invoke-static/range {v5 .. v11}, Lapp/todolist/view/SlideLinearLayout;->a(Lapp/todolist/view/SlideLinearLayout;IIIIFF)Z

    move-result v1

    if-eqz v1, :cond_8

    iget-object v1, v0, Lapp/todolist/view/SlideLinearLayout$a;->a:Lapp/todolist/view/SlideLinearLayout;

    invoke-virtual {v1}, Lapp/todolist/view/SlideLinearLayout;->s()V

    return v3

    :cond_8
    return v4
.end method
