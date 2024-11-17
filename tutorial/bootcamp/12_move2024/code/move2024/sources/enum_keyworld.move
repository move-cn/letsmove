module move2024::enum_keyworld {

    public enum Action {
        Stop,
        Pause { duration: u32 },
        MoveTo { x: u64, y: u64 },
        Jump(u64),
    }

    public struct V has copy,store,drop{
        id: UID,
        action: Action
    }



    public struct Abc has key{
        id: UID,
        action: Action
    }



    public enum Action {
        Up,
        Down,
        Left,
        RIGTH,
    }




}
