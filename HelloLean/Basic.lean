def hello := "world"

namespace sample
def name := "bob"
end sample


def short.name := "b"
def short.sig := "a"


namespace nest
namespace sampleA
def param := 42
end sampleA

namespace sampleB
def param := true
end sampleB
end nest
