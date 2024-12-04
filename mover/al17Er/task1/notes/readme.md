keytool import "助记词" ed25519 //添加钱包地址
sui client switch --address 0x39f730e4c71b330e0e3950a9b7bece08672fca7a577bbad02339559bcc3683da //切换钱包地址
sui move new hello_move //创建 hello_move文件
cd hello_move //进入创建目录
vi sources/hello_move.move //编辑目录后添加代码内容
proxychains sui client publish  //创建获取packageID
