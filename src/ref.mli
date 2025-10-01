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

module Local : sig
  (** A reference to a local unique value. *)

  type !'a t

  (** [make a] creates a new local reference to containing the local value [a] *)
  external make : 'a. 'a -> 'a t = "%makemutable"

  (** [get t] destroys [t] to extract the value inside. *)
  external get : 'a. 'a t -> 'a = "%field0"

  (** [set_global t a] replaces the stored value inside [t] with the global value [a].

      The value must be global as the reference may be accessible at higher scopes. *)
  external set_global : 'a. 'a t -> 'a -> unit = "%setfield0"

  (** [exchange_global t a] extracts the value inside [t], replacing it with the global
      value [a].

      The value [a] must be global as the reference may be accessible at higher scopes. *)
  val exchange_global : 'a. 'a t -> 'a -> 'a
end
