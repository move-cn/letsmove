module solve::solve {

    // [*] Import dependencies
    use challenge::theotterscrolls;

    public fun solve(
        _spellbook: &mut theotterscrolls::Spellbook,
        _ctx: &mut TxContext
    ) {
        let spell_sequence = vector[1, 0, 3, 3, 3];
        challenge::theotterscrolls::cast_spell(spell_sequence, _spellbook);
    }

}
