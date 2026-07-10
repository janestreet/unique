include Basement.Or_null_shim.Export
include Basement.Modes

let failwith = Basement.Stdlib_shim.failwith

type nothing = |

external magic_many : 'a. 'a -> 'a = "%identity"
external magic_unique : 'a. ('a[@local_opt]) -> ('a[@local_opt]) = "%identity"
external magic_unique__portended : 'a. ('a[@local_opt]) -> ('a[@local_opt]) = "%identity"
external phys_equal : 'a. 'a -> 'a -> bool = "%eq"
