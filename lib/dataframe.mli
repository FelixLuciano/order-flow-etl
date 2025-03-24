module Dataframe : functor (S : Series.Series) -> sig
  type t = { mutable data : S.t list; }

  val constructor : S.t list -> t
  val init        : unit -> t
  val append      : t -> S.t -> S.t
  val push        : t -> string list -> S.t
  val tail        : t -> int -> S.t
  val filter      : (S.t -> bool) -> t -> t
  val map         : (S.t -> 'a) -> t -> 'a list
  val reduce      : (S.t -> 'a -> 'a) -> 'a -> t -> 'a
  val load        : t -> string list list -> unit
  val store       : t -> (string list list -> unit) -> unit
end
