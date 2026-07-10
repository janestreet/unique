open! Import

(** A lock-free multi-producer, single-consumer queue of [once unique] elements. *)
type 'a t

(** [create ()] creates a new empty queue.

    The optional [padded] argument specifies whether to pad the data structure to avoid
    false sharing. See {!Atomic.make} for a longer explanation. *)
val create : ?padded:bool -> unit -> 'a t

(** [is_empty t] determines whether the queue [t] is empty. *)
val is_empty : 'a t -> bool

(** [dequeue_or_null t] atomically removes an element [x] from the front of the queue [t]
    and returns [This x] or does nothing and returns [Null] in case the queue is empty. *)
val dequeue_or_null : 'a t -> 'a or_null

(** [dequeue_all t] atomically removes all elements from the queue [t] and returns them as
    a list in front to back order. *)
val dequeue_all : 'a t -> 'a list

(** [enqueue t x] atomically adds [x] to the back of the queue [t]. *)
val enqueue : 'a t -> 'a -> unit
