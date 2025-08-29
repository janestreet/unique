type !'a t

external make : 'a. 'a -> ('a t[@local_opt]) = "%makemutable"
external get : 'a. ('a t[@local_opt]) -> 'a = "%field0"
external set : 'a. ('a t[@local_opt]) -> 'a -> unit = "%setfield0"

let[@inline] exchange t a =
  let a' = get (Basement.Stdlib_shim.Obj.magic_unique t) in
  set t a;
  a'
;;
