module galagame::galagame {
    use std::vector;
    use sui::clock::{Self, Clock};
    use sui::object;
    use sui::object::UID;
    use sui::transfer::{Self};
    use sui::tx_context::TxContext;
    use sui::event;

    struct GALAGAME has drop {}

    struct GalaGameResult has key, store {
        id: UID,
        resultVec: vector<vector<u8>>,
        resultNum: u8,
        lastTimeResult: u8,
    }

    struct GalaEvent has copy, drop{
        result : bool,
        whoWin : u8,
        resultVec: vector<vector<u8>>,
    }

    fun init(_: GALAGAME, ctx: &mut TxContext){
        let ggr = GalaGameResult{
            id: object::new(ctx),
            resultVec: vector[
                vector[0,0,0],
                vector[0,0,0],
                vector[0,0,0]],
            resultNum: 1,
            lastTimeResult: 1,
        };
        transfer::share_object(ggr);
    }

    #[allow(unused_variable)]
    public entry fun Chess(ggr: &mut GalaGameResult, xChess: u8, yChess: u8, clock: &Clock){
        let result = xChess >= 0 && xChess <= 2 && yChess >= 0 && yChess <= 2;
        assert!(result, 0x11);

        let _board = ggr.resultVec;
        let yRay = vector::borrow(&_board, (xChess as u64));
        let point = vector::borrow(yRay, (yChess as u64));
        assert!(point == &0, 0x12);

        //judge three common color point in same line
        let (newBoard, tempBoard) = reGenBoard(&mut ggr.resultVec, xChess, yChess, false);
        ggr.resultVec = newBoard;
        let (result, whoWin) = gameover(tempBoard);
        event::emit(GalaEvent {
            result,
            whoWin,
            resultVec : newBoard,
        });
        //system win is 1
        if (result){
            ggr.resultVec = vector[
                vector[0,0,0],
                vector[0,0,0],
                vector[0,0,0]];
            ggr.resultNum = 1;
            ggr.lastTimeResult = whoWin
        };

        //system random chess, chess algorithm todo
        let randomNum = random(clock);
        let (x, y) = findFreePoint(&tempBoard,randomNum);
        if (!result){
            let (nextNewBoard, twoTempBoard) = reGenBoard(&mut ggr.resultVec, (x as u8), (y as u8), true);
            ggr.resultVec = nextNewBoard;
            let (sysResult, sysWin) = gameover(twoTempBoard);
            event::emit(GalaEvent {
                result: sysResult,
                whoWin: sysWin,
                resultVec : nextNewBoard,
            });
            //system win is 1
            if (sysResult){
                ggr.resultVec = vector[
                    vector[0,0,0],
                    vector[0,0,0],
                    vector[0,0,0]];
                ggr.resultNum = 1;
                ggr.lastTimeResult = sysWin
            };
        };
    }

    #[allow(unused_trailing_semi)]
    fun reGenBoard(board: &mut vector<vector<u8>>, xIndex: u8, yIndex: u8, isSystem: bool): (vector<vector<u8>>,vector<vector<u8>>){
        let value = 2;
        if (isSystem){
            value = 1
        };

        let tRow = vector::pop_back(board);
        let sRow = vector::pop_back(board);
        let fRow = vector::pop_back(board);

        let fRowThree = vector::pop_back(&mut fRow);
        let fRowTwo = vector::pop_back(&mut fRow);
        let fRowOne = vector::pop_back(&mut fRow);

        let sRowThree = vector::pop_back(&mut sRow);
        let sRowTwo = vector::pop_back(&mut sRow);
        let sRowOne = vector::pop_back(&mut sRow);

        let tRowThree = vector::pop_back(&mut tRow);
        let tRowTwo = vector::pop_back(&mut tRow);
        let tRowOne = vector::pop_back(&mut tRow);

        let (i,j) = (0,0);

        while (i < 3){
            while (j < 3){
                if ((i as u8) == xIndex && (j as u8) == yIndex){
                    if (xIndex == 0){
                        if (yIndex == 0){
                            return (vector[
                                vector[value,fRowTwo,fRowThree],
                                vector[sRowOne,sRowTwo,sRowThree],
                                vector[tRowOne,tRowTwo,tRowThree],
                            ],vector[
                                vector[value,fRowTwo,fRowThree],
                                vector[sRowOne,sRowTwo,sRowThree],
                                vector[tRowOne,tRowTwo,tRowThree],
                            ])
                        }else if (yIndex == 1){
                            return (vector[
                                vector[fRowOne,value,fRowThree],
                                vector[sRowOne,sRowTwo,sRowThree],
                                vector[tRowOne,tRowTwo,tRowThree],
                            ],vector[
                                vector[fRowOne,value,fRowThree],
                                vector[sRowOne,sRowTwo,sRowThree],
                                vector[tRowOne,tRowTwo,tRowThree],
                            ])
                        }else {
                            return (vector[
                                vector[fRowOne,fRowTwo,value],
                                vector[sRowOne,sRowTwo,sRowThree],
                                vector[tRowOne,tRowTwo,tRowThree],
                            ],vector[
                                vector[fRowOne,fRowTwo,value],
                                vector[sRowOne,sRowTwo,sRowThree],
                                vector[tRowOne,tRowTwo,tRowThree],
                            ])
                        };
                    }else if (xIndex == 1){
                        if (yIndex == 0){
                            return (vector[
                                vector[fRowOne,fRowTwo,fRowThree],
                                vector[value,sRowTwo,sRowThree],
                                vector[tRowOne,tRowTwo,tRowThree],
                            ],vector[
                                vector[fRowOne,fRowTwo,fRowThree],
                                vector[value,sRowTwo,sRowThree],
                                vector[tRowOne,tRowTwo,tRowThree],
                            ])
                        }else if (yIndex == 1){
                            return (vector[
                                vector[fRowOne,fRowTwo,fRowThree],
                                vector[sRowOne,value,sRowThree],
                                vector[tRowOne,tRowTwo,tRowThree],
                            ],vector[
                                vector[fRowOne,fRowTwo,fRowThree],
                                vector[sRowOne,value,sRowThree],
                                vector[tRowOne,tRowTwo,tRowThree],
                            ])
                        }else {
                            return (vector[
                                vector[fRowOne,fRowTwo,fRowThree],
                                vector[sRowOne,sRowTwo,value],
                                vector[tRowOne,tRowTwo,tRowThree],
                            ],vector[
                                vector[fRowOne,fRowTwo,fRowThree],
                                vector[sRowOne,sRowTwo,value],
                                vector[tRowOne,tRowTwo,tRowThree],
                            ])
                        };
                    }else {
                        if (yIndex == 0){
                            return (vector[
                                vector[fRowOne,fRowTwo,fRowThree],
                                vector[sRowOne,sRowTwo,sRowThree],
                                vector[value,tRowTwo,tRowThree],
                            ],vector[
                                vector[fRowOne,fRowTwo,fRowThree],
                                vector[sRowOne,sRowTwo,sRowThree],
                                vector[value,tRowTwo,tRowThree],
                            ])
                        }else if (yIndex == 1){
                            return (vector[
                                vector[fRowOne,fRowTwo,fRowThree],
                                vector[sRowOne,sRowTwo,sRowThree],
                                vector[tRowOne,value,tRowThree],
                            ],vector[
                                vector[fRowOne,fRowTwo,fRowThree],
                                vector[sRowOne,sRowTwo,sRowThree],
                                vector[tRowOne,value,tRowThree],
                            ])
                        }else {
                            return (vector[
                                vector[fRowOne,fRowTwo,fRowThree],
                                vector[sRowOne,sRowTwo,sRowThree],
                                vector[tRowOne,tRowTwo,value],
                            ],vector[
                                vector[fRowOne,fRowTwo,fRowThree],
                                vector[sRowOne,sRowTwo,sRowThree],
                                vector[tRowOne,tRowTwo,value],
                            ])
                        };
                    };
                };
                j = j + 1;
            };
            j = 0;
            i = i + 1;
        };
        return (vector[
            vector[fRowOne,fRowTwo,fRowThree],
            vector[sRowOne,sRowTwo,sRowThree],
            vector[tRowOne,tRowTwo,tRowThree],
        ],vector[
            vector[fRowOne,fRowTwo,fRowThree],
            vector[sRowOne,sRowTwo,sRowThree],
            vector[tRowOne,tRowTwo,tRowThree],
        ])
    }

    fun gameover(board: vector<vector<u8>>): (bool,u8) {
        let tRow = vector::pop_back(&mut board);
        let sRow = vector::pop_back(&mut board);
        let fRow = vector::pop_back(&mut board);

        let fRowThree = vector::pop_back(&mut fRow);
        let fRowTwo = vector::pop_back(&mut fRow);
        let fRowOne = vector::pop_back(&mut fRow);

        let sRowThree = vector::pop_back(&mut sRow);
        let sRowTwo = vector::pop_back(&mut sRow);
        let sRowOne = vector::pop_back(&mut sRow);

        let tRowThree = vector::pop_back(&mut tRow);
        let tRowTwo = vector::pop_back(&mut tRow);
        let tRowOne = vector::pop_back(&mut tRow);

        if (fRowOne != 0 && fRowOne == fRowTwo && fRowTwo == fRowThree){
            return (true, fRowOne)
        }else if (sRowOne != 0 && sRowOne == sRowTwo && sRowTwo ==sRowThree){
            return (true, sRowOne)
        }else if (tRowOne != 0 && tRowOne == tRowTwo && tRowTwo == tRowThree){
            return (true, tRowOne)
        };


        if (fRowOne != 0 && fRowOne == sRowTwo && fRowOne == tRowThree){
            return (true, fRowOne)
        };
        if (fRowThree != 0 && fRowThree == sRowTwo && sRowTwo == tRowOne){
            return (true, fRowThree)
        };
        if (fRowTwo != 0 && fRowTwo == sRowTwo && sRowTwo == tRowTwo){
            return (true, fRowTwo)
        };

        if (fRowOne == 0 || fRowTwo == 0 || fRowThree == 0 || sRowOne == 0 || sRowTwo == 0 || sRowThree == 0 || tRowOne == 0 || tRowTwo == 0 || tRowThree == 0){
            return (false, 0)
        };
        return (true, 0)
    }

    fun findFreePoint(v: &vector<vector<u8>>, randomNum: u64): (u8,u8){
        while (randomNum < 6){
            let yV = vector::borrow(v, (randomNum) % 3);

            let r = vector::borrow(yV, (randomNum + 1) % 3);
            if (r == &0){
                return ((randomNum as u8), ((randomNum + 1) % 3 as u8))
            };
            let r = vector::borrow(yV, (randomNum + 2) % 3);
            if (r == &0){
                return ((randomNum as u8), ((randomNum + 2) % 3 as u8))
            };
            let r = vector::borrow(yV, (randomNum + 3) % 3);
            if (r == &0){
                return ((randomNum as u8), ((randomNum + 2) % 3 as u8))
            };
            randomNum = randomNum + 1
        };
        return (0,0)
    }

    fun random(clock: &Clock): u64{
        let time = clock::timestamp_ms(clock);
        return (time % 3)
    }
}
