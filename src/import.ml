type 'a or_null = 'a Basement.Or_null_shim.t =
  | Null
  | This of 'a

let failwith = Basement.Stdlib_shim.failwith
