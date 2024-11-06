## 本地调试

```move
print 
```



## 能力描述

*  所有权转移 (赋值转移)

  ```
  
      public struct Type1 has drop,store {
  	    value:u32,
      }
  
      public struct Type2 has copy,drop{
          value:u32,
      }
  
      public fun test_transfer()
      {
          let a :Type1 = Type1{value:1};
          let b :Type1 = a; //move a to b
          print(&b.value);  
          print(&a.value);// compile error
  
      }
  
      public fun test_copy()
      {
          let a :Type2 = Type2{value:2};
          let b :Type2 = a;//copy a  to b
          print(&b.value);
          print(&a.value); 
      }
  
  
   
  ```

* # typus

  链上期权

  coincall

  deribit

  typus