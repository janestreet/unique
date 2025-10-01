open! Base
open! Import

(** Dynamically checked references that can only be accessed once. *)
type 'a t

(** [make a] creates a reference to a [once unique] value [a]. *)
val make : 'a -> 'a t

(** [get_or_null t] returns the value inside [t], or [Null] if it was already accessed. *)
val get_or_null : 'a t -> 'a or_null

(** [get_exn t] returns the value inside [t], or raises [Failure] if it was already
    accessed. *)
val get_exn : 'a t -> 'a

module Atomic : sig
  type !'a t

  (** [make a] creates a reference to a [once unique] value [a]. *)
  val make : 'a -> 'a t

  (** [get_opt t] returns the value inside [t], or [None] if it was already accessed. *)
  val get_opt : 'a. 'a t -> 'a option

  (** [get_exn t] returns the value inside [t], or raises [Failure] if it was already
      accessed. *)
  val get_exn : 'a. 'a t -> 'a
end

module Local : sig
  (** Dynamically checked reference to a local value that can only be accessed once. *)
  type 'a t

  (** [make a] creates a reference to a [local once unique] value [a]. *)
  val make : 'a -> 'a t

  (** [get_or_null t] returns the value inside [t], or [Null] if it was already accessed. *)
  val get_or_null : 'a t -> 'a or_null

  (** [get_exn t] returns the value inside [t], or raises [Failure] if it was already
      accessed. *)
  val get_exn : 'a t -> 'a
end
