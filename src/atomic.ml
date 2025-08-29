type !'a t

external make : 'a. 'a -> ('a t[@local_opt]) = "%makemutable"
external get : 'a. 'a t -> 'a = "%atomic_load"
external set : 'a. 'a t -> 'a -> unit = "caml_atomic_set_stub"
external exchange : 'a. 'a t -> 'a -> 'a = "%atomic_exchange"

external compare_and_set
  : 'a.
  'a t -> if_phys_equal_to:'a -> replace_with:'a -> Basement.Compare_failed_or_set_here.t
  = "%atomic_cas"
