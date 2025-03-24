open Mainlib.Series

module Order : sig
  include Series

  type status = Pending | Complete | Cancelled
  type origin = Online | Physical
  type t = {
    id :         int;
    client_id :  int;
    order_date : string;
    status :     status;
    origin :     origin;
  }
  val string_of_orderStatus : status -> string
  val orderStatus_of_string : string -> status
  val string_of_orderOrigin : origin -> string
  val orderOrigin_of_string : string -> origin
  val create : int -> int -> string -> string -> string -> t
  val constructor : string list -> t
  val dump : t -> string list
  val print : t -> unit
end ;;
