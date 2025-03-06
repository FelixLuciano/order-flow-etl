module Dataframe : functor (S : Series.Series) -> sig
  type t = { mutable data : S.t list; }

  val init    : t
  val append  : t -> S.t -> S.t
  val push    : t -> S.t_constructor -> S.t
  val tail    : t -> int -> S.t
end
