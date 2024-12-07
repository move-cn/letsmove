export function get_number( d:Date,decimal:number){
    let month = d.getMonth() + 1;
    let date = d.getDate();
    let hour = d.getHours();
    let base = Math.pow(10,decimal)
    let num  = month * base / 100;
    num += date * base / 10000;
    num += hour * base / 1000000;
    console.log(num);
    return num  ;
}
let d = new Date('2024-4-25 15:00')

console.log(get_number(d,9));
console.log(get_number(d,0));

/**

- 完成 必须在同一个PTB完成 Navi SDK 1.[存入Navi Protocol 1 SUI]  2.[借出当前日期的USDC 0.[月][天][小时] 的 USDC ]
  3.[然后在存入等额的USDC]

> 当前时间是2024年4月25日15点 借出的金额就是 `0.042515`   月 天 小时 必须是两位数 2024年5月1日2点  `0.050102`

*/