module move2024::enum_keyworld {

    public enum Action {
        Stop,
        Pause { duration: u32 },
        MoveTo { x: u64, y: u64 },
        Jump(u64),
    }
}
