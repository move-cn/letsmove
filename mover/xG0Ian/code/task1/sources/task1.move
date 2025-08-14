module task1::task1 {
    use sui::tx_context::sender;

    public struct Hello has key {
        id: UID
    }

    fun init(ctx: &mut TxContext) {
        transfer::transfer(Hello{
            id: object::new(ctx)
        }, sender(ctx))
    }

    #[test_only] use sui::test_scenario;

    #[test]
    fun test_task1() {
        let addr1 = @0xA;
        let mut scenario = test_scenario::begin(addr1);
        init(test_scenario::ctx(&mut scenario));
        test_scenario::end(scenario);  
    }

}