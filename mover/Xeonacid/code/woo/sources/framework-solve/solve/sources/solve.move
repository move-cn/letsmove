module solve::solve {

    // [*] Import dependencies
    use challenge::Otter::{Self, OTTER};

    const QUEST_LIMIT: u64 = 25;
    public fun solve(
        _board: &mut Otter::QuestBoard,
        _vault: &mut Otter::Vault<OTTER>,
        _player: &mut Otter::Player,
        _ctx: &mut TxContext
    ) {
        let mut ticket = challenge::Otter::enter_tavern(_player);
        challenge::Otter::buy_power_of_friendship(_player, &mut ticket);
        challenge::Otter::checkout(ticket, _player, _ctx, _vault, _board);

        let mut i = 0;
        while (i < QUEST_LIMIT) {
            challenge::Otter::find_a_monster(_board, _player);
            i = i + 1;
        };
        challenge::Otter::bring_it_on(_board, _player, 0);
        challenge::Otter::return_home(_board, _player);
        challenge::Otter::get_the_reward(_vault, _board, _player, _ctx);
        i = 1;
        while (i < QUEST_LIMIT) {
            let mut ticket = challenge::Otter::enter_tavern(_player);
            challenge::Otter::buy_shield(_player, &mut ticket);
            challenge::Otter::get_the_reward(_vault, _board, _player, _ctx);
            challenge::Otter::checkout(ticket, _player, _ctx, _vault, _board);
            i = i + 1;
        };

        let mut ticket = challenge::Otter::enter_tavern(_player);
        challenge::Otter::buy_flag(&mut ticket, _player);
        challenge::Otter::checkout(ticket, _player, _ctx, _vault, _board);
    }

}
