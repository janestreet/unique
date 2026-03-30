type 'a t = 'a Base.Or_null.t Ref.t

let[@inline] make v = Ref.make (Base.This v)
let[@inline] get_or_null t = Ref.exchange t Base.Null

let[@inline] get_exn t =
  match Ref.exchange t Base.Null with
  | Null -> Base.failwith "Once.get_exn failed: already accessed"
  | This v -> v
;;

module Atomic = struct
  type 'a t = 'a Base.Or_null.t Atomic.t

  let[@inline] make v = Atomic.make (Base.This v)
  let[@inline] get_or_null t = Atomic.exchange t Base.Null

  let[@inline] get_exn t =
    match Atomic.exchange t Base.Null with
    | Null -> Base.failwith "Once.get_exn failed: already accessed"
    | This v -> v
  ;;
end

module Local = struct
  type 'a t = 'a Base.Or_null.t Ref.Local.t

  let make v = Ref.Local.make (Base.This v)
  let get_or_null t = Ref.Local.exchange_global t Base.Null

  let get_exn t =
    match get_or_null t with
    | Null -> failwith "Once.Local.get_exn failed: already accessed"
    | This v -> v
  ;;
end
