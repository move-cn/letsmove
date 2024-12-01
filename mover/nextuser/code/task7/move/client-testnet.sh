#-testnetc
#- 合约部署地址: `0x914099b4d1b4f5513acc8aaa4fdc1f67578522b81d818f61bae527d590c6d87d`
#- FlagStr Object:`0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147`



#testnet 
export CHECK_IN_PKG=0x914099b4d1b4f5513acc8aaa4fdc1f67578522b81d818f61bae527d590c6d87d
export FLAG_OBJ=0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147
export CTF_PKG=0xdfab373af7478e05b7e308e86873681c6c7b5e178c89b64c1675e8660615cc90

echo "########## 1. FlagString.str ####################################"
sui client object $FLAG_OBJ |grep str > object_flag.out
export FLAG_STR=`cat object_flag.out |awk -F ' ' '{ print $8}'`
export GITHUB_ID='nextuser'

echo $FLAG_STR
echo $GITHUB_ID

echo "########## 2. ctf_checkin_try::my_flag '$FLAG_STR' '$GITHUB_ID' ####################################"
# │  │   │ flag_result │ pw7LdhPh68TH8ORLTkuHMzb4xsvhHebv6gNYJeGlCys= │   
sui client ptb --move-call $CTF_PKG::ctf_checkin_try::my_flag  "$FLAG_STR" "$GITHUB_ID"  > my_flag.out      
cat my_flag.out                      │
export MSG2=`cat my_flag.out | grep flag_result `
echo `msg2 :$MSG2 `
export MY_FLAG=`echo $MSG2 |awk -F ' ' '{ print $6}'`
echo $MY_FLAG

echo "########## 3. ctf_checkin_try::my_flag  my_flag github_id  flag_obj random ####################################"
sui client ptb  --move-call $CHECK_IN_PKG::check_in::get_flag  "'$MY_FLAG' '$GITHUB_ID'  @$FLAG_OBJ @0x8 "

