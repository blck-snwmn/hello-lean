structure AppId (Tag : Type) where
  val : String
deriving Repr, DecidableEq, BEq, Hashable

namespace AppId
instance {Tag} : ToString (AppId Tag) where
  toString u := u.val

def of {Tag} (s : String) : AppId Tag := ⟨s⟩

end AppId

inductive UserTag    : Type | tag
inductive ProductTag : Type | tag

abbrev UserId    := AppId UserTag
abbrev ProductId := AppId ProductTag

def u : UserId    := AppId.of "alice"
def p : ProductId := AppId.of "sk-xxxxx"

-- def bad : UserId := p  -- type mismatch error
