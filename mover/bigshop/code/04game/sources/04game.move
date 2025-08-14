/// Module: 04game
module game::guess {
    use sui::clock::{Self,Clock};
    use std::string;
    use sui::event;
    
    public struct Game has key, store{
        id: UID,
        answer: u8
    }

    public struct ResultEvent has copy, drop{
        success: bool,
        message: string::String,
    }

    public entry fun create_game(clock: &Clock,ctx: &mut TxContext){
        let answer = (clock::timestamp_ms(clock) % 100);
        let game = Game{
            id: object::new(ctx),
            answer: (answer as u8),
        };
        transfer::public_share_object(game);
    }
    
    public entry fun play(number: u8,game: &mut Game) {
        if  (number == game.answer) {
            event::emit(ResultEvent{
                success: true,
                message: string::utf8(b"恭喜！你答对了")
            });
        } else  {
            if  (number < game.answer) {
                event::emit(ResultEvent{
                    success: false,
                    message: string::utf8(b"小了，再试试")
                });
            } else {
                event::emit(ResultEvent{
                    success: false,
                    message: string::utf8(b"大了，再试试")
                });
            };
        };
    }
}

