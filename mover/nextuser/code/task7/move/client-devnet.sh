-testnet
- 合约部署地址: `0x914099b4d1b4f5513acc8aaa4fdc1f67578522b81d818f61bae527d590c6d87d`
- FlagStr Object:`0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147`


# devnet 
export CHECK_IN_PKG=0xf219935e0e4e924af0eead647b74c1b3b45ba20ef8c64675e1192657861189df
export FLAG_OBJ=0x81d0279d5e20f6a82e614a57a3d75d929096d9eaf4f3cd2f95f4f56f1dcbe775
export CTF_PKG=0x80ca104ed94f39dea8a92570b967c42c5c1e4abc495904f4d0c016e44714e26f

export FLAG_STR=`sui client object $FLAG_OBJ |grep str |awk -F ' ' '{ print $8}'`
export GITHUB_ID='nextuser'

echo $FLAG_STR
echo $GITHUB_ID
# │  │   │ flag_result │ pw7LdhPh68TH8ORLTkuHMzb4xsvhHebv6gNYJeGlCys= │                                          │
export MSG2=`sui client ptb --move-call $CTF_PKG::ctf_checkin_try::my_flag "'$FLAG_STR' '$GITHUB_ID'"  | grep flag_result `
export FLAG_VEC=`echo $MSG2 |awk -F ' ' '{ print $6}'`
echo $FLAG_VEC

sui client ptb  --move-call $CHECK_IN_PKG::check_in::get_flag  "'$FLAG_VEC' '$GITHUB_ID'  @$FLAG_OBJ @0x8 "

