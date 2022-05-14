using Go = import "/go.capnp";
$Go.package("proto")
$Go.import("github.com/JonahPlusPlus/umami/internal/proto")

struct ResultA(T) {
    union {
        success @0 :T;
        error @1 :Text;
    }
}

struct Map(K, V) {
    entries @0 :List(Entry);
    struct Entry {
        key @0 :K;
        value @1 :V;
    }
}

interface Node {}

interface Tree extends (Node) {
    # Map (names)
    open @0 (name :Text) -> (result :ResultA(Node));
    insert @1 (name: Text, node :Node) -> (result :ResultA(Void));
    remove @2 (name: Text) -> (result :ResultA(Node));
    contains @3 (name :Text) -> (result :ResultA(Bool));
}

interface Leaf extends (Node) {
    # Value (endpoint)
    read @0 () -> (result :ResultA(Value));
    struct Value {
        union {
            void @0  :Void;
            bool @1  :Bool;
            i8   @2  :Int8;
            i16  @3  :Int16;
            i32  @4  :Int32;
            i64  @5  :Int64;
            u8   @6  :UInt8;
            u16  @7  :UInt16;
            u32  @8  :UInt32;
            u64  @9  :UInt64;
            f32  @10 :Float32;
            f64  @11 :Float64;
            arr  @12 :List(Value);
            str  @13 :Text;
        }
    }
}

interface Umami {
    getToken @0 (id :Text, passcode :Text) -> (result :ResultA(Text));
    getRoot @1 (token :Text) -> (result :ResultA(Node));
}
