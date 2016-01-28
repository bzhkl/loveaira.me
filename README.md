#LoveAria.Me

##前言

博客依旧还在重建中。。。

话说我的博客一直在重建中还是挺忧伤的。为什么一直都在重建中呢？有两点原因吧，第一点是懒，第二点是太追求完美了。所以为了保证我的博客能够顺利建成功，那么我必然不能太在意所谓的“纯净”了，而是先保证功能的基本完善。

新的博客因为自己的 VPS 只有 3G 硬盘，所以装不进 GHC ，所以就退而求其次，选择 PureScript 来建网站。我觉得前端后端全部用 PureScript 来实现。其实前端实现起来还不算难，因为我本身也不准备做太过于花哨的页面效果，所以用 PureScript 实现起来并不会非常困难。不过用 PureScript 实现后端就有比较费事了。

虽然 Purescript 有一个 Express 的 Binding，但是连最基础的数据库的 Binding 都没有靠谱的。所以只能动手自己折腾一个 node-sqlite3 的 PureScript Binding。

不过在实现 node-sqlite3 的 Binding 的时候也真是折腾，折腾了一圈的 Continuation Monad。不过还好早在我写 JavaScript 的时候，我就已经把这个 CPS 折腾清楚了，所以也并没有造成太大的困扰。

现在 node-sqlite3 的 Binding 已经写完了。效果如何还需要慢慢测试，现在已经又进了一步了~

##接下来如何

1. 测试并且完善 sqlite3 的 Binding。
2. 把简单的 MVC 框架搭建起来。
3. 完成博客的基本功能（用户，文章，评论，权限）
4. 好好开始写些博客。
5. 完善前端，如何完善待定，反正整个项目的框架是搭好了。
