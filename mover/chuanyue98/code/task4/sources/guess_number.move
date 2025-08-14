module task4::GuessNumber{
    use sui::clock::{Self,Clock};
    use std::string;
    use sui::tx_context::{Self,TxContext};
    use sui::event;
    use sui::transfer;
    use sui::object::{Self,UID};
    struct Game has key{
        id: UID,
        answer: u8,
        attempts: u8,
    }
    struct GameResultEvent has copy, drop{
        success: bool,
        message: string::String,
    }
    public entry fun create_game(clock: &Clock,ctx: &mut TxContext){
        let answer = (clock::timestamp_ms(clock) % 100);
        let attempts = 5;
        let game = Game{
            id: object::new(ctx),
            answer: (answer as u8),
            attempts: attempts,
            };
        transfer::transfer(game, tx_context::sender(ctx));
    }
    
    public entry fun play(number: u8,game: &mut Game) {
       assert!(game.attempts > 0, 0);
        if  (number == game.answer) {
                event::emit(GameResultEvent{
                    success: true,
                    message: string::utf8(b"恭喜！你答对了")
                });
        } else  {
            if  (number < game.answer) {
                event::emit(GameResultEvent{
                    success: false,
                    message: string::utf8(b"小了，再试试")
                });
            } else {
                event::emit(GameResultEvent{
                    success: false,
                    message: string::utf8(b"大了，再试试")
                });
            };
        };
        game.attempts = game.attempts-1;
    }
}