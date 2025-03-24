open Mainlib.Series

module OrderItem : sig
  include Series

  type t = {
    item_id :  int;
    order_id : int;
    quantity : int;
    price :    float;
    tax :      float;
  }

  val columns : (string * string * string * string * string) list
  val create : int -> int -> int -> float -> float -> t
  val construct : string list -> t
  val dump : t -> string list

end ;;
