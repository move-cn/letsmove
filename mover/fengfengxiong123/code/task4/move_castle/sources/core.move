module move_castle::core {

    // 可以修改设置能力
    public struct AdminCap has key {
        id: UID
    }

    public struct CastleData has store {
        id: ID,
        size: u64,
        race: u64,
        level: u64,
        experience_pool: u64,
        economy: Economy,
        millitary: Millitary,
    }

    public struct Economy has store {
        treasury: u64,
        base_power: u64,
        settle_time: u64,
        soldier_buff: EconomicBuff,
        battle_buff: vector<EconomicBuff>,
    }

    public struct Millitary has store {
        attack_power: u64,
        defense_power: u64,
        total_attack_power: u64,
        total_defense_power: u64,
        soldiers: u64,
        battle_cooldown: u64
    }

    public struct EconomicBuff has copy, store, drop {
        debuff: bool,
        power: u64,
        start: u64,
        end: u64,
    }

    // 存储公共数据,共享对象
    public struct GameStore has key, store {
        id: UID,
        small_castle_count: u64,
        middle_castle_count: u64,
        big_castle_count: u64,
        castle_ids: vector<ID>,
    }

    fun init(ctx: &mut TxContext) {
        transfer::transfer(AdminCap { id: object::new(ctx) }, tx_context::sender(ctx));
        transfer::share_object(
            GameStore {
                id: object::new(ctx),
                small_castle_count: 0,
                middle_castle_count: 0,
                big_castle_count: 0,
                castle_ids: vector::empty<ID>()
            }
        );
    }

    /// 城堡种族 - 人类
    const CASTLE_RACE_HUMAN: u64 = 0;
    /// 城堡种族 - 精灵
    const CASTLE_RACE_ELF: u64 = 1;
    /// 城堡种族 - 兽人
    const CASTLE_RACE_ORCS: u64 = 2;
    /// 城堡种族 - 哥布林
    const CASTLE_RACE_GOBLIN: u64 = 3;
    /// 城堡种族 - 僵尸
    const CASTLE_RACE_UNDEAD: u64 = 4;

    /// 初始攻击力 - 人类城堡
    const INITIAL_ATTCK_POWER_HUMAN: u64 = 1000;
    /// 初始攻击力 - 精灵城堡
    const INITIAL_ATTCK_POWER_ELF: u64 = 500;
    /// 初始攻击力 - 兽人城堡
    const INITIAL_ATTCK_POWER_ORCS: u64 = 1500;
    /// 初始攻击力 - 哥布林城堡
    const INITIAL_ATTCK_POWER_GOBLIN: u64 = 1200;
    /// 初始攻击力 - 僵尸城堡
    const INITIAL_ATTCK_POWER_UNDEAD: u64 = 800;

    /// 初始防御力 - 人类城堡
    const INITIAL_DEFENSE_POWER_HUMAN: u64 = 1000;
    /// 初始防御力 - 精灵城堡
    const INITIAL_DEFENSE_POWER_ELF: u64 = 1500;
    /// 初始防御力 - 兽人城堡
    const INITIAL_DEFENSE_POWER_ORCS: u64 = 500;
    /// 初始防御力 - 哥布林城堡
    const INITIAL_DEFENSE_POWER_GOBLIN: u64 = 800;
    /// 初始防御力 - 僵尸城堡
    const INITIAL_DEFENSE_POWER_UNDEAD: u64 = 1200;

    fun get_initial_attack_defense_power(race: u64): (u64, u64) {
        let (attack, defense);

        if (race == CASTLE_RACE_HUMAN) {
            (attack, defense) = (INITIAL_ATTCK_POWER_HUMAN, INITIAL_DEFENSE_POWER_HUMAN);
        } else if (race == CASTLE_RACE_ELF) {
            (attack, defense) = (INITIAL_ATTCK_POWER_ELF, INITIAL_DEFENSE_POWER_ELF);
        } else if (race == CASTLE_RACE_ORCS) {
            (attack, defense) = (INITIAL_ATTCK_POWER_ORCS, INITIAL_DEFENSE_POWER_ORCS);
        } else if (race == CASTLE_RACE_GOBLIN) {
            (attack, defense) = (INITIAL_ATTCK_POWER_GOBLIN, INITIAL_DEFENSE_POWER_GOBLIN);
        } else if (race == CASTLE_RACE_UNDEAD) {
            (attack, defense) = (INITIAL_ATTCK_POWER_UNDEAD, INITIAL_DEFENSE_POWER_UNDEAD);
        } else {
            abort 0
        };

        (attack, defense)
    }

    /// 城堡大小 - 小型
    const CASTLE_SIZE_SMALL: u64 = 1;
    /// 城堡大小 - 中型
    const CASTLE_SIZE_MIDDLE: u64 = 2;
    /// 城堡大小 - 大型
    const CASTLE_SIZE_BIG: u64 = 3;

    /// 初始经济实力 - 小型城堡
    const INITIAL_ECONOMIC_POWER_SMALL_CASTLE: u64 = 100;
    /// 初始经济实力 - 中型城堡
    const INITIAL_ECONOMIC_POWER_MIDDLE_CASTLE: u64 = 150;
    /// 初始经济实力 - 大型城堡
    const INITIAL_ECONOMIC_POWER_BIG_CASTLE: u64 = 250;


    // 通过城堡大小获取初始经济实力
    fun get_initial_economic_power(size: u64): u64 {
        let power;
        if (size == CASTLE_SIZE_SMALL) {
            power = INITIAL_ECONOMIC_POWER_SMALL_CASTLE;
        } else if (size == CASTLE_SIZE_MIDDLE) {
            power = INITIAL_ECONOMIC_POWER_MIDDLE_CASTLE;
        } else if (size == CASTLE_SIZE_BIG) {
            power = INITIAL_ECONOMIC_POWER_BIG_CASTLE;
        } else {
            abort 0
        };
        power
    }
    /// 士兵攻击力 - 人类
    const SOLDIER_ATTACK_POWER_HUMAN : u64 = 100;
    /// 士兵防御力 - 人类
    const SOLDIER_DEFENSE_POWER_HUMAN : u64 = 100;
    /// 士兵攻击力 - 精灵
    const SOLDIER_ATTACK_POWER_ELF : u64 = 50;
    /// 士兵防御力 - 精灵
    const SOLDIER_DEFENSE_POWER_ELF : u64 = 150;
    /// 士兵攻击力 - 兽人
    const SOLDIER_ATTACK_POWER_ORCS : u64 = 150;
    /// 士兵防御力 - 兽人
    const SOLDIER_DEFENSE_POWER_ORCS : u64 = 50;
    /// 士兵攻击力 - 哥布林
    const SOLDIER_ATTACK_POWER_GOBLIN : u64 = 120;
    /// 士兵防御力 - 哥布林
    const SOLDIER_DEFENSE_POWER_GOBLIN : u64 = 80;
    /// 士兵攻击力 - 僵尸
    const SOLDIER_ATTACK_POWER_UNDEAD : u64 = 120;
    /// 士兵防御力 - 僵尸
    const SOLDIER_DEFENSE_POWER_UNDEAD : u64 = 80;

    /// 城堡单个士兵的攻击力和防御力
    public(package) fun get_castle_soldier_attack_defense_power(race: u64): (u64, u64) {
        let soldier_attack_power;
        let soldier_defense_power;
        if (race == CASTLE_RACE_HUMAN) {
            soldier_attack_power = SOLDIER_ATTACK_POWER_HUMAN;
            soldier_defense_power = SOLDIER_DEFENSE_POWER_HUMAN;
        } else if (race == CASTLE_RACE_ELF) {
            soldier_attack_power = SOLDIER_ATTACK_POWER_ELF;
            soldier_defense_power = SOLDIER_DEFENSE_POWER_ELF;
        } else if (race == CASTLE_RACE_ORCS) {
            soldier_attack_power = SOLDIER_ATTACK_POWER_ORCS;
            soldier_defense_power = SOLDIER_DEFENSE_POWER_ORCS;
        } else if (race == CASTLE_RACE_GOBLIN) {
            soldier_attack_power = SOLDIER_ATTACK_POWER_GOBLIN;
            soldier_defense_power = SOLDIER_DEFENSE_POWER_GOBLIN;
        } else if (race == CASTLE_RACE_UNDEAD) {
            soldier_attack_power = SOLDIER_ATTACK_POWER_UNDEAD;
            soldier_defense_power = SOLDIER_DEFENSE_POWER_UNDEAD;
        } else {
            abort 0
        };

        (soldier_attack_power, soldier_defense_power)
    }

    /// 通过种族和士兵数量获取初始士兵的攻击力和防御力
    fun get_initial_soldiers_attack_defense_power(race: u64, soldiers: u64): (u64, u64) {
        let (attack, defense) = get_castle_soldier_attack_defense_power(race);
        (attack * soldiers, defense * soldiers)
    }
}