# 发布项目
sui client publish --gas-budget 200000000 . 

error[E02010]: invalid name
  ┌─ ./sources/hello.move:4:19
  │
4 │     public struct _Object has key, store {
  │                   ^^^^^^^ Invalid struct name '_Object'. Struct names must start with 'A'..'Z'

error[E03004]: unbound type
   ┌─ ./sources/hello.move:10:22
   │
10 │         let object = _Object {
   │                      ^^^^^^^ Unbound type '_Object' in current scope

Failed to build Move modules: Compilation error.

需要换一个类名
