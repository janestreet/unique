open! Import

(** A lock-free stack of [once unique] elements. *)
type !'a t

(** [create ()] creates a new empty stack.

    The optional [padded] argument specifies whether to pad the data structure to avoid
    false sharing. See {!Atomic.make} for a longer explanation. *)
val create : ?padded:bool -> unit -> 'a t

(** [is_empty t] determines whether the stack [t] is empty. *)
val is_empty : 'a t -> bool

(** [pop_or_null t] atomically removes an element [x] from the top of the stack [t] and
    returns [This x] or does nothing and returns [Null] in case the stack is empty. *)
val pop_or_null : 'a t -> 'a or_null

(** [pop_all t] atomically removes all elements from the stack [t] and returns them as a
    list in top to bottom order. *)
val pop_all : 'a t -> 'a list

(** [push t x] atomically adds [x] to the top of the stack [t]. *)
val push : 'a t -> 'a -> unit
