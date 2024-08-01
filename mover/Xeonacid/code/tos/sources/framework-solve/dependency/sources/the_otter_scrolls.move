module challenge::theotterscrolls {

    // ---------------------------------------------------
    // DEPENDENCIES
    // ---------------------------------------------------

    use sui::table::{Self, Table};
    use std::string::{Self, String};
    use std::debug;

    // ---------------------------------------------------
    // STRUCTS
    // ---------------------------------------------------

    public struct Spellbook has key {
        id: UID,
        casted: bool,
        spells: Table<u8, vector<String>>
    }

    // ---------------------------------------------------
    // FUNCTIONS
    // ---------------------------------------------------

    //The spell consists of five magic words, which have to be read in the correct order!

    fun init(ctx: &mut TxContext) {
        
        let mut all_words = table::new(ctx);

        let fire = vector[
            string::utf8(b"Blast"),
            string::utf8(b"Inferno"),
            string::utf8(b"Pyre"),
            string::utf8(b"Fenix"),
            string::utf8(b"Ember")
        ];

        let wind = vector[
            string::utf8(b"Zephyr"),
            string::utf8(b"Swirl"),
            string::utf8(b"Breeze"),
            string::utf8(b"Gust"),
            string::utf8(b"Sigil")
        ];

        let water = vector[
            string::utf8(b"Aquarius"),
            string::utf8(b"Mistwalker"),
            string::utf8(b"Waves"),
            string::utf8(b"Call"),
            string::utf8(b"Storm")
        ];

        let earth = vector[
            string::utf8(b"Tremor"),
            string::utf8(b"Stoneheart"),
            string::utf8(b"Grip"),
            string::utf8(b"Granite"),
            string::utf8(b"Mudslide")
        ];

        let power = vector[
            string::utf8(b"Alakazam"),
            string::utf8(b"Hocus"),
            string::utf8(b"Pocus"),
            string::utf8(b"Wazzup"),
            string::utf8(b"Wrath")
        ];

        table::add(&mut all_words, 0, fire); 
        table::add(&mut all_words, 1, wind); 
        table::add(&mut all_words, 2, water); 
        table::add(&mut all_words, 3, earth); 
        table::add(&mut all_words, 4, power); 

        let spellbook = Spellbook {
            id: object::new(ctx),
            casted: false,
            spells: all_words
        };

        transfer::share_object(spellbook);
    }

    public fun cast_spell(spell_sequence: vector<u64>, book: &mut Spellbook) {

        let fire = table::remove(&mut book.spells, 0);
        let wind = table::remove(&mut book.spells, 1);
        let water = table::remove(&mut book.spells, 2);
        let earth = table::remove(&mut book.spells, 3);
        let power = table::remove(&mut book.spells, 4);

        let fire_word_id = *vector::borrow(&spell_sequence, 0);
        let wind_word_id = *vector::borrow(&spell_sequence, 1);
        let water_word_id = *vector::borrow(&spell_sequence, 2);
        let earth_word_id = *vector::borrow(&spell_sequence, 3);
        let power_word_id = *vector::borrow(&spell_sequence, 4);

        let fire_word = vector::borrow(&fire, fire_word_id);
        let wind_word = vector::borrow(&wind, wind_word_id);
        let water_word = vector::borrow(&water, water_word_id);
        let earth_word = vector::borrow(&earth, earth_word_id);
        let power_word = vector::borrow(&power, power_word_id);

        if (fire_word == string::utf8(b"Inferno")) {
            if (wind_word == string::utf8(b"Zephyr")) {
                if (water_word == string::utf8(b"Call")) {
                    if (earth_word == string::utf8(b"Granite")) {
                        if (power_word == string::utf8(b"Wazzup")) {
                            book.casted = true;
                        }
                    }
                }
            }
        }
  
    }

    public fun check_if_spell_casted(book: &Spellbook): bool {
        let casted = book.casted;
        assert!(casted == true, 1337);
        casted
    }

}

