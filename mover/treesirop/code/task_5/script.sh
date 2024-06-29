# publish escrow 
export BOB=0x08fac7bc5b6c4402613dab4fcfb62934c3eef96c6b45480a3849cd2c3f0c73f7
export ALICE=0x272c8f82d121fc366d022c9f58ba50239c5d6bf6003d5264b3d4172f406273a9
export PACKAGE_ID=0x1073319b191d878ec5f27086ed5cb4cfa8bd8e9b4ba5fa45b03d9d6906d6c5a6
export TREESIROP_CAP=0xeff2d8e310072bf50cfca58684b7994ceae37fb334d6315d958a678a01012ad6
export TREESIROP_FACET_CAP=0xa063aec1adfe854b326ff84e704eefcf590a48a1c5bef220fbf46a82a2b1538c

#BOB:
sui client switch --address kind-hiddenite
#mint 1000 TREESIROP 
sui client call --package $PACKAGE_ID \
--module shared \
--function min_treesirop \
--args $TREESIROP_CAP 10000 $BOB \


#get TREESIROP
export TREESIROP=0x91f90c105e3cedd3753dda28220a2611665a35a918807ebd2505d682e80dfb2f

#stage1
sui client call --package $PACKAGE_ID \
--module shared \
--function stage_one \
--args $TREESIROP \


#get l,k
export LID=0xd7b85c26263d73f39641f4d36ee889647a038410b05933c3fc84a972a383b075
export KID=0xaee1bdf950cddcf1757fbe56d23e044497a8a870f7c1f835b6b9061f5d0f1a1a

#ALICE:
sui client switch --address test 
#mint 100 TREESIROP_FACET
sui client call --package $PACKAGE_ID \
--module shared \
--function min_treesirop_facet \
--args $TREESIROP_FACET_CAP 100000 $ALICE \


#get TREESIROP_FACET
export TREESIROP_FACET=0x0a328b97654da11963e0703981bcfceff3bfb09b1823217942cedea164d38d46

#stage_two
sui client call --package $PACKAGE_ID \
--module shared \
--function stage_two \
--args $TREESIROP_FACET $KID $BOB \


#get escrowID
export ESCROW=0xb19a073499371ba3e62ae1d1d5fd2a1e6d6baeb0f9cb6ffc298dcbda91398dda

#BOB:
sui client switch --address kind-hiddenite
#stage_three
sui client call --package $PACKAGE_ID \
--module shared \
--function stage_three \
--args $ESCROW $KID $LID \

