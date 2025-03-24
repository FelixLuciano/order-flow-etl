module type Series = sig
  type t
  
  val columns : string list
  val constructor : string list -> t
  val dump : t -> string list
end
