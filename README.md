## delphi制作补丁

+ 通过修改内存制作补丁:
  + 使用工具: CheatEngine
+ 通过修改文件制作补丁:
  + 使用工具: OllyDB/xDbg

#### 通过修改内存制作补丁

+ 简单说明: 打开Test.exe, 点击Inc 按钮, 每次增加1. 修改数值为1000.
+ 打开CE, 获取到这个数值的地址: 
  + 由于搜索到不是固定地址 通过"Find out what accesses this address" 找到固定地址
  + 找到固定地址$53AE8C中的指针P, 通过P偏移$398后找到指针P2, P2中的值就是我们要修改的值
  + 打开CheatEngine.exe 点击Inc 按钮,可以看到内存值改为了1000

#### 通过修改文件制作补丁

+ 简单说明: 打开Test.exe, 点击showmessage 按钮,弹出框->"哈哈哈", 我们修改为"测试为"

+ 打开xdbg32, 可以使用附加, 也可以直接拖进去, 打开模块 test.exe, 搜索字符串(注意要装装中文搜索) search for -> current modoule-> string refrences

+ 定位到"哈哈哈", 右键-> follow in dump -> 定位的地址

+ 在下面dump1中 选中定位的地方(字符串以00为结尾 选中00之前的可以了)->右键->binary->edit-> 修改为"测试为"

+ 在上面CPU中右键patch->可以看到即将修改的内容, export保存成文件(因为文件为相对地址)

+ 如:

+ ```
  >test.exe
  00122278:C8->4B
  00122279:54->6D
  0012227A:C8->D5
  0012227B:54->8B
  0012227C:C8->3A
  0012227D:54->4E
  ```

+ 复制进Patch.exe, 会生成 test.ok.exe

+ 即完成了修改

  