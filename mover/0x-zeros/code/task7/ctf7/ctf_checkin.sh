#https://docs.sui.io/references/cli/ptb


package_id="0x914099b4d1b4f5513acc8aaa4fdc1f67578522b81d818f61bae527d590c6d87d"
flagstr_object_id="0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147"


flag=0x44f7b6601a1ef87e150229f37b151c48c4c8352a4e2806338ae2d177dbaf7dc5


github_id="0x-zeros"


# sui client ptb \
#     # --move-call $package_id::ch::calculate_flag "<vector<u8>,vector<u8>>"\
#     # \'$github_id\' \
#     # \'$flagstr\' \

#     # # --assign flag \

#     --move-call $package_id::check_in::get_flag \
#     $flag \
#     $github_id \
#     $flagstr_object_id \
#     0x8

#     --dry-run


sui client call --package $package_id \
  --module check_in \
  --function get_flag \
  --args $flag $github_id $flagstr_object_id 0x8
