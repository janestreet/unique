open! Import

(** Dynamically checked references that can only be accessed once. *)
type 'a t

(** [make a] creates a reference to a [once unique] value [a]. *)
val make : 'a -> 'a t

(** [take_or_null t] returns the value inside [t], or [Null] if it was already accessed. *)
val take_or_null : 'a t -> 'a or_null

(** [take_exn t] returns the value inside [t], or raises [Failure] if it was already
    accessed. *)
val take_exn : 'a t -> 'a

(** [is_taken t] is whether or not [t] has already been taken. *)
val is_taken : 'a t -> bool

(** [borrow_or_null t ~f] temporarily borrows the value inside [t], passing it to [f],
    then restores it. Returns [Null] if [t] was already accessed. If [f] raises, the value
    is restored before re-raising. *)
val borrow_or_null : 'a 'r. 'a t -> f:('a -> 'r) -> 'r or_null

(** [borrow_exn t ~f] temporarily borrows the value inside [t], passing it to [f], then
    restores it. Raises [Failure] if [t] was already accessed. If [f] raises, the value is
    restored before re-raising. *)
val borrow_exn : 'a 'r. 'a t -> f:('a -> 'r) -> 'r

module Atomic : sig
  type !'a t

  (** [make a] creates a reference to a [once unique] value [a]. *)
  val make : 'a -> 'a t

  (** [take_or_null t] returns the value inside [t], or [Null] if it was already accessed. *)
  val take_or_null : 'a. 'a t -> 'a or_null

  (** [take_exn t] returns the value inside [t], or raises [Failure] if it was already
      accessed. *)
  val take_exn : 'a. 'a t -> 'a

  (** [is_taken t] is whether or not [t] has already been taken. *)
  val is_taken : 'a t -> bool

  (** [borrow_or_null t ~f] temporarily borrows the value inside [t], passing it to [f],
      then restores it. Returns [Null] if [t] was already accessed. If [f] raises, the
      value is restored before re-raising.

      If multiple threads simultaneously call [borrow_or_null], only one will successfully
      borrow the value, and the rest will return [Null]. *)
  val borrow_or_null : 'a 'r. 'a t -> f:('a -> 'r) -> 'r or_null

  (** [borrow_exn t ~f] temporarily borrows the value inside [t], passing it to [f], then
      restores it. Raises [Failure] if [t] was already accessed. If [f] raises, the value
      is restored before re-raising.

      If multiple threads simultaneously call [borrow_or_null], only one will successfully
      borrow the value, and the rest will raise. *)
  val borrow_exn : 'a 'r. 'a t -> f:('a -> 'r) -> 'r
end

module Local : sig
  (** Dynamically checked reference to a local value that can only be accessed once. *)
  type 'a t

  (** [make a] creates a reference to a [local once unique] value [a]. *)
  val make : 'a -> 'a t

  (** [take_or_null t] returns the value inside [t], or [Null] if it was already accessed. *)
  val take_or_null : 'a t -> 'a or_null

  (** [take_exn t] returns the value inside [t], or raises [Failure] if it was already
      accessed. *)
  val take_exn : 'a t -> 'a
end
