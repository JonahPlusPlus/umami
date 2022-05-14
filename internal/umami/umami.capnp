@0x9068dbeb0e5b4a71;
using Go = import "/go.capnp";
$Go.package("umami");
$Go.import("github.com/JonahPlusPlus/umami/internal/umami");

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
    open @0 (name :Text) -> (result :Node);
    insert @1 (name: Text, node :Node) -> ();
    remove @2 (name: Text) -> (result :Node);
    contains @3 (name :Text) -> (result :Bool);
}

interface Leaf extends (Node) {
    # Value (endpoint)
    read @0 () -> (result :Value);
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
    getToken @0 (id :Text, passcode :Text) -> (result :Text);
    getRoot @1 (token :Text) -> (result :Node);
}
