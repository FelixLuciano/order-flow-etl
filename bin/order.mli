open Mainlib.Series

module Order : sig
  include Series

  type status = Pending | Complete | Cancelled
  type origin = Online | Physical
  type t = {
    id :         int;
    order_date : string;
    status :     status;
    origin :     origin;
  }
  type t_constructor = int * string * string * string
  val orderStatus_to_string : status -> string
  val orderStatus_from_string : string -> status
  val orderOrigin_to_string : origin -> string
  val orderOrigin_from_string : string -> origin
  val create : int -> string -> string -> string -> t
  val constructor : t_constructor -> t
  val print : t -> unit
end ;;
