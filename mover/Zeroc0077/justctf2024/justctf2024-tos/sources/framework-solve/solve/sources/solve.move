module solve::solve {

    // [*] Import dependencies
    use challenge::theotterscrolls;

    public fun solve(
        _spellbook: &mut theotterscrolls::Spellbook,
        _ctx: &mut TxContext
    ) {
        let seq = &mut vector::empty<u64>();
        vector::push_back(seq, 1);
        vector::push_back(seq, 0);
        vector::push_back(seq, 3);
        vector::push_back(seq, 3);
        vector::push_back(seq, 3);
        challenge::theotterscrolls::cast_spell(*seq, _spellbook);
    }

}
