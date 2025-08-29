(** References to unique values, like [std::Cell] in Rust.

    Allows creating multiple references to a single [unique] value. Accessing the stored
    value requires either [unique] access to the reference, or inserting another value
    into the reference to replace it. *)

type !'a t

(** [make a] creates a new reference containing the given value [a]. *)
external make : 'a. 'a -> ('a t[@local_opt]) = "%makemutable"

(** [get t] destroys [t] to extract the value inside. *)
external get : 'a. ('a t[@local_opt]) -> 'a = "%field0"

(** [set t a] overrides the stored value inside [t] with [a]. *)
external set : 'a. ('a t[@local_opt]) -> 'a -> unit = "%setfield0"

(** [exchange t a] extracts the value inside [t], replacing it with [a]. *)
val exchange : 'a. 'a t -> 'a -> 'a
