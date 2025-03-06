module type Series = sig
  type t
  type t_constructor

  val constructor : t_constructor -> t
end
