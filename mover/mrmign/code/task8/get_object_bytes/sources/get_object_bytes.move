/*
/// Module: get_object_bytes
module get_object_bytes::get_object_bytes;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module get_object_bytes::get_object_bytes;

use sui::bcs;
use sui::event;

public struct ObjectBytes has copy, drop {
    bytes: vector<u8>,
}

public entry fun get_object_bytes<T: key>(object: &T) {
    let bytes = bcs::to_bytes<T>(object);
    event::emit(ObjectBytes { bytes });
}

// 6sN8PQXbDJRUPY7XRQNWJvB6m4iFHgq2TUttKGfTYqav