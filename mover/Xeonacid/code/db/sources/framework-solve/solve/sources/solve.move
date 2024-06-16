module solve::solve {

    // [*] Import dependencies
    use challenge::Otter::{Self, OTTER};
    use sui::random::Random;

    const QUEST_LIMIT: u64 = 25;
    #[allow(lint(public_random))]
    public fun solve(
        _vault: &mut Otter::Vault<OTTER>,
        _questboard: &mut Otter::QuestBoard,
        _player: &mut Otter::Player,
        _r: &Random,
        _ctx: &mut TxContext,
    ) {
        challenge::Otter::buy_sword(_vault, _player, _ctx);
        challenge::Otter::find_a_monster(_questboard, _r, _ctx);
        challenge::Otter::fight_monster(_questboard, _player, 0);
        challenge::Otter::return_home(_questboard, 0);

        let mut times = 0;
        while(times < 5) {
            let mut i = 1;
            while (i < QUEST_LIMIT) {
                challenge::Otter::find_a_monster(_questboard, _r, _ctx);
                i = i + 1;
            };
            i = 1;
            while (i < QUEST_LIMIT) {
                challenge::Otter::get_the_reward(_vault, _questboard, _player, 0, _ctx);
                i = i + 1;
            };
            times = times + 1;
        };

        let flag = challenge::Otter::buy_flag(_vault, _player, _ctx);
        challenge::Otter::prove(_questboard, flag);
    }

}
